jQuery(document).ready ($) ->
  # Replace content song
  $(document).on 'click', '.replace-content-song', ->
    id = undefined
    id = $(this).attr('data_id')
    $.ajax
      url: '/albums/album_song'
      type: 'GET'
      data: 'id=' + id
      dataType: 'script'
    return
  return
