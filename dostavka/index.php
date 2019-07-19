<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");
    $APPLICATION->SetTitle("Доставка");
?>

    <main>
        <?$APPLICATION->IncludeComponent(
            "bitrix:breadcrumb",
            "breadcrumb",
            Array(
                "COMPONENT_TEMPLATE" => "breadcrumb",
                "PATH" => "",
                "SITE_ID" => "s1",
                "START_FROM" => "0"
            )
        );?>

        <section class="delivery-wr">
            <article class="delivery-item">
                <div class="delivery-img">
                    <img src="/bitrix/templates/avtomir/images/delivery1.png" alt="">
                </div>
                <div class="delivery-text">
                    <h3>Доставка курьером</h3>
                    <p>Доставка курьером в пределах города при покупке от 1000 рублей.</p>
                </div>
            </article>
            <article class="delivery-item">
                <div class="delivery-img">
                    <img src="/bitrix/templates/avtomir/images/delivery2.png" alt="">
                </div>
                <div class="delivery-text">
                    <h3>Почта России</h3>
                    <p></p>
                </div>
            </article>
            <article class="delivery-item">
                <div class="delivery-img">
                    <img src="/bitrix/templates/avtomir/images/delivery3.png" alt="">
                </div>
                <div class="delivery-text">
                    <h3>Самовывоз из магазина</h3>
                    <p></p>
                </div>
            </article>
        </section>
    </main>

<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>