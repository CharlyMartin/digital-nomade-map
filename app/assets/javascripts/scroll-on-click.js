function scrollDown() {
  $('body, html').animate(
    {scrollTop: $('#sign-up').offset().top},
    500);
  };

$(document).ready(function() {
    $('#cta').click(scrollDown);
    $('.scroll-down.pointer').click(scrollDown);
    $('#sign-up').click(scrollDown);
});
