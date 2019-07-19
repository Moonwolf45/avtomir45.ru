<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");
$APPLICATION->SetTitle("Корзина");
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
    <div class="container clearfix">
        <?php if($_SESSION['card']): // проверка корзины ?>
        <?php $_SESSION["total_sum"] = 0;?>

        <h2 class="basket-title">Выбранные товары</h2>
        <div class="basket-wr">
            <?php foreach($_SESSION['card'] as $arCard):?>
                <div class="basket-item" id="<?=$arCard['id'];?>">
                    <div class="basket-img">
                        <?php if ($arCard['img'] != ''):?>
                            <img src="<?php echo $arCard['img'];?>" alt="<?php echo $arCard['name'];?>">
                        <?php endif;?>
                    </div>
                    <div class="basket-name">
                        <span><?php echo $arCard['name'];?></span>
                    </div>

                    <div class="basket-quantity">
                        <?php if (array_key_exists("maxqty", $arCard)) {
                            $count = 10000;
                        } else {
                            CModule::IncludeModule("iblock");
                            $db_props = CIBlockElement::GetProperty(1, $arCard['id'], array("sort" => "asc"), Array("CODE"=>"count"));
                            if($ar_props = $db_props->Fetch()) {
                                if (intval($ar_props["VALUE"]) == -3) {
                                    $count = 10000;
                                } else {
                                    $count = intval($ar_props["VALUE"]);
                                }
                            } else {
                                $count = false;
                            }
                        } ?>
                        <div class="plus"></div>
                        <input type="number" name="qty" min="<?=$arCard['step'];?>" max="<?=$count;?>" value="<?=$arCard['qty'];?>" step="<?=$arCard['step'];?>">
                        <div class="minus"></div>
                    </div>
                    <div class="basket-close">
                        <button class="btn-close" data-id="<?=$arCard['id'];?>"></button>
                    </div>
                    <div class="basket-price">
                        <span><?php $_SESSION["total_sum"] += $arCard['qty'] * $arCard['price']; echo $arCard['qty'] * $arCard['price'];?></span>
                        <span> руб</span>
                    </div>
                </div>
            <?php endforeach;?>
            <a href="/korzina/order.php" class="btn btn-order">Оформить</a>
            <a onclick="history.back();" class="btn btn-return">Вернуться к покупкам</a>
        </div>
        <?php else:?>
            Корзина пуста
        <?php endif;?>
    </div>
</main>

<script type="text/javascript">
    $(document).ready(function(){
        $('.basket-quantity input[name="qty"]').keyup(valid);

        function valid(e) {
            if(this.value > this.attributes.max.value) {
                this.value = this.attributes.max.value;
            }
        }

        $('.basket-quantity input[name="qty"]').focusout(function () {
            var id_s = $(this).parent().parent().attr('id');
            pereschet_basket (id_s, $(this).val());
        });

        $('.basket-quantity .plus').on('click', function() {
            var qty = parseInt($(this).parent().children('input').val());
            var id_s = $(this).parent().parent().attr('id');
            var kolvo = $(this).parent().children('input').attr('max');
            var step_qty = $(this).parent().children('input').attr('step');
            if (step_qty == 0 || step_qty == '') {
                step_qty = 1;
            }
            if (qty != kolvo && qty < kolvo) {
                qty = qty + parseInt(step_qty);
                $(this).parent().children('input').val(qty);
                pereschet_basket (id_s, qty);
            }
        });
        $('.basket-quantity .minus').on('click', function() {
            var qty = parseInt($(this).parent().children('input').val());
            var id_s = $(this).parent().parent().attr('id');
            if (qty != 0 && qty != 1 && qty > 1) {
                qty = qty - 1;
                $(this).parent().children('input').val(qty);
                pereschet_basket (id_s, qty);
            }
        });

        function pereschet_basket (id, quantity) {
            $.ajax({
                url: 'per_basket.php',
                type: "POST",
                dataType: "JSON",
                data: {
                    'id': id,
                    'qty': quantity
                },
                success: function (data) {
                    if(data.status == "OK") {
                        window.location.reload();
                    }
                },
                error: function(xhr, status, error) {
                    alert(xhr.responseText + '|\n' + status + '|\n' +error);
                }
            });
        }

        $('.btn-close').on('click', function() {
            var id_b = $(this).attr("data-id");
            console.log(id_b);
            $.ajax({
                url: 'deletetobasket.php',
                type: "POST",
                dataType: "JSON",
                data: {
                    'id': id_b
                },
                success: function (data) {
                    if(data.status == "OK") {
                        window.location.reload();
                    }
                },
                error: function(xhr, status, error) {
                    alert(xhr.responseText + '|\n' + status + '|\n' +error);
                }
            });
        });
    });
</script>

<?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>