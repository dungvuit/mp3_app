$ ->
  $(window).scroll (event) ->
    if $(this).scrollTop() > 50
      $('#back-top').fadeIn()
    else
      $('#back-top').fadeOut()
  $(document).on 'click', '#back-top', ->
    $('body,html').animate {
      scrollTop: 0
    }, 500

