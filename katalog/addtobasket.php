<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/main/include/prolog_before.php");

/* === Добавление в корзину ===*/
if(isset($_SESSION['card'][$_REQUEST["id"]])){
    //если в массиве уже есть добавляемый товар
    $_SESSION['card'][$_REQUEST["id"]]['qty'] += $_REQUEST["qty"];
    total_quantity();
    echo json_encode(['status' => 'OK']);
} else {
    //если в корзине нет такого товара
    $_SESSION['card'][$_REQUEST["id"]]['id'] = $_REQUEST["id"];
    $_SESSION['card'][$_REQUEST["id"]]['name'] = $_REQUEST["name"];
    if ($_REQUEST["img"] != "") {
        $_SESSION['card'][$_REQUEST["id"]]['img'] = $_REQUEST["img"];
    }
    if ($_REQUEST["maxqty"] != 0 && $_REQUEST["maxqty"] != "") {
        $_SESSION['card'][$_REQUEST["id"]]['maxqty'] = $_REQUEST["maxqty"];
    }
    if ($_REQUEST["step"] != 0 && $_REQUEST["step"] != "") {
        $_SESSION['card'][$_REQUEST["id"]]['step'] = $_REQUEST["step"];
    } else {
        $_SESSION['card'][$_REQUEST["id"]]['step'] = 1;
    }
    $_SESSION['card'][$_REQUEST["id"]]['qty'] = $_REQUEST["qty"];
    $_SESSION['card'][$_REQUEST["id"]]['price'] = $_REQUEST["price"];
    total_quantity();
    echo json_encode(['status' => 'OK']);
}

/* === Кол-во товара в корзине + защита от ввода несуществующего ID ===*/
function total_quantity() {
    $_SESSION['total_quantity'] = 0;
    foreach($_SESSION['card'] as $key => $value){
        if(isset($value['price'])){
            // цена есть - суммируем
            $_SESSION['total_quantity'] += $value['qty'];
        }else{
            // цены нет - удаляяем
            unset($_SESSION['card'][$key]);
        }
    }
}

?>