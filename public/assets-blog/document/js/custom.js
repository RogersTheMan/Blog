/***************************Center Modal****************************/
(function($) {
  "use strict";
  $('a.js-scroll-trigger[href*="#"]:not([href="#"])').click(function() {
    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
      if (target.length) {
        $('html, body').animate({
          scrollTop: (target.offset().top - 30)
        }, 1000, "easeInOutExpo");
        return false;
      }
    }
  });



 $('body').scrollspy({
    target: 'header',
    offset: 54
  });

})(jQuery);
/*****************Start Document Ready Function*******************/
$(document).ready(function(){
    $('.sidebar ul li > a').on('click', function(){
        $(".sidebar ul li > a").removeClass('active');
        ///$(this).removeAttr('href');
        var element = $(this).parent('li');
        if (element.hasClass('open')) 
        {
            element.removeClass('open');
            element.children('a').removeClass('active');
            element.find('li').removeClass('open');
            element.find('ul').slideUp(300);
        } 
        else 
        {
            element.addClass('open');
            element.children('a').addClass('active');
            element.children('ul').slideDown(300);
            element.siblings('li').children('ul').slideUp(300);
            element.siblings('li').removeClass('open');
            element.siblings('li').find('li').removeClass('open');
            element.siblings('li').find('ul').slideUp(300);
        }
    });
});

