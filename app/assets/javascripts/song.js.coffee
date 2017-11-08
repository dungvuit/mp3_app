$(document).ready ->
  document.addEventListener 'turbolinks:load', ->
    $('#button-add-favorite-song').click ->
      $('#button-hide-favorite-song').show()
      $('#container-favorite-song').show('slow')
      $(this).hide()
    $('#button-hide-favorite-song').click ->
      $('#container-favorite-song').hide('slow')
      $('#button-add-favorite-song').show()
      $(this).hide()
  # View content Song
    $(document).on 'click', '#show', ->
      $('.content-song').css
        height: '500'
        transition: '0.5s'
      $('#hide').show()
      $('#show').hide()
    $(document).on 'click', '#hide', ->
      $('.content-song').css
        height: '200'
        transition: '0.5s'
      $('#show').show()
      $('#hide').hide()
    # Search Song Admin Page
    $(document).on 'change', '#singer_name, #author_name, #category_name', ->
      $('.custom-btn').trigger 'click'
