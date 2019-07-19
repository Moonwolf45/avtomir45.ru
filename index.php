<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");
$APPLICATION->SetTitle("АВТОМИР45");
?><main>
     <!--модуль яндекс метрики -->
                                                      <!-- Yandex.Metrika counter -->
<script type="text/javascript" >
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter44249099 = new Ya.Metrika({
                    id:44249099,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true,
                    webvisor:true
                });
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
            s = d.createElement("script"),
            f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/44249099" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
                                                 <!-- /Yandex.Metrika counter -->
    <div class="container">
        <div class="assortment">
            <div class="assortment-item">
                <a href="/katalog/avtozapchasti/">
                    <img src="<? echo SITE_TEMPLATE_PATH;?>/images/autoparts.png" alt="Запчасти для иномарок">
                </a>
            </div>
            <div class="assortment-item">
                <a href="/katalog/avtomasla/">
                    <img src="<? echo SITE_TEMPLATE_PATH;?>/images/oil.png" alt="Автомасла">
                </a>
            </div>
            <div class="assortment-item">
                <a href="/katalog/avtokhimiya/">
                    <img src="<? echo SITE_TEMPLATE_PATH;?>/images/autochemistry.png" alt="Автохимия">
                </a>
            </div>
            <div class="assortment-item">
                <a href="/katalog/aksessuary/">
                    <img src="<? echo SITE_TEMPLATE_PATH;?>/images/accessories.png" alt="Аксессуары">
                </a> 
            </div>
        </div>
        <div class="assortment">
            <div class="assortment-item">
                <a href="/katalog/aromatizatory/">
                    <img src="<? echo SITE_TEMPLATE_PATH;?>/images/flavors.png" alt="Ароматизаторы">
                </a> 
            </div>
            <div class="assortment-item">
                <a href="/katalog/lampochki/">
                    <img src="<? echo SITE_TEMPLATE_PATH;?>/images/lamp.png" alt="Лампы">
                </a> 
            </div>
            <div class="assortment-item">
                <a href="/katalog/dop-oborudovanie/">
                    <img src="<? echo SITE_TEMPLATE_PATH;?>/images/optional.png" alt="Доп.оборудование">
                </a> 
            </div>
            <div class="assortment-item">
                <a href="/katalog/shchetki_stekloochistitelya/">
                    <img src="<? echo SITE_TEMPLATE_PATH;?>/images/wiper.png" alt="Щекти">
                </a> 
            </div>
        </div>
    </div>

    <?php
        //Перед использованием методов класса, подключаем
        CModule::IncludeModule("fileman");
        CMedialib::Init();

        //Получения списка всех коллекций
        $arCol = CMedialibCollection::GetList(array('arFilter' => array('ACTIVE' => 'Y')));

        //Получения всех изображений коллекции с ID равным 1
        $arItems = CMedialibItem::GetList(array('arCollections' => array("0" => 1)));

        //Заполним массив путей к картинкам
        $arImgPath = array();
        foreach ($arItems as $arItem) {
            $imgPath = $arItem['PATH'];
            $arImgPath[] = $imgPath;
        };
        ?>

    <div class="slick-slider">
        <?php foreach ($arImgPath as $num => $arImg): ?>
            <div>
                <img src="<?php echo $arImg;?>"  alt="<?php echo $num;?>">
            </div>
        <?php endforeach; ?>
    </div>

    <div class="container">

        <section class="news">
            <h4><a href="/news/">Новости</a></h4>

            <?$APPLICATION->IncludeComponent(
                "bitrix:news.list",
                "news_index",
                    Array(
                        "COMPONENT_TEMPLATE" => ".default",
                        "IBLOCK_TYPE" => "news",	// Тип информационного блока (используется только для проверки)
                        "IBLOCK_ID" => "2",	// Код информационного блока
                        "NEWS_COUNT" => "3",	// Количество новостей на странице
                        "SORT_BY1" => "ACTIVE_FROM",	// Поле для первой сортировки новостей
                        "SORT_ORDER1" => "DESC",	// Направление для первой сортировки новостей
                        "SORT_BY2" => "SORT",	// Поле для второй сортировки новостей
                        "SORT_ORDER2" => "ASC",	// Направление для второй сортировки новостей
                        "FILTER_NAME" => "",	// Фильтр
                        "FIELD_CODE" => array(	// Поля
                            0 => "",
                            1 => "",
                        ),
                        "PROPERTY_CODE" => array(	// Свойства
                            0 => "",
                            1 => "",
                        ),
                        "CHECK_DATES" => "Y",	// Показывать только активные на данный момент элементы
                        "DETAIL_URL" => "",	// URL страницы детального просмотра (по умолчанию - из настроек инфоблока)
                        "AJAX_MODE" => "Y",	// Включить режим AJAX
                        "AJAX_OPTION_JUMP" => "N",	// Включить прокрутку к началу компонента
                        "AJAX_OPTION_STYLE" => "N",	// Включить подгрузку стилей
                        "AJAX_OPTION_HISTORY" => "N",	// Включить эмуляцию навигации браузера
                        "AJAX_OPTION_ADDITIONAL" => "",	// Дополнительный идентификатор
                        "CACHE_TYPE" => "A",	// Тип кеширования
                        "CACHE_TIME" => "36000000",	// Время кеширования (сек.)
                        "CACHE_FILTER" => "N",	// Кешировать при установленном фильтре
                        "CACHE_GROUPS" => "Y",	// Учитывать права доступа
                        "PREVIEW_TRUNCATE_LEN" => "",	// Максимальная длина анонса для вывода (только для типа текст)
                        "ACTIVE_DATE_FORMAT" => "d.m.Y",	// Формат показа даты
                        "SET_TITLE" => "N",	// Устанавливать заголовок страницы
                        "SET_BROWSER_TITLE" => "N",	// Устанавливать заголовок окна браузера
                        "SET_META_KEYWORDS" => "N",	// Устанавливать ключевые слова страницы
                        "SET_META_DESCRIPTION" => "N",	// Устанавливать описание страницы
                        "SET_LAST_MODIFIED" => "N",	// Устанавливать в заголовках ответа время модификации страницы
                        "INCLUDE_IBLOCK_INTO_CHAIN" => "N",	// Включать инфоблок в цепочку навигации
                        "ADD_SECTIONS_CHAIN" => "N",	// Включать раздел в цепочку навигации
                        "HIDE_LINK_WHEN_NO_DETAIL" => "N",	// Скрывать ссылку, если нет детального описания
                        "PARENT_SECTION" => "",	// ID раздела
                        "PARENT_SECTION_CODE" => "",	// Код раздела
                        "INCLUDE_SUBSECTIONS" => "N",	// Показывать элементы подразделов раздела
                        "STRICT_SECTION_CHECK" => "N",	// Строгая проверка раздела для показа списка
                        "DISPLAY_DATE" => "N",	// Выводить дату элемента
                        "DISPLAY_NAME" => "Y",	// Выводить название элемента
                        "DISPLAY_PICTURE" => "Y",	// Выводить изображение для анонса
                        "DISPLAY_PREVIEW_TEXT" => "Y",	// Выводить текст анонса
                        "PAGER_TEMPLATE" => "",	// Шаблон постраничной навигации
                        "DISPLAY_TOP_PAGER" => "N",	// Выводить над списком
                        "DISPLAY_BOTTOM_PAGER" => "N",	// Выводить под списком
                        "PAGER_TITLE" => "",	// Название категорий
                        "PAGER_SHOW_ALWAYS" => "N",	// Выводить всегда
                        "PAGER_DESC_NUMBERING" => "N",	// Использовать обратную навигацию
                        "PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",	// Время кеширования страниц для обратной навигации
                        "PAGER_SHOW_ALL" => "N",	// Показывать ссылку "Все"
                        "PAGER_BASE_LINK_ENABLE" => "N",	// Включить обработку ссылок
                        "SET_STATUS_404" => "Y",	// Устанавливать статус 404
                        "SHOW_404" => "Y",	// Показ специальной страницы
                        "FILE_404" => "",	// Страница для показа (по умолчанию /404.php)
                    ),
                false
            );?>
        </section>

        <section class="special-offers">
            <h4>Специальные предложения</h4>
            <div class="special-wr">
                <?php
                    //Перед использованием методов класса, подключаем
                    CModule::IncludeModule("fileman");
                    CMedialib::Init();

                    //Получения списка всех коллекций
                    $arCol = CMedialibCollection::GetList(array('arFilter' => array('ACTIVE' => 'Y')));

                    //Получения всех изображений коллекции с ID равным 1
                    $arItems = CMedialibItem::GetList(array('arCollections' => array("0" => 2)));

                    //Заполним массив путей к картинкам
                    $arImgPath = array();
                    foreach ($arItems as $arItem) {
                        $imgPath = $arItem['PATH'];
                        $arImgPath[] = $imgPath;
                    };
                ?>

                <?php foreach ($arImgPath as $num => $arImg): ?>
                    <div class="special-offers-item">
                        <img src="<?php echo $arImg;?>" alt="<?php echo $num;?>">
                    </div>
                <?php endforeach; ?>
            </div>
        </section>
    </div>
</main>

<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>