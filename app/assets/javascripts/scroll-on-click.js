function scrollDown() {
  $('body').animate(
    {scrollTop: $('#scroll-down-stop').offset().top},
    500);
  };

$(document).ready(function() {
    $('#cta').click(scrollDown);
    $('.scroll-down.pointer').click(scrollDown);
    $('#sign-up').click(scrollDown);
});
