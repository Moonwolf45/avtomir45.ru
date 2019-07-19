$(document).ready(function () {
  $('.menu_class').click(function () {
    $('ul.the_menu').slideToggle('medium');
  });
  $('.slick-slider').slick({
    dots: true,
    arrows: false
  });
  (function () {
    var toggler = document.querySelector('.tog');
    var menu = document.querySelector('.moble-menu');
    var onMenuOperation = function (evt) {
      evt.preventDefault();
      toggler.classList.toggle('act');
      menu.classList.toggle('active');
    }

    toggler.addEventListener('click', onMenuOperation);
  })();


});
