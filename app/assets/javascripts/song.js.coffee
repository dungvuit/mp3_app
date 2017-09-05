$(document).ready ->
  document.addEventListener 'turbolinks:load', ->
  # View content Song
    $('#show').click ->
      $('.content-song').css
        height: '500'
        transition: '0.5s'
      $('#hide').show()
      $('#show').hide()
    $('#hide').click ->
      $('.content-song').css
        height: '200'
        transition: '0.5s'
      $('#show').show()
      $('#hide').hide()
    # Search Song Admin Page
    $(document).on 'change', '#singer_name, #author_name, #category_name', ->
      $('.custom-btn').trigger 'click'
