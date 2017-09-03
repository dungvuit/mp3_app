jQuery(document).ready ($) ->
  # Like Song
  $(document).on 'click', '#like', ->
    id = undefined
    id = $(this).attr('data_id')
    $.ajax
      url: '/likes'
      type: 'POST'
      data: 'song_id=' + id
      dataType: 'script'
    return

  # Dislike Song
  $(document).on 'click', '#dislike', ->
    id = undefined
    id = $(this).attr('data_id')
    console.log $(this).attr('data_id')
    $.ajax
      url: '/likes/' + id
      type: 'DELETE'
      dataType: 'script'
    return
  return
