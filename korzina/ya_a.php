<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/main/include/prolog_before.php");
/*
Ответ
<paymentAvisoResponse performedDatetime="2011-05-04T20:38:11.000+04:00" code="0" invoiceId="1234567" shopId="13"/>
*/

$configs = array();
$configs['shopId'] 			= '157380';
$configs['scId'] 			= '558187';
$configs['ShopPassword'] 	= 'damqnRBmGZERcsuEAPQY';

$hash = md5($_POST['action'].';'.$_POST['orderSumAmount'].';'.$_POST['orderSumCurrencyPaycash'].';'.$_POST['orderSumBankPaycash'].';'.$configs['shopId'].';'.$_POST['invoiceId'].';'.$_POST['customerNumber'].';'.$configs['ShopPassword']);
if (strtolower($hash) != strtolower($_POST['md5'])) {
    $code = 1;
} else {
    $code = 0;
}
print '<?xml version="1.0" encoding="UTF-8"?>';
print '<paymentAvisoResponse performedDatetime="'. $_POST['requestDatetime'] .'" code="'.$code.'" invoiceId="'. $_POST['invoiceId'] .'" shopId="'. $configs['shopId'] .'"/>';

?>