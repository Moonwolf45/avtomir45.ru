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
                $arSelect = Array("ID", "NAME", "SECTION_PAGE_URL", "PICTURE");
                $arFilter = Array("IBLOCK_ID" => 1, "ACTIVE" => "Y", "GLOBAL_ACTIVE" => "Y", "DEPTH_LEVEL" => 1);
                $res = CIBlockSection::GetList(Array("NAME" => "ASC"), $arFilter, true, $arSelect);
                while($ob = $res->GetNext()) { ?>
                    <div class="category-item">
                        <a href="<? echo $ob["SECTION_PAGE_URL"];?>">
                            <div class="category-img">
                                <div class="category-img-wr">
                                    <? if ($ob["PICTURE"] != "") {
                                        $arSection["PICTURE"] = CFile::GetFileArray($ob["PICTURE"]);
                                    } else {
                                        $arSection["PICTURE"] = SITE_TEMPLATE_PATH."/images/no_photo.png";
                                    } ?>
                                    <img src="<? echo $arSection["PICTURE"];?>" alt="<? echo $arSection["NAME"];?>">
                                </div>
                            </div>
                            <div class="category-text">
                                <p><? echo $ob["NAME"];?> (<?=$ob["ELEMENT_CNT"];?>)</p>
                            </div>
                        </a>
                    </div>
                <? }
            } ?>
            <div class="category-banner">
                <?php
                //Перед использованием методов класса, подключаем
                CModule::IncludeModule("fileman");
                CMedialib::Init();

                //Получения списка всех коллекций
                $arCol = CMedialibCollection::GetList(array('arFilter' => array('ACTIVE' => 'Y')));

                //Получения всех изображений коллекции с ID равным 1
                $arItems = CMedialibItem::GetList(array('arCollections' => array("0" => 3)));

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
        </div>
    </div>
</main>

<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>