<?php
// Путь до корня сайта
$_SERVER["DOCUMENT_ROOT"] = "/home/e/elenachehl/public_html";

// Запретит сбор статистики на данной странице
define("NO_KEEP_STATISTIC", true);

// Отключить проверку прав на доступ к файлам каталога
define("BX_CHECK_PERMISSIONS", true);

// Если данная константа инициализирована значением "true", то функция проверки агентов на запуск будет отбирать только те агенты для которых не
define("BX_CRONTAB", true);

// Определеяем файл логов
if (!file_exists($_SERVER["DOCUMENT_ROOT"]."/upload/import/logs_".date("d.m.Y"))) {
    mkdir($_SERVER["DOCUMENT_ROOT"]."/upload/import/logs_".date("d.m.Y"), 0755);
}
$name_log = "logs_".date("d.m.Y");
define("LOG_FILENAME", $_SERVER["DOCUMENT_ROOT"]."/upload/import/".$name_log."/log_UpdateBitrixCatalog.txt");

// Снимаем ограничение на время исполнения скрипта
set_time_limit(0);

// ID ифноблока
$IBLOCK_ID = 1;

// Путь до прайса
$URI = "/upload/import/Price.csv";

require($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/main/include/prolog_before.php");

class CSV {

    private $_csv_file = null;

    public function __construct($csv_file) {
        if (file_exists($csv_file)) { //если файл существует
            $this->_csv_file = $csv_file; // записываем путь к файлу в переменную
        } else { // Если файл не найден то вызываем исключение
            throw new Exception("Файл \"$csv_file\" не найден");
        }
    }

    public function getCSV() {
        $handle = fopen($this->_csv_file, "r"); //Открываем csv для чтения

        $array_line_full = array(); //Массив будет хранить данные из csv
        // Проходим весь csv-файл, и читаем построчно. 3-й параметр разделитель поля
        $array_title = array(); // Массив будет хранить заголовки
        while (($line = fgetcsv($handle, 0, ";")) !== FALSE) {
            if (!$array_title) {
                $line[0] = substr($line[0], 1);
                $array_title = $line;
            } else {
                foreach ($line as $cell => $value) {
                    if ($array_title[$cell]) {
                        $line[$array_title[$cell]] = $value;
                        unset($line[$cell]);
                    }
                }
                $array_line_full[] = $line; // Записываем строчки в массив
            }
        }
        fclose($handle); // Закрываем файл
        return $array_line_full; // Возвращаем прочтенные данные
    }
}

if (CModule::IncludeModule("iblock")) {
    $csv = new CSV($_SERVER["DOCUMENT_ROOT"].$URI); // Открываем csv

    $get_csv = $csv->getCSV();
    $arFilter["IBLOCK_ID"] = $IBLOCK_ID;

    // Параметры транслитирования
    $SecParams = Array(
        "max_len" => "500", // обрезает символьный код до 100 символов
        "change_case" => "L", // буквы преобразуются к нижнему регистру
        "replace_space" => "-", // меняем пробелы на нижнее подчеркивание
        "replace_other" => "-", // меняем левые символы на нижнее подчеркивание
        "delete_repeat_replace" => "true", // удаляем повторяющиеся нижние подчеркивания
        "use_google" => "false", // отключаем использование google
    );

    // Массивы разделов
    $arSectOne_Elements = [];
    $arSectTwo_Elements = [];

    function SearchSection ($iblock, $section_id, $name_cat) {
        $SSection = [];
        if ($section_id == 0) {
            $arFilterSection = Array("IBLOCK_ID" => $iblock, "NAME" => $name_cat);
        } else {
            $arFilterSection = Array("IBLOCK_ID" => $iblock, "IBLOCK_SECTION_ID" => $section_id, "NAME" => $name_cat);
        }
        $arSelectSection = Array("ID", "IBLOCK_SECTION_ID", "NAME");
        $db_Section = CIBlockSection::GetList(Array("NAME"=>"ASC"), $arFilterSection, false, $arSelectSection);
        while ($arSect_el = $db_Section->GetNext()) {
            $SSection = $arSect_el;
        }
        return $SSection;
    }

    foreach ($get_csv as $value) {
        $arFilter["PROPERTY_ARTICUL"][] = $value["Артикул"];
    }
    $arSelect = array("ID", "NAME", "PREVIEW_PICTURE", "PREVIEW_TEXT", "DETAIL_PICTURE", "DETAIL_TEXT", "IBLOCK_SECTION_ID", "PROPERTY_ARTICUL", "PROPERTY_COUNT", "PROPERTY_PRICE");
    $res = CIBlockElement::GetList(Array("PROPERTY_ARTICUL" => "ASC"), $arFilter, false, false, $arSelect);

    while ($ar_fields = $res->GetNext()) {
        $element[$ar_fields["PROPERTY_ARTICUL_VALUE"]][] = $ar_fields;
    }

    $el = new CIBlockElement;
    foreach ($get_csv as $csv_element) {
        if ($element[$csv_element["Артикул"]]) {

            // Товар найден
            echo "Товар найден<br>";
            foreach ($element[$csv_element["Артикул"]] as $ib_element) {

                // Поиск категории
                $arSectOne_Elements = [];
                $arSectOne_Elements = SearchSection($IBLOCK_ID, 0, $csv_element["Категория"]);

                if (!empty($arSectOne_Elements)) {
                    echo "Категория: ".$arSectOne_Elements["NAME"]." найдена<br>";

                    // Поиск подкатегории
                    $arSectTwo_Elements = [];
                    $arSectTwo_Elements = SearchSection($IBLOCK_ID, $arSectOne_Elements["ID"], $csv_element["Производитель"]);

                    if (!empty($arSectTwo_Elements)) {
                        echo "Производитель: ".$arSectTwo_Elements["NAME"]." найден<br>";

                        // Обновление товара
                        $PROP = array();
                        $PROP[1] = trim($csv_element["Артикул"]);
                        $PROP[3] = $csv_element["Количество"];
                        $PROP[2] = $csv_element["Цена"];

                        $arLoadProductArray = Array(
                            "IBLOCK_SECTION"  => $arSectTwo_Elements["ID"],
                            "PROPERTY_VALUES" => $PROP,
                            "NAME"            => trim($csv_element["Номенклатура"]),
                            "CODE"            => CUtil::translit(strip_tags(trim($csv_element["Номенклатура"])), "ru" , $SecParams),
                            "ACTIVE"          => "Y",
                            "PREVIEW_TEXT"    => $ib_element["PREVIEW_TEXT"],
                            "DETAIL_TEXT"     => $ib_element["DETAIL_TEXT"]
                        );

                        if ($el->Update($ib_element["ID"], $arLoadProductArray, false, true, true)) {
                            echo "Обновлен товар: ". trim($csv_element["Номенклатура"]) ."<br>";
                            AddMessage2Log("Обновлен товар - " . trim($csv_element["Номенклатура"]), "Товар");
                            // Запись в лог о создании товара
                        } else {
                            echo "Ошибка обновления товара: ".trim($csv_element["Номенклатура"])."<br>Произошла неизвестная ошибка: ".$el->LAST_ERROR;
                            AddMessage2Log("Произошла ошибка при обновлении товара - ". trim($csv_element["Номенклатура"]) ."\nТекст ошибки: ".$el->LAST_ERROR, "Товар");
                            // Пропуск товара для избежания непонятки и запись в лог
                        }
                    } else {
                        echo "Производитель: ".$csv_element["Производитель"]." не найден<br>";
                        $SecTwo = new CIBlockSection;

                        $newName = trim($csv_element["Производитель"]);
                        $SecTwoFields = Array(
                            "IBLOCK_ID" => $IBLOCK_ID,
                            "IBLOCK_SECTION_ID" => $arSectOne_Elements["ID"],
                            "NAME" => trim($csv_element["Производитель"]),
                            "CODE" => CUtil::translit(strip_tags($newName), "ru" , $SecParams)
                        );
                        $SecTwoID = $SecTwo->Add($SecTwoFields);
                        if ($SecTwoID > 0) {
                            echo "Производитель: ".$csv_element["Производитель"]." создан<br>";
                            AddMessage2Log("Создание производителя - ".$csv_element["Производитель"], "Производитель");

                            // Обновление товара
                            $PROP = array();
                            $PROP[1] = trim($csv_element["Артикул"]);
                            $PROP[3] = $csv_element["Количество"];
                            $PROP[2] = $csv_element["Цена"];

                            $arLoadProductArray = Array(
                                "IBLOCK_SECTION"  => $SecTwoID,
                                "PROPERTY_VALUES" => $PROP,
                                "NAME"            => trim($csv_element["Номенклатура"]),
                                "CODE"            => CUtil::translit(strip_tags(trim($csv_element["Номенклатура"])), "ru" , $SecParams),
                                "ACTIVE"          => "Y",
                                "PREVIEW_TEXT"    => $ib_element["PREVIEW_TEXT"],
                                "DETAIL_TEXT"     => $ib_element["DETAIL_TEXT"]
                            );

                            if ($el->Update($ib_element["ID"], $arLoadProductArray, false, true, true)) {
                                echo "Обновлен товар: ".trim($csv_element["Номенклатура"])."<br>";
                                AddMessage2Log("Обновлен товар - ".trim($csv_element["Номенклатура"]), "Товар");
                                // Запись в лог о создании товара
                            } else {
                                echo "Ошибка обновления товара: ".trim($csv_element["Номенклатура"])."<br>Произошла неизвестная ошибка: ".$el->LAST_ERROR;
                                AddMessage2Log("Произошла ошибка при обновлении товара - ".trim($csv_element["Номенклатура"])."\nТекст ошибки: ".$el->LAST_ERROR, "Товар");
                                // Пропуск товара для избежания непонятки и запись в лог
                            }
                        } else {
                            echo "Производитель: ".$csv_element["Производитель"]." не создан<br>Код товара: ".$newName."<br> Произошла неизвестная ошибка: ".$SecTwo->LAST_ERROR;
                            AddMessage2Log("Произошла ошибка при создании производителя - ".$csv_element["Производитель"]."\nТекст ошибки: ".$SecTwo->LAST_ERROR."\nПропускаем товар: ".$csv_element["Номенклатура"], "Производитель");
                            // пропуск товара для избежания непонятки и запись в лог
                        }
                    }
                } else {
                    echo "Категория: ".$csv_element["Категория"]." не найдена<br>";

                    $SecOne = new CIBlockSection;
                    $SecOneFields = Array(
                        "IBLOCK_ID" => $IBLOCK_ID,
                        "NAME" => $csv_element["Категория"],
                        "CODE" => CUtil::translit(strip_tags($csv_element["Категория"]), "ru" , $SecParams)
                    );
                    $SecOneID = $SecOne->Add($SecOneFields);
                    if ($SecOneID > 0) {
                        echo "Категория: ".$csv_element["Категория"]." создана<br>";
                        AddMessage2Log("Создание категории - ".$csv_element["Категория"], "Категории");

                        // Создание подкатегории и запись в лог
                        $SecTwo = new CIBlockSection;
                        $newName = trim($csv_element["Производитель"]);
                        $SecTwoFields = Array(
                            "IBLOCK_ID" => $IBLOCK_ID,
                            "IBLOCK_SECTION_ID" => $SecOneID,
                            "NAME" => $csv_element["Производитель"],
                            "CODE" => CUtil::translit(strip_tags($newName), "ru" , $SecParams)
                        );
                        $SecTwoID = $SecTwo->Add($SecTwoFields);
                        if ($SecTwoID > 0) {
                            echo "Производитель: ".$csv_element["Производитель"]." создан<br>";
                            AddMessage2Log("Создание производителя - ".$csv_element["Производитель"], "Производитель");

                            // Обновление товара
                            $PROP = array();
                            $PROP[1] = trim($csv_element["Артикул"]);
                            $PROP[3] = $csv_element["Количество"];
                            $PROP[2] = $csv_element["Цена"];

                            $arLoadProductArray = Array(
                                "IBLOCK_SECTION"  => $SecTwoID,
                                "PROPERTY_VALUES" => $PROP,
                                "NAME"            => trim($csv_element["Номенклатура"]),
                                "CODE"            => CUtil::translit(strip_tags(trim($csv_element["Номенклатура"])), "ru" , $SecParams),
                                "ACTIVE"          => "Y",
                                "PREVIEW_TEXT"    => $ib_element["PREVIEW_TEXT"],
                                "DETAIL_TEXT"     => $ib_element["DETAIL_TEXT"],
                            );

                            if ($el->Update($ib_element["ID"], $arLoadProductArray, false, true, true)) {
                                echo "Обновлен товар: ".trim($csv_element["Номенклатура"])."<br>";
                                AddMessage2Log("Обновлен товар - ".$csv_element["Номенклатура"], "Товар");
                                // Запись в лог о создании товара
                            } else {
                                echo "Ошибка обновления товара: ".trim($csv_element["Номенклатура"])."<br>Произошла неизвестная ошибка: ".$el->LAST_ERROR;
                                AddMessage2Log("Произошла ошибка при обновлении товара - ".trim($csv_element["Номенклатура"])."\nТекст ошибки: ".$el->LAST_ERROR, "Товар");
                                // Пропуск товара для избежания непонятки и запись в лог
                            }
                        } else {
                            echo "Производитель: ".$csv_element["Производитель"]." не создан<br>Код товара: ".$newName."<br> Произошла неизвестная ошибка: ".$SecTwo->LAST_ERROR;
                            AddMessage2Log("Произошла ошибка при создании производителя - ".$csv_element["Производитель"]."\nТекст ошибки: ".$SecTwo->LAST_ERROR."\nПропускаем товар: ".$csv_element["Номенклатура"], "Производитель");
                            // Пропуск товара для избежания непонятки и запись в лог
                        }
                    } else {
                        echo "Категория: ".$csv_element["Категория"]." не создана<br>Произошла неизвестная ошибка: ".$SecOne->LAST_ERROR;
                        AddMessage2Log("Произошла ошибка при создании категории - ".$csv_element["Категория"]."\nТекст ошибки: ".$SecOne->LAST_ERROR."\nПропускаем товар: ".$csv_element["Номенклатура"], "Категории");
                        // Пропуск товара для избежания непонятки и запись в лог
                    }
                }
            }
        } else {
            // Данного товара не найдено
            echo "Данного товара не найдено<br>";

            // Поиск категории
            $arSectOne_Elements = [];
            $arSectOne_Elements = SearchSection($IBLOCK_ID, 0, $csv_element["Категория"]);

            if (!empty($arSectOne_Elements)) {
                echo "Категория: ".$arSectOne_Elements["NAME"]." найдена<br>";

                // Поиск подкатегории
                $arSectTwo_Elements = [];
                $arSectTwo_Elements = SearchSection($IBLOCK_ID, $arSectOne_Elements["ID"], $csv_element["Производитель"]);

                if (!empty($arSectTwo_Elements)) {
                    echo "Производитель: ".$arSectTwo_Elements["NAME"]." найден<br>";

                    // Создание товара
                    $PROP = array();
                    $PROP[1] = trim($csv_element["Артикул"]);
                    $PROP[3] = $csv_element["Количество"];
                    $PROP[2] = $csv_element["Цена"];

                    $arLoadProductArray = Array(
                        "IBLOCK_ID"         => $IBLOCK_ID,
                        "IBLOCK_SECTION_ID" => $arSectTwo_Elements["ID"],
                        "PROPERTY_VALUES"   => $PROP,
                        "NAME"              => trim($csv_element["Номенклатура"]),
                        "CODE"              => CUtil::translit(strip_tags(trim($csv_element["Номенклатура"])), "ru" , $SecParams),
                        "ACTIVE"            => "Y"
                    );

                    if ($PRODUCT_ID = $el->Add($arLoadProductArray)) {
                        echo "Товар: " . trim($csv_element["Номенклатура"]) . " создан<br>";
                        AddMessage2Log("Создание товара - ".$csv_element["Номенклатура"], "Товар");
                        // Запись в лог о создании товара
                    } else {
                        echo "Товар: " . trim($csv_element["Номенклатура"]) . " не создан<br>Произошла неизвестная ошибка: ".$el->LAST_ERROR;
                        AddMessage2Log("Произошла ошибка при создании товара - " . trim($csv_element["Номенклатура"]) . "\nТекст ошибки: ".$el->LAST_ERROR, "Товар");
                        // Пропуск товара для избежания непонятки и запись в лог
                    }
                } else {
                    echo "Производитель: " . $csv_element["Производитель"] . " не найден<br>";

                    $SecTwo = new CIBlockSection;
                    $newName = trim($csv_element["Производитель"]);
                    $SecTwoFields = Array(
                        "IBLOCK_ID" => $IBLOCK_ID,
                        "IBLOCK_SECTION_ID" => $arSectOne_Elements["ID"],
                        "NAME" => $csv_element["Производитель"],
                        "CODE" => CUtil::translit(strip_tags($newName), "ru" , $SecParams)
                    );
                    $SecTwoID = $SecTwo->Add($SecTwoFields);
                    if ($SecTwoID > 0) {
                        echo "Производитель: ".$csv_element["Производитель"]." создан<br>";
                        AddMessage2Log("Создание производителя - ".$csv_element["Производитель"], "Производитель");

                        // Создание товара
                        $PROP = array();
                        $PROP[1] = trim($csv_element["Артикул"]);
                        $PROP[3] = $csv_element["Количество"];
                        $PROP[2] = $csv_element["Цена"];

                        $arLoadProductArray = Array(
                            "IBLOCK_ID"         => $IBLOCK_ID,
                            "IBLOCK_SECTION_ID" => $SecTwoID,
                            "PROPERTY_VALUES"   => $PROP,
                            "NAME"              => trim($csv_element["Номенклатура"]),
                            "CODE"              => CUtil::translit(strip_tags(trim($csv_element["Номенклатура"])), "ru" , $SecParams),
                            "ACTIVE"            => "Y"
                        );

                        if ($PRODUCT_ID = $el->Add($arLoadProductArray)) {
                            echo "Товар: " . trim($csv_element["Номенклатура"]) . " создан<br>";
                            AddMessage2Log("Создание товара - ".$csv_element["Номенклатура"], "Товар");
                            // Запись в лог о создании товара
                        } else {
                            echo "Товар: " . trim($csv_element["Номенклатура"]) . " не создан<br>Произошла неизвестная ошибка: ".$el->LAST_ERROR;
                            AddMessage2Log("Произошла ошибка при создании товара - " . trim($csv_element["Номенклатура"]) . "\nТекст ошибки: ".$el->LAST_ERROR, "Товар");
                            // Пропуск товара для избежания непонятки и запись в лог
                        }
                    } else {
                        echo "Производитель: ".$csv_element["Производитель"]." не создан<br>Код товара: ".$newName."<br> Произошла неизвестная ошибка: ".$SecTwo->LAST_ERROR;
                        AddMessage2Log("Произошла ошибка при создании производителя - ".$csv_element["Производитель"]."\nТекст ошибки: ".$SecTwo->LAST_ERROR."\nПропускаем товар: ".$csv_element["Номенклатура"], "Производитель");
                        // пропуск товара для избежания непонятки и запись в лог
                    }
                }
            } else {
                echo "Категория: ".$csv_element["Категория"]." не найдена<br>";

                $SecOne = new CIBlockSection;
                $SecOneFields = Array(
                    "IBLOCK_ID" => $IBLOCK_ID,
                    "NAME" => $csv_element["Категория"],
                    "CODE" => CUtil::translit(strip_tags($csv_element["Категория"]), "ru" , $SecParams)
                );
                $SecOneID = $SecOne->Add($SecOneFields);
                if ($SecOneID > 0) {
                    echo "Категория: ".$csv_element["Категория"]." создана<br>";
                    AddMessage2Log("Создание категории - ".$csv_element["Категория"], "Категории");

                    // Создание подкатегории и запись в лог
                    $SecTwo = new CIBlockSection;
                    $newName = trim($csv_element["Производитель"]);
                    $SecTwoFields = Array(
                        "IBLOCK_ID" => $IBLOCK_ID,
                        "IBLOCK_SECTION_ID" => $SecOneID,
                        "NAME" => $csv_element["Производитель"],
                        "CODE" => CUtil::translit(strip_tags($newName), "ru" , $SecParams)
                    );
                    $SecTwoID = $SecTwo->Add($SecTwoFields);
                    if ($SecTwoID > 0) {
                        echo "Производитель: ".$csv_element["Производитель"]." создан<br>";
                        AddMessage2Log("Создание производителя - ".$csv_element["Производитель"], "Производитель");

                        // Создание товара
                        $PROP = array();
                        $PROP[1] = trim($csv_element["Артикул"]);
                        $PROP[3] = $csv_element["Количество"];
                        $PROP[2] = $csv_element["Цена"];

                        $arLoadProductArray = Array(
                            "IBLOCK_ID"         => $IBLOCK_ID,
                            "IBLOCK_SECTION_ID" => $SecTwoID,
                            "PROPERTY_VALUES"   => $PROP,
                            "NAME"              => trim($csv_element["Номенклатура"]),
                            "CODE"              => CUtil::translit(strip_tags(trim($csv_element["Номенклатура"])), "ru" , $SecParams),
                            "ACTIVE"            => "Y"
                        );

                        if ($PRODUCT_ID = $el->Add($arLoadProductArray)) {
                            echo "Товар: " . trim($csv_element["Номенклатура"]) . " создан<br>";
                            AddMessage2Log("Создание товара - " . trim($csv_element["Номенклатура"]), "Товар");
                            // Запись в лог о создании товара
                        } else {
                            echo "Товар: " . trim($csv_element["Номенклатура"]) . " не создан<br>Произошла неизвестная ошибка: ".$el->LAST_ERROR;
                            AddMessage2Log("Произошла ошибка при создании товара - " . trim($csv_element["Номенклатура"]) . "\nТекст ошибки: ".$el->LAST_ERROR, "Товар");
                            // Пропуск товара для избежания непонятки и запись в лог
                        }
                    } else {
                        echo "Производитель: ".$csv_element["Производитель"]." не создан<br>Код товара: ".$newName."<br> Произошла неизвестная ошибка: ".$SecTwo->LAST_ERROR;
                        AddMessage2Log("Произошла ошибка при создании производителя - " . $csv_element["Производитель"] . "\nТекст ошибки: ".$SecTwo->LAST_ERROR."\nПропускаем товар: " . trim($csv_element["Номенклатура"]), "Производитель");
                        // Пропуск товара для избежания непонятки и запись в лог
                    }
                } else {
                    echo "Категория: ".$csv_element["Категория"]." не создана<br>Произошла неизвестная ошибка: ".$SecOne->LAST_ERROR;
                    AddMessage2Log("Произошла ошибка при создании категории - ".$csv_element["Категория"]."\nТекст ошибки: ".$SecOne->LAST_ERROR."\nПропускаем товар: " . trim($csv_element["Номенклатура"]), "Категории");
                    // Пропуск товара для избежания непонятки и запись в лог
                }
            }
        }
    }
}

require ($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/main/include/epilog_after.php");
?>