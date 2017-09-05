$ ->
  if $('.menu-nav').length is 1
    top = $('.menu-nav').offset().top - parseFloat($('.menu-nav').css('margin-top').replace(/auto/, 0))
    $(window).scroll (event) ->
      if $(this).scrollTop() >= top
        $('.menu-nav').css
          'position': 'fixed'
          'top': 0
          'right': 0
          'left': 0
          'z-index': 9999
      else
        $('.menu-nav').css
          'position': 'relative'
          'top': 0
          'z-index': 9999
