$( document ).ready(function() {
    $('a[href^="#"][data-scroll-link]').click(function () {
        var href = $(this).attr('href');
        $(href).addClass( "animated swing" );
        $('html, body').animate({
            scrollTop: $(href).offset().top
        }, 500);
        return false;
    });
});