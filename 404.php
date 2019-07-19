<?php include_once($_SERVER['DOCUMENT_ROOT'].'/bitrix/modules/main/include/urlrewrite.php');

CHTTP::SetStatus("404 Not Found");
@define("ERROR_404","Y");

require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");

$APPLICATION->SetTitle("Страница не найдена");?>

<style>
    .bx-404-container {
        margin: 0 auto;
        width: 50%;
    }

    .bx-404-text-block,
    .bx-404-back {
        font-family: 'NotoSansRegular';
        font-size: 16px;
    }

    .bx-404-block img {
        width: 100%;
    }
</style>

<div class="bx-404-container">
    <div class="bx-404-block">
        <img src="<?=SITE_DIR?>images/404.png" alt="404">
    </div>
    <div class="bx-404-text-block">Неправильно набран адрес, <br>или такой страницы на сайте больше не существует.</div>
    <div class="bx-404-back"><a href="<?=SITE_DIR?>">Вернутся на главную.</a></div>
</div>

<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>