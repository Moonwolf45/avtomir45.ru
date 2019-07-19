<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/main/include/prolog_before.php");

	$msg_box = ""; // в этой переменной будем хранить сообщения формы
	$errors = array(); // контейнер для ошибок
	// проверяем корректность полей
	if($_REQUEST['user_name'] == "") 	 $errors[] = "Поле 'Ваше имя' не заполнено!";
	if($_REQUEST['user_email'] == "") 	 $errors[] = "Поле 'Телефон или e-mail' не заполнено!";
	if($_REQUEST['text_comment'] == "") $errors[] = "Поле 'Дополнительный комментарий' не заполнено!";

	// если форма без ошибок
	if(empty($errors)) {
		// собираем данные из формы
		$message  = "Имя пользователя: " . $_REQUEST['user_name'] . "<br>";
        if ($_REQUEST['vin'] != '') {
            $message  .= "VIN автомобиля: " . $_REQUEST['vin'] . "<br>";
        }
		$message .= "Телефон или e-mail пользователя: " . $_REQUEST['user_email'] . "<br>";
		$message .= "Текст письма: " . $_REQUEST['text_comment'];
		send_mail($message); // отправим письмо
		// выведем сообщение об успехе
		$msg_box = "<span style='color:green;'>Сообщение успешно отправлено!</span>";
	} else {
		// если были ошибки, то выводим их
		$msg_box = "";
		foreach ($errors as $one_error) {
			$msg_box .= "<span style='color:red;'>$one_error</span><br>";
		}
	}

	// делаем ответ на клиентскую часть в формате JSON
	echo json_encode(array(
		'result' => $msg_box
	));

	// функция отправки письма
	function send_mail($message){
		// почта, на которую придет письмо
        $rsSites = CSite::GetByID('s1');
        $arSite = $rsSites->Fetch();
		$mail_to = $arSite['EMAIL'];
		// тема письма
		$subject = "Обатная связь | автомир45.рф";
		
		// заголовок письма
		$headers= "MIME-Version: 1.0\r\n";
		$headers .= "Content-type: text/html; charset=utf-8\r\n"; // кодировка письма
		$headers .= "From: info@xn--45-6kci4axnso.xn--p1ai\r\n"; // от кого письмо
		
		// отправляем письмо 
		mail($mail_to, $subject, $message, $headers);
	}
?>
