$ ->
  $(document).on 'click', '#add-favorite', ->
    name = $('#name').val()
    id = $(this).attr('data_id')
    $.ajax
      url: '/favorites'
      type: 'POST'
      data: 'song_id=' + id + '&name=' + name
      dataType: 'script'
    return

  $(document).on 'click', '#delete-favorite-album', ->
    favorite_id = $(this).attr('favorite_id')
    id = $(this).attr('data_id')
    if confirm('Are You Sure?')
      $.ajax
        url: '/favorites/' + favorite_id
        type: 'DELETE'
        data: 'song_id=' + id
        dataType: 'script'
      return

