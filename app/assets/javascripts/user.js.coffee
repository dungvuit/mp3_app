jQuery(document).ready ($) ->
  # Search user wth permision by checkbox
  document.addEventListener 'turbolinks:load', ->
    $('input[name="search_by_permision"]').click ->
      if $(this).siblings(':checked').attr('checked', false)
        $('.custom-btn').trigger 'click'
      return
    return
  return
