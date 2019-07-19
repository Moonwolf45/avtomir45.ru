<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");
$APPLICATION->SetTitle("Запрос по VIN");
?>

<main>
    <?$APPLICATION->IncludeComponent(
        "bitrix:breadcrumb",
        "breadcrumb",
        Array(
            "COMPONENT_TEMPLATE" => "breadcrumb",
            "START_FROM" => "0",	// Номер пункта, начиная с которого будет построена навигационная цепочка
            "PATH" => "",	// Путь, для которого будет построена навигационная цепочка (по умолчанию, текущий путь)
            "SITE_ID" => "s1",	// Cайт (устанавливается в случае многосайтовой версии, когда DOCUMENT_ROOT у сайтов разный)
        ),
        false
    );?>
    <div class="vin-wr">
        <div class="vin-form">
            <form method="post">
                <fieldset>
                    <legend>Отправьте нам запрос и менеджер свяжеться с вами</legend>
                    <div class="vin-box1">
                        <input type="text" placeholder="VIN номер автомобиля" autofocus>
                    </div>
                    <div class="vin-box2">
                        <input type="text" placeholder="Ваше имя">
                        <input type="text" placeholder="Телефон или e-mail">
                    </div>
                    <div class="textarea">
                        <textarea name="text" id="text" placeholder="Дополнительный коментарий" rows="6"></textarea>
                    </div>
                </fieldset>
            </form>
        </div>
        <div class="vin-img">
            <img src="<? echo SITE_TEMPLATE_PATH;?>/images/vin.png" alt="">
        </div>
        <div class="vin-text">
            <h3>Ремонт своими руками</h3>
            <p>Равным образом сложившаяся структура организации представляет собой интересный эксперимент проверки направлений прогрессивного развития. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения новых предложений.</p>
        </div>
    </div>
</main>

<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>