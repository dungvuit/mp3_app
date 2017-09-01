$(document).ready ->
  $('#show').click ->
    $('.content-song').css
      height: '500'
      transition: '0.5s'
    $('#hide').show()
    $('#show').hide()
    return
  $('#hide').click ->
    $('.content-song').css
      height: '200'
      transition: '0.5s'
    $('#show').show()
    $('#hide').hide()
    return
  return
