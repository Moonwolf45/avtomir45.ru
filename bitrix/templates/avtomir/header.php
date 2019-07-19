<?if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();
IncludeTemplateLangFile(__FILE__); ?>
<!DOCTYPE html>
<html lang="<?echo GetMessage("language");?>">
<head>
    <meta http-equiv="content-type" content="text/html; charset=<?echo LANG_CHARSET?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <?$APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH . '/slick/slick.css');?>
    <?$APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH . '/slick/slick-theme.css');?>
    <?$APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH . '/template_styles.css');?>
    <?$APPLICATION->AddHeadScript(SITE_TEMPLATE_PATH . '/js/jquery-3.2.1.min.js');?>
    <?$APPLICATION->AddHeadScript(SITE_TEMPLATE_PATH . '/slick/slick.min.js');?>
    <?$APPLICATION->AddHeadScript(SITE_TEMPLATE_PATH . '/js/script.js');?>
    <?$APPLICATION->ShowHead();?>
    <?$APPLICATION->ShowMeta("keywords");?>
    <?$APPLICATION->ShowMeta("description");?>
    <title><?$APPLICATION->ShowTitle()?></title>

    <link rel="apple-touch-icon" sizes="57x57" href="<? echo SITE_TEMPLATE_PATH;?>/images/favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="<? echo SITE_TEMPLATE_PATH;?>/images/favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="<? echo SITE_TEMPLATE_PATH;?>/images/favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="<? echo SITE_TEMPLATE_PATH;?>/images/favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="<? echo SITE_TEMPLATE_PATH;?>/images/favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="<? echo SITE_TEMPLATE_PATH;?>/images/favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="<? echo SITE_TEMPLATE_PATH;?>/images/favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="<? echo SITE_TEMPLATE_PATH;?>/images/favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="<? echo SITE_TEMPLATE_PATH;?>/images/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="<? echo SITE_TEMPLATE_PATH;?>/images/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="<? echo SITE_TEMPLATE_PATH;?>/images/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="<? echo SITE_TEMPLATE_PATH;?>/images/favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="<? echo SITE_TEMPLATE_PATH;?>/images/favicon/favicon-16x16.png">
    <link rel="manifest" href="<? echo SITE_TEMPLATE_PATH;?>/images/favicon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="<? echo SITE_TEMPLATE_PATH;?>/images/favicon/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
</head>
<body>

<?$APPLICATION->ShowPanel()?>
    <header>
        <div class="moble-menu-top">
            <div class="header-logo-moble">
                <a href="/">
                    <img src="<? echo SITE_TEMPLATE_PATH;?>/images/logo.png" alt="">
                </a>
            </div>
            <span class="tog"></span>
        </div>
        <div class="moble-menu">
            <div class="header-top">
                <div class="header-top-item">
                    <div class="header-logo">
                        <a href="/">
                            <img src="<? echo SITE_TEMPLATE_PATH;?>/images/logo.png" alt="">
                        </a>
                    </div>
                    <div class="header-contacts">
                        <p class="header-tell">+7 (3522) 63-00-68</p>
                        <p class="header-city">Курган</p>
                    </div>
                </div>
                <nav class="header-nav">
                    <?$APPLICATION->IncludeComponent(
                        "bitrix:menu",
                        "menu_header",
                        Array(
                            "ALLOW_MULTI_SELECT" => "N",	// Разрешить несколько активных пунктов одновременно
                            "CHILD_MENU_TYPE" => "left",	// Тип меню для остальных уровней
                            "DELAY" => "N",	// Откладывать выполнение шаблона меню
                            "MAX_LEVEL" => "1",	// Уровень вложенности меню
                            "MENU_CACHE_GET_VARS" => "",	// Значимые переменные запроса
                            "MENU_CACHE_TIME" => "3600",	// Время кеширования (сек.)
                            "MENU_CACHE_TYPE" => "A",	// Тип кеширования
                            "MENU_CACHE_USE_GROUPS" => "Y",	// Учитывать права доступа
                            "ROOT_MENU_TYPE" => "left",	// Тип меню для первого уровня
                            "USE_EXT" => "N",	// Подключать файлы с именами вида .тип_меню.menu_ext.php
                            "COMPONENT_TEMPLATE" => ".default"
                        ),
                        false
                    );?>
                </nav>
            </div>
            <div class="header-bottom">
                <div class="header-bottom-item">
                    <div class="header-bottom-list">
                        <div id="button">
                            <p class="menu_class">Каталог</p>
                            <ul class="the_menu">
                                <li><a href="#">Каталог</a></li>
                                <li><a href="#">Каталог</a></li>
                                <li><a href="#">Каталог</a></li>
                                <li><a href="#">Каталог</a></li>
                                <li><a href="#">Каталог</a></li>
                                <li><a href="#">Каталог</a></li>
                                <li><a href="#">Каталог</a></li>
                                <li><a href="#">Каталог</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="header-bottom-search">
                        <form action="/search.php" method="get">
                            <input type="text" name="q" class="search-item search-item--code" placeholder="Поиск по артикулу">
                        </form>
                    </div>
                    <div class="header-bottom-search header-bottom-search-min">
                        <form>
                            <input type="text" class="search-item search-item--vin" placeholder="Поиск VIN">
                        </form>
                    </div>
                </div>
                <div class="header-bottom-buttons">
                    <div class="entry">
                        <a href="" class="btn btn-entry">Вход</a>
                        <a href="" class="btn btn-registration">Регистрация</a>
                    </div>
                    <a href="" class="btn btn-basket">Корзина<span>0</span></a>
                </div>
            </div>
        </div>
    </header>