<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/main/include/prolog_before.php");

/* === Добавление в корзину ===*/
if(isset($_SESSION['card'][$_REQUEST["id"]])){
    //если в массиве уже есть добавляемый товар
    $_SESSION['card'][$_REQUEST["id"]]['qty'] = $_REQUEST["qty"];
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