$ ->
  $(document).on 'click', '#add-song-favorite-album', ->
    id = $(this).attr('data_id')
    favorite_id = $(this).attr('favorite_id')
    $.ajax
      url: '/favorite_songs'
      type: 'POST'
      data: 'song_id=' + id + '&favorite_id=' + favorite_id
      dataType: 'script'
    return

  $(document).on 'click', '#delete-song-favorite-album', ->
    id = $(this).attr('favorite_songs')
    data_id = $(this).attr('data_id')
    if confirm('Are You Sure?')
      $.ajax
        url: '/favorite_songs/' + id
        data: 'song_id=' + data_id
        type: 'DELETE'
        dataType: 'script'
      return
