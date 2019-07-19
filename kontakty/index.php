<?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");
$APPLICATION->SetTitle("Контакты");
?><main>
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
	<div class="contacts-wr">
		<div class="contacts-form">
			<form method="post">
				<fieldset>
 <legend>Пишите нам по любому вопросу</legend>
					<div class="contacts-box">
 <input type="text" name="name" placeholder="Ваше имя" required=""> <input type="text" name="tel_email" placeholder="Телефон или e-mail" required="">
					</div>
					<div class="textarea">
 <textarea name="text" id="text" placeholder="Дополнительный комментарий" rows="6" required=""></textarea>
					</div>
				</fieldset>
 <button type="submit" class="btn btn-submit">Отправить</button>
			</form>
		</div>
		<div class="contacts-info">
			<div class="contacts">
				<p class="tell">
 <a href="tel:+7(3522)63-00-68">+7 (3522) 63-00-68</a>
				</p>
				<p>
					&nbsp;8-965-835-66-89 (Viber)
				</p>
				<p class="city">
					 г. Курган, ул. Дзержинского, 68
				</p>
				<p class="web">
 <a href="https://автомир45.рф">https://автомир45.рф</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
 <img width="30" src="/images/ь.jpg" height="26"><a href="mailto:automir45@mail.ru">automir45@mail.ru</a>
				</p>
			</div>
		</div>
	</div>
</div>
<div class="map">
	 <script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A69df94a81536e2d88bef0986762c740d2baf36e023cfa89b8b68c4e5c3d2e192&amp;width=100%25&amp;height=443&amp;lang=ru_RU&amp;scroll=true"></script>
</div>
 </main>
<div class="overlay-container">
	<div class="window-container zoomin" style="width:280px;">
		<div align="center">
		</div>
	</div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $('.btn-submit').on('click', function() {
            $.ajax({
                url: "/action.php", // куда отправляем
                type: "post", // метод передачи
                dataType: "json", // тип передачи данных
                data: { // что отправляем
                    "user_name": 	$('input[name="name"]').val(),
                    "user_email": 	$('input[name="tel_email"]').val(),
                    "text_comment": $('textarea[name="text"]').val()
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
                    }, 3000);
                },
                error: function(xhr, status, error) {
                    alert(xhr.responseText + ' | \n' + status + ' | \n' + error);
                }
            });
        });
    });
</script><?php require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>