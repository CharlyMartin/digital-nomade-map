// JQUERY
const page = $('html, body'),
  cta = $('#cta'),
  scrollDownButton = $('.scroll-down.pointer');

function scrollDown() {
  page.animate(
    {scrollTop: $('#here').offset().top},
    500);
  };

$(document).ready(function() {
  cta.click(scrollDown);
  scrollDownButton.click(scrollDown);
});
