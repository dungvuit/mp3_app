jQuery(document).ready ($) ->
  top = jQuery('.menu-nav').offset().top - parseFloat(jQuery('.menu-nav').css('margin-top').replace(/auto/, 0))
  jQuery(window).scroll (event) ->
    if jQuery(this).scrollTop() >= top
      jQuery('.menu-nav').css
        'position': 'fixed'
        'top': 0
        'right': 0
        'left': 0
        'z-index': 9999
    else
      jQuery('.menu-nav').css
        'position': 'relative'
        'top': 0
        'z-index': 9999
    return
  return
