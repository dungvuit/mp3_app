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
    $.ajax
      url: '/favorites/' + favorite_id
      type: 'DELETE'
      dataType: 'script'
    return

