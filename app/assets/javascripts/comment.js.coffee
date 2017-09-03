jQuery(document).ready ($) ->
  # Comment
  $(document).on 'click', '#comment', ->
    id = undefined
    content = undefined
    id = $(this).attr('data_id')
    content = $('#content').val()
    $.ajax
      url: '/songs/' + id + '/comments'
      type: 'POST'
      data: 'song_id=' + id + '&content=' + content
      dataType: 'script'
    return

  # Delete Comment
  $(document).on 'click', '.delete-comment', ->
    id = undefined
    id = $(this).attr('data_id')
    song_id = $(this).attr('song_id')
    $.ajax
      url: '/songs/' + song_id + '/comments/' + id
      type: 'DELETE'
      dataType: 'script'
    return

  # Edit comment
  $(document).on 'click', '.edit-comment', ->
    id = undefined
    song_id = undefined
    id = $(this).attr('data_id')
    song_id = $(this).attr('song_id')
    $('#cmt_' + id).hide()
    $('#cmt_text_' + id).show()
    $('#save_' + id).show()
    $('#cancel_' + id).show()
    $('#delete-comment_' + id).hide()
    $(this).hide()
    return
  $(document).on 'click', '.cancel', ->
    id = $(this).attr('data_id')
    $('#edit-comment_' + id).show()
    $('#delete-comment_' + id).show()
    $('#save_' + id).hide()
    $('#cmt_' + id).show()
    $('#cmt_text_' + id).hide()
    $(this).hide()
    return
  $(document).on 'click', '.save', ->
    id = undefined
    song_id = undefined
    content = undefined
    id = $(this).attr('data_id')
    song_id = $(this).attr('song_id')
    content = $('#cmt_text_' + id).val()
    $.ajax
      url: '/songs/' + song_id + '/comments/' + id
      type: 'PATCH'
      data: 'content=' + content
      dataType: 'script'
    $('#cmt_text_' + id).hide()
    $('#cmt_' + id).show()
    $('#cmt_' + id).text content
    $('#save_' + id).hide()
    $('#cancel_' + id).hide()
    $('#edit-comment_' + id).show()
    $('#delete-comment_' + id).show()
    return

  # Reply Comment
  $(document).on 'click', '.reply-comment', ->
    id = undefined
    id = $(this).attr('data_id')
    $('#reply_text_' + id).show()
    $('#save-comment-reply_' + id).show()
    $(this).hide()
    $('#cancel-comment-reply_' + id).show()
    return
  $(document).on 'click', '.cancel-comment-reply', ->
    id = undefined
    id = $(this).attr('data_id')
    $('#save-comment-reply_' + id).hide()
    $(this).hide()
    $('#reply_text_' + id).hide()
    $('#reply-comment_' + id).show()
    return
  $(document).on 'click', '.save-comment-reply', ->
    id = undefined
    song_id = undefined
    content = undefined
    parent_id = undefined
    id = $(this).attr('data_id')
    song_id = $(this).attr('song_id')
    content = $('#reply_text_' + id).val()
    parent_id = $(this).attr('parent_id')
    $.ajax
      url: '/songs/' + song_id + '/comments'
      type: 'POST'
      data: 'song_id=' + song_id + '&content=' + content + '&parent_id=' + parent_id
      dataType: 'script'
    $(this).hide()
    $('#cancel-comment-reply_' + id).hide()
    $('#reply_text_' + id).hide()
    $('#reply-comment_' + id).show()
    return
  return
