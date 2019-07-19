<?php
require($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/main/include/prolog_before.php");

/* === Удаление из корзины ===*/
if($_SESSION['card']){
    if(array_key_exists($_REQUEST["id"], $_SESSION['card'])){
        $_SESSION['total_quantity'] -= $_SESSION['card'][$_REQUEST["id"]]['qty'];
        unset($_SESSION['card'][$_REQUEST["id"]]);
        echo json_encode(['status' => 'OK']);
    }
}

?>