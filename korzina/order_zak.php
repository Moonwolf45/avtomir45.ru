<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/main/include/prolog_before.php");
    global $USER;
    CModule::IncludeModule("iblock");

    $time = round(microtime(true));

    $msg_box = ""; // в этой переменной будем хранить сообщения формы
    $errors = array(); // контейнер для ошибок
    // проверяем корректность полей
    if($_POST['dost_order'] == "") 	 $errors[] = "Способ доставки не выбран!";
    if($_POST['user_name'] == "") 	 $errors[] = "Поле 'Ваше имя' не заполнено!";
    if($_POST['user_email'] == "")	 $errors[] = "Поле 'Телефон или e-mail' не заполнено!";
    if($_POST['pay_order'] == "")    $errors[] = "Способ оплаты не выбран!";

    // если форма без ошибок
    if(empty($errors)) {
        // собираем данные из формы
        $message = "";

        foreach ($_SESSION['card'] as $arSesProd) {
            $message .= "Товар: " . $arSesProd['name'] . " __ Количество: " . $arSesProd['qty'] . " __ Общая сумма: " . $arSesProd['qty'] * $arSesProd['price'] . " руб.<br>";
        }

        $message .= "<br><br>";
        $message .= "Имя пользователя: " . $_POST['user_name'] . "<br>";
        $message .= "Телефон или e-mail пользователя: " . $_POST['user_email'] . "<br>";
        $message .= "Дополнительный комментарий: " . $_POST['text_comment'] . "<br>";
        $message .= "Способ доставки: " . $_POST['dost_order'] . "<br>";
        $message .= "Сопособ оплаты: " . $_POST['pay_order'] . "<br>";
        if (isset($_POST['status'])) {
            if ($_POST['status'] == "false") {
                $message .= "Статус оплаты: <span style='color:red;'>Не оплачено</span><br>";
            } else {
                $message .= "Статус оплаты: <span style='color:green;'>Оплачено</span><br>";
            }
        } else {
            $message .= "Статус оплаты: <span style='color:red;'>Не оплачено</span><br>";
        }

        send_mail($message); // отправим письмо

        if ($USER -> IsAuthorized()) {
            foreach ($_SESSION['card'] as $arProd) {
                if (!array_key_exists("maxqty", $_SESSION['card'])) {
                    $el = new CIBlockElement;

                    $PROP = array();
                    $PROP["all_id"] = $time;
                    $PROP["qty"] = $arProd['qty'];
                    $PROP["price"] = $arProd['qty'] * $arProd['price'];
                    $PROP["vendor"] = $USER->GetID();

                    $arLoadProductArray = Array(
                        "MODIFIED_BY" => $USER->GetID(),
                        "IBLOCK_SECTION_ID" => false,
                        "IBLOCK_ID" => 3,
                        "PROPERTY_VALUES" => $PROP,
                        "NAME" => $arProd['name'],
                        "ACTIVE" => "Y",
                        "PREVIEW_TEXT" => "",
                        "DETAIL_TEXT" => "",
                        "PREVIEW_PICTURE" => $arProd['img'],
                        "DETAIL_PICTURE" => $arProd['img'],
                    );
                    $PRODUCT_ID = $el->Add($arLoadProductArray);
                }
            }
        }

        $edit_p = array();
        $i = 0;
        foreach ($_SESSION['card'] as $arS_C) {
            if (!array_key_exists("maxqty", $_SESSION['card'])) {
                $res = CIBlockElement::GetProperty(1, $arS_C["id"], array("sort" => "asc"), array("CODE" => "COUNT"));
                if ($ob = $res->GetNext()) {
                    $edit_p[$i]["id"] = $arS_C["id"];
                    if (intval($ob['VALUE']) == -3) {
                        $edit_p[$i]["count"] = 10000;
                    } else {
                        $edit_p[$i]["count"] = intval($ob['VALUE']) - $arS_C["qty"];
                    }
                    $i++;
                }
            }
        }

        foreach ($edit_p as $arNewCount) {
            if ($arNewCount["count"] != 10000) {
                CIBlockElement::SetPropertyValueCode($arNewCount["id"], "count", $arNewCount["count"]);
            }
        }
        unset ($_SESSION["card"]);
        $_SESSION["total_quantity"] = 0;

        // выведем сообщение об успехе
        if (isset($_POST['status'])) {
            if ($_POST['status'] == "false") {
                $msg_box = "<span style='color:red;'>Ваша оплата не прошла, но заказ отправлен менеджеру. Сотрудник свяжится с вами в ближайшее вермя.</span>";
            } else {
                $msg_box = "<span style='color:green;'>Ваш заказ оплчен. Менеджер свяжится с вами в ближайшее время.</span>";
            }
        } else {
            $msg_box = "<span style='color:green;'>Заказ успешно отправлен через некоторое время с вами свяжутся!</span>";
        }
    } else {
        // если были ошибки, то выводим их
        $msg_box = "";
        foreach ($errors as $one_error) {
            $msg_box .= "<span style='color:red;'>$one_error</span><br>";
        }
    }

    // делаем ответ на клиентскую часть в формате JSON
    echo json_encode(array(
        'result' => $msg_box
    ));

    // функция отправки письма
    function send_mail($message) {
        // почта, на которую придет письмо
        $rsSites = CSite::GetByID('s1');
        $arSite = $rsSites->Fetch();
        $mail_to = $arSite['EMAIL'];
        // тема письма
        $subject = "Заказ с сайта";

        // заголовок письма
        $headers= "MIME-Version: 1.0\r\n";
        $headers .= "Content-type: text/html; charset=utf-8\r\n"; // кодировка письма
        $headers .= "From: info@xn--45-6kci4axnso.xn--p1ai\r\n"; // от кого письмо

        // отправляем письмо
        mail($mail_to, $subject, $message, $headers);
    }
?>