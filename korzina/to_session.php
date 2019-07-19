<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/main/include/prolog_before.php");

/* === Запись в сессию для создания заказа ===*/
$_SESSION["ya"]["dost_order"] = $_POST["dost_order"];
$_SESSION["ya"]["user_name"] = $_POST["user_name"];
$_SESSION["ya"]["user_email"] = $_POST["user_email"];
$_SESSION["ya"]["text_comment"] = $_POST["text_comment"];
$_SESSION["ya"]["pay_order"] = $_POST["pay_order"];
$_SESSION["ya"]["order-agreement"] = $_POST["order-agreement"];

echo json_encode(['result' => 'OK']);

?>