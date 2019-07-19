<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");
    $APPLICATION->SetTitle("АВТОМИР45 | Поиск");

    function gateway($number_one) {
        $curl = curl_init(); // Инициализируем запрос
        curl_setopt_array($curl, array(
            CURLOPT_URL => 'http://fapi.iisis.ru/fapi/v2/analogList?n=' . $number_one . '&ui=1e41e16a-319e-4897-9654-9ff28e107caa', // Полный адрес метода]
            CURLOPT_RETURNTRANSFER => true, // Возвращать ответ
            CURLOPT_POST => false, // Метод POST
        ));
        $response = curl_exec($curl); // Выполненяем запрос
        $response = mb_convert_encoding($response, "UTF-8", "Windows-1251");
        $response = json_decode($response, true); // Декодируем из JSON в массив
        curl_close($curl); // Закрываем соединение
        return $response; // Возвращаем ответ
    };

    function request_two($number_one) {
        $login_post = 'automir45@mail.ru';
        $pass_post = 'FDNJRJH45';

        $curl = curl_init(); // Инициализируем запрос
        curl_setopt_array($curl, array(
            CURLOPT_URL => 'http://avtokor.com.public.api.abcp.ru/search/brands/?userlogin=' . $login_post . '&userpsw='. md5($pass_post) .'&number=' . $number_one . '&useOnlineStocks=1&locale=ru_RU', // Полный адрес метода
            CURLOPT_RETURNTRANSFER => true, // Возвращать ответ
            CURLOPT_POST => false, // Метод POST
        ));
        $response = curl_exec($curl); // Выполненяем запрос
        $response = json_decode($response, true); // Декодируем из JSON в массив
        curl_close($curl); // Закрываем соединение
        return $response; // Возвращаем ответ
    };

    function request_tree($ident, $brand_filter) {
        $login_post = 'automir45@mail.ru';
        $pass_post = 'FDNJRJH45';

        $curl = curl_init(); // Инициализируем запрос
        curl_setopt_array($curl, array(
            CURLOPT_URL => 'http://avtokor.com.public.api.abcp.ru/search/articles/?userlogin=' . $login_post . '&userpsw='. md5($pass_post) .'&number=' . $ident . '&brand=' . $brand_filter . '&useOnlineStocks=1', // Полный адрес метода
            CURLOPT_RETURNTRANSFER => true, // Возвращать ответ
            CURLOPT_POST => false, // Метод POST
        ));
        $response = curl_exec($curl); // Выполненяем запрос
        $response = json_decode($response, true); // Декодируем из JSON в массив
        curl_close($curl); // Закрываем соединение
        return $response; // Возвращаем ответ
    };

    $result = gateway($_REQUEST['q']);
    $radio_b = $_REQUEST['search_what'];

    if ($radio_b == "articul") {
        foreach ($result['productList']['p'] as $arRes) {
            $arrProduct[] = $arRes['ns'];
        }

        if (!empty($result['manufacturerList']['mf'])) {
            $GLOBALS['arrFilter'] = array('PROPERTY_ARTICUL' => $arrProduct);
        } else {
            $arrProduct[] = $_REQUEST['q'];
            $GLOBALS['arrFilter'] = array('?PROPERTY_ARTICUL' => $arrProduct);
        }

        $res = request_two($_REQUEST['q']);

        if (!array_key_exists('errorCode', $res)) {
            foreach ($res as $r) {
                $new_res[$r['brand']][] = request_tree($_REQUEST['q'], $r['brand']);
            }
        }
    } else {
        $GLOBALS['arrFilter'] = array('?NAME' => $_REQUEST['q']);
    }

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
            <h2 class="basket-title">Результаты поиска по запросу <?php echo $_REQUEST['q']; ?></h2>
            <div class="basket-wr">
                <?php $APPLICATION->IncludeComponent(
                    "bitrix:news.list",
                    "search-item",
                    Array(
                        "ACTIVE_DATE_FORMAT" => "d.m.Y",
                        "ADD_SECTIONS_CHAIN" => "N",
                        "AJAX_MODE" => "N",
                        "AJAX_OPTION_ADDITIONAL" => "",
                        "AJAX_OPTION_HISTORY" => "N",
                        "AJAX_OPTION_JUMP" => "N",
                        "AJAX_OPTION_STYLE" => "N",
                        "CACHE_FILTER" => "N",
                        "CACHE_GROUPS" => "Y",
                        "CACHE_TIME" => "36000000",
                        "CACHE_TYPE" => "A",
                        "CHECK_DATES" => "Y",
                        "COMPONENT_TEMPLATE" => "category-item",
                        "DETAIL_URL" => "",
                        "DISPLAY_BOTTOM_PAGER" => "Y",
                        "DISPLAY_DATE" => "Y",
                        "DISPLAY_NAME" => "Y",
                        "DISPLAY_PICTURE" => "Y",
                        "DISPLAY_PREVIEW_TEXT" => "Y",
                        "DISPLAY_TOP_PAGER" => "N",
                        "FIELD_CODE" => array(0=>"",1=>"",),
                        "FILTER_NAME" => "arrFilter",
                        "HIDE_LINK_WHEN_NO_DETAIL" => "N",
                        "IBLOCK_ID" => "1",
                        "IBLOCK_TYPE" => "catalog",
                        "INCLUDE_IBLOCK_INTO_CHAIN" => "N",
                        "INCLUDE_SUBSECTIONS" => "N",
                        "MESSAGE_404" => "",
                        "NEWS_COUNT" => "20",
                        "PAGER_BASE_LINK_ENABLE" => "N",
                        "PAGER_DESC_NUMBERING" => "N",
                        "PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",
                        "PAGER_SHOW_ALL" => "N",
                        "PAGER_SHOW_ALWAYS" => "N",
                        "PAGER_TEMPLATE" => ".default",
                        "PAGER_TITLE" => "Товаров",
                        "PARENT_SECTION" => "",
                        "PARENT_SECTION_CODE" => "",
                        "PREVIEW_TRUNCATE_LEN" => "",
                        "PROPERTY_CODE" => array(0 => "articul", 1 => "count", 2 => "price", 3 => ""),
                        "SET_BROWSER_TITLE" => "N",
                        "SET_LAST_MODIFIED" => "N",
                        "SET_META_DESCRIPTION" => "N",
                        "SET_META_KEYWORDS" => "N",
                        "SET_STATUS_404" => "N",
                        "SET_TITLE" => "N",
                        "SHOW_404" => "N",
                        "SORT_BY1" => "ACTIVE_FROM",
                        "SORT_BY2" => "SORT",
                        "SORT_ORDER1" => "DESC",
                        "SORT_ORDER2" => "ASC",
                        "STRICT_SECTION_CHECK" => "N"
                    )
                ); ?>

                <?php if (!array_key_exists('errorCode', $res)): ?>
                    <?php if (array_key_exists('errorCode', $new_res)): ?>
                        <?php switch($new_res['errorCode']) {
                            case 1:
                                //echo "Ошибка синтаксиса запроса<br>";
                                break;
                            case 2:
                                //echo "Не найден обязательный параметр запроса<br>";
                                break;
                            case 3:
                                //echo "Неизвестная операция<br>";
                                break;
                            case 4:
                                //echo "Ошибка в параметре запроса<br>";
                                break;
                            case 13:
                                //echo "Неизвестная ошибка<br>";
                                break;
                            case 102:
                                //echo "Ошибка аутентификации пользователя<br>";
                                break;
                            case 103:
                                //echo "Доступ запрещен<br>";
                                break;
                            case 104:
                                //echo "Ошибка аутентификации сайта<br>";
                                break;
                            case 201:
                                //echo "Ошибка данных<br>";
                                break;
                            case 202:
                                //echo "Нарушение требования уникальности данных<br>";
                                break;
                            case 301:
                                //echo "Объект не найден<br>";
                                break;
                            case 302:
                                //echo "Ошибка кэша<br>";
                                break;
                            case 303:
                                //echo "Ресурс заблокирован<br>";
                                break;
                        }; ?>
                    <?php else: ?>
                        <?php $producer = ""; ?>
                        <?php foreach($new_res as $r_n => $r_value): ?>
                            <?php if (!array_key_exists('errorCode', $r_value[0])): ?>
                                <?php if($producer == ""): ?>
                                    <?php $producer = $r_n; ?>
                                    <h3>Производитель: <?php echo $producer; ?></h3>
                                <?php else: ?>
                                    <?php if($producer != $r_n): ?>
                                        <?php $producer = $r_n; ?>
                                        <h3>Производитель: <?php echo $producer; ?></h3>
                                    <?php endif;?>
                                <?php endif;?>
                            <?php endif;?>

                            <?php if (!array_key_exists('errorCode', $r_value[0])): ?>
                                <?php foreach($r_value[0] as $r_val): ?>
                                    <?php if($r_val["description"] != ''): ?>
                                        <div class="basket-item" id="<?= md5(substr($r_val["itemKey"], 0, 5) . $r_val["distributorId"] . $r_val["brand"]); ?>">
                                            <div class="bask_id" style="display:none;">
                                                <?= md5(substr($r_val["itemKey"], 0, 5) . $r_val["distributorId"] . $r_val["brand"]); ?>
                                            </div>
                                            <div class="basket-img">
                                                <img src="<?php echo SITE_TEMPLATE_PATH; ?>/images/no_photo.png" alt="">
                                            </div>
                                            <div class="basket-name">
                                                <a>
                                                    <span><?php echo $r_val["description"]; ?></span><br>
                                                    <span>Артикул: <?php echo $r_val["number"]; ?></span>
                                                </a>
                                            </div>
                                            <div class="basket-stock">
                                                <p>На заказ</p>
                                            </div>
                                            <div class="basket-quantity">
                                                <div class="plus"></div>
                                                <input type="number" name="qty" min="<?php echo $r_val["packing"]; ?>" max="10000" value="<?php echo $r_val["packing"]; ?>" step="<?php echo $r_val["packing"]; ?>">
                                                <div class="minus"></div>
                                                <input type="hidden" name="maxqty" value="10000">
                                            </div>
                                            <div class="basket-buy">
                                                <button class="btn-buy"></button>
                                            </div>
                                            <div class="basket-price">
                                                <span class="pric"><?php echo round($r_val["price"] + ($r_val["price"] * 0.10)); ?></span> руб.
                                            </div>
                                        </div>
                                    <?php endif; ?>
                                <?php endforeach; ?>
                            <?php endif; ?>
                        <?php endforeach; ?>
                    <?php endif; ?>
                <?php endif; ?>
            </div>
        </div>
    </main>

<div class="overlay-container">
	<div class="window-container zoomin">
		<div align="center">Товар добавлен.</div>
	</div>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        $('.basket-quantity input[name="qty"]').keyup(valid);

        function valid(e) {
            if(this.value > this.attributes.max.value) {
                this.value = this.attributes.max.value;
            }
        }

        $('.basket-quantity .plus').on('click', function() {
            var qty = parseInt($(this).parent().children('input').val());
            var kolvo = $(this).parent().children('input').attr('max');
            var step_qty = $(this).parent().children('input').attr('step');
            if (step_qty == 0 || step_qty == '') {
                step_qty = 1;
            }
            if (qty != kolvo && qty < kolvo) {
                qty = qty + parseInt(step_qty);
                $(this).parent().children('input').val(qty);
            }
        });

        $('.basket-quantity .minus').on('click', function() {
            var qty = parseInt($(this).parent().children('input').val());
            if (qty != 0 && qty != 1 && qty > 1) {
                qty = qty - 1;
                $(this).parent().children('input').val(qty);
            }
        });

        $('.btn-buy').click(function() {
            var bask_item = $(this).parent().parent().attr('id');
            console.log(bask_item);
            var bask_id = $('#'+bask_item+' .bask_id').html();
            console.log(bask_id);
            var bask_name = $('#'+bask_item+' .basket-name a span').html();
            console.log(bask_name);
            var bask_img = $('#'+bask_item+' .basket-img img').attr('src');
            console.log(bask_img);

            var bask_maxqty = $('#'+bask_item+' .basket-quantity input[name="maxqty"]').val();
            console.log(bask_maxqty);
            var bask_qty = $('#'+bask_item+' .basket-quantity input[name="qty"]').val();
            console.log(bask_qty);
            var bask_step_qty = $('#'+bask_item+' .basket-quantity input[name="qty"]').attr('step');
            console.log(bask_step_qty);
            var bask_price = $('#'+bask_item+' .basket-price .pric').html();
            console.log(bask_price);
            $.ajax({
                url: '/katalog/addtobasket.php',
                type: "POST",
                dataType: "JSON",
                data: {
                    'id': bask_id,
                    'name': bask_name,
                    'img': bask_img,
                    'qty': bask_qty,
                    'step': bask_step_qty,
                    'maxqty': bask_maxqty,
                    'price': bask_price
                },
                success: function (data) {
                    if(data.status == "OK") {
                        $('.overlay-container').fadeIn(function() {
                            window.setTimeout(function(){
                                $('.window-container.zoomin').addClass('window-container-visible');
                            }, 50);
                        });
                        window.setTimeout(function(){
                            $('.overlay-container').fadeOut().end().find('.window-container').removeClass('window-container-visible');
                            window.location.reload();
                        }, 1500);
                    }
                },
                error: function(xhr, status, error) {
                    alert(xhr.responseText + ' | \n' + status + ' | \n' +error);
                }
            });
        });
    });
</script>

<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>