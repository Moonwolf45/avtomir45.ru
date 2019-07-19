<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");
$APPLICATION->SetTitle("Категории");
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
        <h3 class="category-title"></h3>
        <div class="category-wr">
            <?php if(CModule::IncludeModule("iblock")) {
                $id_Sec = 0;
                $arSelect1 = Array("ID", "NAME");
                $arFilter1 = Array("IBLOCK_ID" => 1, "ACTIVE" => "Y", "CODE" => $_GET["SECTION_CODE"]);
                $res1 = CIBlockSection::GetList(Array("NAME" => "ASC"), $arFilter1, true, $arSelect1);
                while($ob1 = $res1->GetNext()) {
                    $id_Sec = $ob1["ID"];
                    $intCount = CIBlockSection::GetCount(array('IBLOCK_ID' => 1, 'SECTION_ID' => $ob1["ID"]));
                }

                if ($intCount == 0) {
                    $APPLICATION->IncludeComponent(
                        "bitrix:news.list",
                        "category-item",
                        array(
                            "COMPONENT_TEMPLATE" => "category-item",
                            "IBLOCK_TYPE" => "catalog",
                            "IBLOCK_ID" => "1",
                            "NEWS_COUNT" => "20",
                            "SORT_BY1" => "ACTIVE_FROM",
                            "SORT_ORDER1" => "DESC",
                            "SORT_BY2" => "SORT",
                            "SORT_ORDER2" => "ASC",
                            "FILTER_NAME" => "",
                            "FIELD_CODE" => array(
                                0 => "NAME",
                                1 => "PREVIEW_PICTURE",
                                2 => "",
                            ),
                            "PROPERTY_CODE" => array(
                                0 => "articul",
                                1 => "count",
                                2 => "price",
                                3 => "",
                            ),
                            "CHECK_DATES" => "Y",
                            "DETAIL_URL" => "",
                            "AJAX_MODE" => "N",
                            "AJAX_OPTION_JUMP" => "N",
                            "AJAX_OPTION_STYLE" => "Y",
                            "AJAX_OPTION_HISTORY" => "N",
                            "AJAX_OPTION_ADDITIONAL" => "",
                            "CACHE_TYPE" => "A",
                            "CACHE_TIME" => "36000000",
                            "CACHE_FILTER" => "N",
                            "CACHE_GROUPS" => "Y",
                            "PREVIEW_TRUNCATE_LEN" => "",
                            "ACTIVE_DATE_FORMAT" => "d.m.Y",
                            "SET_TITLE" => "Y",
                            "SET_BROWSER_TITLE" => "Y",
                            "SET_META_KEYWORDS" => "Y",
                            "SET_META_DESCRIPTION" => "Y",
                            "SET_LAST_MODIFIED" => "N",
                            "INCLUDE_IBLOCK_INTO_CHAIN" => "N",
                            "ADD_SECTIONS_CHAIN" => "Y",
                            "HIDE_LINK_WHEN_NO_DETAIL" => "N",
                            "PARENT_SECTION" => $_REQUEST["SECTION_ID"],
                            "PARENT_SECTION_CODE" => $_REQUEST["SECTION_CODE"],
                            "INCLUDE_SUBSECTIONS" => "Y",
                            "STRICT_SECTION_CHECK" => "N",
                            "DISPLAY_DATE" => "Y",
                            "DISPLAY_NAME" => "Y",
                            "DISPLAY_PICTURE" => "Y",
                            "DISPLAY_PREVIEW_TEXT" => "Y",
                            "PAGER_TEMPLATE" => "avtomir_pagenav",
                            "DISPLAY_TOP_PAGER" => "N",
                            "DISPLAY_BOTTOM_PAGER" => "Y",
                            "PAGER_TITLE" => "Производители",
                            "PAGER_SHOW_ALWAYS" => "N",
                            "PAGER_DESC_NUMBERING" => "N",
                            "PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",
                            "PAGER_SHOW_ALL" => "N",
                            "PAGER_BASE_LINK_ENABLE" => "N",
                            "SET_STATUS_404" => "N",
                            "SHOW_404" => "N",
                            "MESSAGE_404" => "",
                            "FILE_404" => ""
                        ),
                        false
                    ); ?>

                    <div class="category-banner">
                        <?php
                        //Перед использованием методов класса, подключаем
                        CModule::IncludeModule("fileman");
                        CMedialib::Init();

                        //Получения списка всех коллекций
                        $arCol = CMedialibCollection::GetList(array('arFilter' => array('ACTIVE' => 'Y')));

                        //Получения всех изображений коллекции с ID равным 1
                        $arItems = CMedialibItem::GetList(array('arCollections' => array("0" => 4)));

                        //Заполним массив путей к картинкам
                        $arImgPath = array();
                        foreach ($arItems as $arItem) {
                            $imgPath = $arItem['PATH'];
                            $arImgPath[] = $imgPath;
                        };
                        ?>

                        <?php foreach ($arImgPath as $num => $arImg): ?>
                            <img src="<?php echo $arImg;?>" alt="<?php echo $num;?>">
                        <?php endforeach; ?>
                    </div>
                <? } else {
                    $SecTwo = [];
                    $arSelect2 = Array("ID", "NAME", "IBLOCK_SECTION_ID", "SECTION_PAGE_URL", "PICTURE");
                    $arFilter2 = Array("IBLOCK_ID" => 1, "SECTION_ID" => $id_Sec, "ACTIVE" => "Y", "GLOBAL_ACTIVE" => "Y");
                    $res2 = CIBlockSection::GetList(Array("NAME" => "ASC"), $arFilter2, true, $arSelect2);
                    while($ob2 = $res2->GetNext()) {
                        $SecTwo[] = $ob2;
                    }

                    foreach ($SecTwo as $category_two):?>
                        <div class="category-item">
                            <a href="<? echo $category_two["SECTION_PAGE_URL"];?>">
                                <div class="category-img">
                                    <div class="category-img-wr">
                                        <?php if($category_two["PICTURE"] != "") {
                                            $category_two["PICTURE"] = CFile::GetFileArray($category_two["PICTURE"]); ?>
                                            <img src="<?php echo $category_two["PICTURE"]["SRC"]; ?>" alt="<? echo $category_two["NAME"];?>">
                                        <? } else {
                                            $category_two["PICTURE"] = SITE_TEMPLATE_PATH."/images/no_photo.png"; ?>
                                            <img src="<?php echo $category_two["PICTURE"]; ?>" alt="<? echo $category_two["NAME"];?>">
                                        <? } ?>
                                    </div>
                                </div>
                                <div class="category-text">
                                    <p><? echo $category_two["NAME"];?> (<? echo $category_two["ELEMENT_CNT"];?>)</p>
                                </div>
                            </a>
                        </div>
                    <? endforeach; ?>

                    <div class="category-banner">
                        <?php
                        //Перед использованием методов класса, подключаем
                        CModule::IncludeModule("fileman");
                        CMedialib::Init();

                        //Получения списка всех коллекций
                        $arCol = CMedialibCollection::GetList(array('arFilter' => array('ACTIVE' => 'Y')));

                        //Получения всех изображений коллекции с ID равным 1
                        $arItems = CMedialibItem::GetList(array('arCollections' => array("0" => 5)));

                        //Заполним массив путей к картинкам
                        $arImgPath = array();
                        foreach ($arItems as $arItem) {
                            $imgPath = $arItem['PATH'];
                            $arImgPath[] = $imgPath;
                        };
                        ?>

                        <?php foreach ($arImgPath as $num => $arImg): ?>
                            <img src="<?php echo $arImg;?>" alt="<?php echo $num;?>">
                        <?php endforeach; ?>
                    </div>
                <? } ?>
            <? } ?>
        </div>
    </div>
</main>

<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>