<?
$arUrlRewrite = array(
	array(
		"CONDITION" => "#^/katalog/([0-9a-zA-Z_-]+)/([0-9a-zA-Z_-]+)/# ",
		"RULE" => "SECTION_CODE=\$1&ELEMENT_ID=\$2",
		"ID" => "",
		"PATH" => "/katalog/detail.php",
	),
	array(
		"CONDITION" => "#^/katalog/([0-9a-zA-Z_-]+)/# ",
		"RULE" => "SECTION_CODE=\$1",
		"ID" => "",
		"PATH" => "/katalog/list.php",
	),
	array(
		"CONDITION" => "#^/news/#",
		"RULE" => "",
		"ID" => "bitrix:news",
		"PATH" => "/news/index.php",
	),
);

?>