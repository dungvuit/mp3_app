$(document).ready ->
  $('#show').click ->
    $('.content-song').css height: '500'
    $('#hide').show()
    $('#show').hide()
    return
  $('#hide').click ->
    $('.content-song').css height: '200'
    $('#show').show()
    $('#hide').hide()
    return
  return
