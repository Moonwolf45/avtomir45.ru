<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");
$APPLICATION->SetTitle("Оформление заказа");

global $USER;
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
    <div class="container">
        <div class="order-wr">
            <div class="order-item">
                <h2>Пишите нам по любому вопросу</h2>
                <div class="order-form">
                    <fieldset>
                        <legend>Способ доставки:</legend>
                        <div class="order-radio">
                            <input type="radio" class="radio_material" id="pickup" name="order-groups" value="Самовывоз из магазина" checked="checked">
                            <label for="pickup">Самовывоз из магазина</label>
                            <input type="radio" class="radio_material" id="mail" name="order-groups" value="Доставка транспортной">
                            <label for="mail">Доставка транспортной</label>
                            <input type="radio" class="radio_material" id="rubber" name="order-groups" value="Курьерская доставка (услуга платная)">
                            <label for="rubber">Курьерская доставка (услуга платная)</label>
                        </div>
                        <?php if ($USER->IsAuthorized()):?>
                        <?php $id = $USER->GetID(); $rsUser = CUser::GetByID($id); $arUser = $rsUser->Fetch();?>
                            <div class="order-box">
                                <span><? echo $arUser["TITLE"];?></span>
                                <input type="hidden" name="TITLE" placeholder="Ваше имя" value="<? echo $arUser["TITLE"];?>" required>
                            </div>
                            <div class="order-box">
                                <span><? echo $arUser["EMAIL"];?></span>
                                <input type="hidden" name="EMAIL" placeholder="Телефон или e-mail" value="<? echo $arUser["EMAIL"];?>" required>
                            </div>
                        <?php else:?>
                            <div class="order-box">
                                <input type="text" name="TITLE" placeholder="Ваше имя" value="" required>
                            </div>
                            <div class="order-box">
                                <input type="text" name="EMAIL" placeholder="Телефон или e-mail" value="" required>
                            </div>
                        <?php endif;?>
                        <div class="textarea">
                            <textarea name="text" id="text" placeholder="Дополнительный коментарий" rows="3"></textarea>
                        </div>
                    </fieldset>
                </div>
            </div>
            <div class="order-item">
                <h2>Способ оплаты</h2>
                <div class="order-box-pay">
                    <div class="order-pay">
                        <div class="order-radio">
                            <input type="radio" class="radio_type" id="card" name="order-pay" value="Оплата банковской картой" >
                            <label for="card">Оплата банковской картой</label>
                            <input type="radio" class="radio_type" id="electronic" name="order-pay" value="Оплата курьеру">
                            <label for="electronic">Электронные деньги</label>
                            <input type="radio" class="radio_type" id="rubbeer" name="order-pay" value="Оплата наличными (в магазине)" checked="checked">
                            <label for="rubbeer">Оплата наличными (в магазине)</label>
                        </div>
                        <div class="order-agreement">
                            <input type="radio" id="agreement" name="order-agreement" checked>
                            <label for="agreement">Согласие с правилами заказа на сайте</label>
                        </div>
                        <div class="order-agreement">
                            <input type="checkbox" id="agreement-processing" name="order-processing">
                            <label for="agreement-processing">Cогласия о обработке персональных данных</label>
                        </div>
                    </div>
                    <div class="order-pay-img"></div>
                </div>
                <form id="ya" action="https://demomoney.yandex.ru/eshop.xml" method="post" enctype="application/x-www-form-urlencoded">
                    <input type="hidden" name="shopId" value="157380">
                    <input type="hidden" name="scid" value="558187">
                    <input type="hidden" name="sum" value="<?=$_SESSION["total_sum"]?>">
                    <input type="hidden" name="customerNumber" value="<?=round(microtime(true));?>">
                    <input type="hidden" name="paymentType" value="AC">
                    <input type="hidden" name="shopSuccessUrl" value="https://xn--45-6kci4axnso.xn--p1ai/korzina/order.php?success=true">
                    <input type="hidden" name="shopFailUrl" value="https://xn--45-6kci4axnso.xn--p1ai/korzina/order.php?success=false">
                </form>
                <a type="submit" class="btn btn-order-ya" disabled>Заказать</a>
                <a type="submit" class="btn btn-order" disabled>Заказать</a>
                <a href="/korzina/" class="btn btn-return">Вернуться в корзину</a>
            </div>
        </div>
    </div>
</main>

<div class="overlay-container">
    <div class="window-container zoomin" style="width:280px;">
        <div align=center></div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        var order_groups = $('#pickup').val();
        var order_pay = $('#rubbeer').val();
        $(".btn-order-ya").css("display","none");
        $(".btn-order").css("display","block");

        $('#pickup').on('click', function() {
            $(this).attr('checked','checked');
            $('#mail').removeAttr('checked');
            $('#rubber').removeAttr('checked');
            order_groups = $('#pickup').val();
        });

        $('#mail').on('click', function() {
            $(this).attr('checked','checked');
            $('#pickup').removeAttr('checked');
            $('#rubber').removeAttr('checked');
            order_groups = $('#mail').val();
        });

        $('#rubber').on('click', function() {
            $(this).attr('checked','checked');
            $('#mail').removeAttr('checked');
            $('#pickup').removeAttr('checked');
            order_groups = $('#rubber').val();
        });

        $('#card').on('click', function() {
            $(this).attr('checked','checked');
            $('#electronic').removeAttr('checked');
            $('#rubbeer').removeAttr('checked');
            order_pay = $('#card').val();
            $(".btn-order-ya").css("display","block");
            $(".btn-order").css("display","none");
        });

        $('#electronic').on('click', function() {
            $(this).attr('checked','checked');
            $('#pickup').removeAttr('checked');
            $('#rubbeer').removeAttr('checked');
            order_pay = $('#electronic').val();
            $(".btn-order-ya").css("display","none");
            $(".btn-order").css("display","block");
        });

        $('#rubbeer').on('click', function() {
            $(this).attr('checked','checked');
            $('#electronic').removeAttr('checked');
            $('#card').removeAttr('checked');
            order_pay = $('#rubbeer').val();
            $(".btn-order-ya").css("display","none");
            $(".btn-order").css("display","block");
        });

        $('#agreement-processing').on('change', function() {
            if ($("#agreement-processing").prop('checked')) {
                $('.btn-order-ya').removeAttr('disabled');
                $('.btn-order').removeAttr('disabled');
                $('.btn-order-ya').css('cursor', 'pointer');
                $('.btn-order').css('cursor', 'pointer');
                $('.btn-order-ya').css('background', '#d0011a');
                $('.btn-order').css('background', '#d0011a');
            } else {
                $('.btn-order-ya').attr('disabled', 'disabled');
                $('.btn-order').attr('disabled', 'disabled');
                $('.btn-order-ya').css('cursor', 'not-allowed');
                $('.btn-order').css('cursor', 'not-allowed');
                $('.btn-order-ya').css('background', 'rgba(208, 1, 26, .6)');
                $('.btn-order').css('background', 'rgba(208, 1, 26, .6)');
            }
        });

        $('.btn-order-ya').on('click', function () {
            if ($('input[name="TITLE"]').val() == "" || $('input[name="EMAIL"]').val() == "") {
                $('.window-container.zoomin > div').html("<span style='color:red;'>Должны быть заполнены все поля.</span><br>");
                $('.overlay-container').fadeIn(function() {
                    window.setTimeout(function() {
                        $('.window-container.zoomin').addClass('window-container-visible');
                    }, 50);
                });
                window.setTimeout(function(){
                    $('.overlay-container').fadeOut().end().find('.window-container').removeClass('window-container-visible');
                }, 3000);
            } else {
                var user_name = $('input[name="TITLE"]').val();
                var user_email = $('input[name="EMAIL"]').val();
                var text_comment = $('textarea[name="text"]').val();
                var order_agreement = $('input[name="order-agreement"]').val();
                $.ajax({
                    url: "to_session.php", // куда отправляем
                    type: "post", // метод передачи
                    dataType: "json", // тип передачи данных
                    data: { // что отправляем
                        "dost_order":   order_groups,
                        "user_name": 	user_name,
                        "user_email": 	user_email,
                        "text_comment": text_comment,
                        "pay_order": order_pay,
                        "order-agreement": order_agreement
                    },
                    // после получения ответа сервера
                    success: function(data) {
                        console.log("Запись в сессию: "+data.result);
                    },
                    error: function(xhr, status, error) {
                        alert(xhr.responseText + ' | \n' + status + ' | \n' + error);
                    }
                });
                window.setTimeout(function(){
                    document.forms["ya"].submit();
                }, 300);
            }
        });
        
        $('.btn-order').on('click', function() {
            $.ajax({
                url: "order_zak.php", // куда отправляем
                type: "post", // метод передачи
                dataType: "json", // тип передачи данных
                data: { // что отправляем
                    "dost_order":   order_groups,
                    "user_name": 	$('input[name="TITLE"]').val(),
                    "user_email": 	$('input[name="EMAIL"]').val(),
                    "text_comment": $('textarea[name="text"]').val(),
                    "pay_order": order_pay,
                    "order-agreement": $('input[name="order-agreement"]').val()
                },
                // после получения ответа сервера
                success: function(data) {
                    console.log(data.result);
                    
                    $('.window-container.zoomin > div').html(data.result);
                    $('.overlay-container').fadeIn(function() {
                        window.setTimeout(function() {
                            $('.window-container.zoomin').addClass('window-container-visible');
                        }, 50);
                    });
                    window.setTimeout(function(){
                        $('.overlay-container').fadeOut().end().find('.window-container').removeClass('window-container-visible');
                        location.href = location.protocol+'//'+location.host;
                    }, 3000);
                },
                error: function(xhr, status, error) {
                    alert(xhr.responseText + ' | \n' + status + ' | \n' + error);
                }
            });
        });
    });
</script>


<?php if (isset($_GET["success"])):?>
    <?php if ($_GET["success"] == "true"):?>
        <script type="text/javascript">
            $(document).ready(function() {
                $.ajax({
                    url: "order_zak.php", // куда отправляем
                    type: "post", // метод передачи
                    dataType: "json", // тип передачи данных
                    data: { // что отправляем
                        "dost_order":   "<? echo $_SESSION["ya"]["dost_order"];?>",
                        "user_name": 	"<? echo $_SESSION["ya"]["user_name"];?>",
                        "user_email": 	"<? echo $_SESSION["ya"]["user_email"];?>",
                        "text_comment": "<? echo $_SESSION["ya"]["text_comment"];?>",
                        "pay_order": "<? echo $_SESSION["ya"]["pay_order"];?>",
                        "order-agreement": "<? echo $_SESSION["ya"]["order-agreement"];?>",
                        "status": "true"
                    },
                    // после получения ответа сервера
                    success: function(data) {
                        console.log(data.result);

                        $('.window-container.zoomin > div').html(data.result);
                        $('.overlay-container').fadeIn(function() {
                            window.setTimeout(function() {
                                $('.window-container.zoomin').addClass('window-container-visible');
                            }, 50);
                        });
                        window.setTimeout(function(){
                            $('.overlay-container').fadeOut().end().find('.window-container').removeClass('window-container-visible');
                            <? unset ($_SESSION["ya"]);?>
                            location.href = location.protocol+'//'+location.host;
                        }, 3000);
                    },
                    error: function(xhr, status, error) {
                        alert(xhr.responseText + ' | \n' + status + ' | \n' + error);
                    }
                });
            });
        </script>
    <?php else: ?>
        <script type="text/javascript">
            $(document).ready(function() {
                $.ajax({
                    url: "order_zak.php", // куда отправляем
                    type: "post", // метод передачи
                    dataType: "json", // тип передачи данных
                    data: { // что отправляем
                        "dost_order":   "<? echo $_SESSION["ya"]["dost_order"];?>",
                        "user_name": 	"<? echo $_SESSION["ya"]["user_name"];?>",
                        "user_email": 	"<? echo $_SESSION["ya"]["user_email"];?>",
                        "text_comment": "<? echo $_SESSION["ya"]["text_comment"];?>",
                        "pay_order": "<? echo $_SESSION["ya"]["pay_order"];?>",
                        "order-agreement": "<? echo $_SESSION["ya"]["order-agreement"];?>",
                        "status": "false"
                    },
                    // после получения ответа сервера
                    success: function(data) {
                        console.log(data.result);

                        $('.window-container.zoomin > div').html(data.result);
                        $('.overlay-container').fadeIn(function() {
                            window.setTimeout(function() {
                                $('.window-container.zoomin').addClass('window-container-visible');
                            }, 50);
                        });
                        window.setTimeout(function(){
                            $('.overlay-container').fadeOut().end().find('.window-container').removeClass('window-container-visible');
                            <? unset ($_SESSION["ya"]);?>
                            location.href = location.protocol+'//'+location.host;
                        }, 3000);
                    },
                    error: function(xhr, status, error) {
                        alert(xhr.responseText + ' | \n' + status + ' | \n' + error);
                    }
                });
            });
        </script>
    <?php endif;?>
<?php endif;?>

<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>