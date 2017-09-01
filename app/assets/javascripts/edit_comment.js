jQuery(document).ready(function($){
  $(document).on('click',".edit-comment", function() {
    var id, song_id;
    id = $(this).attr('data_id');
    song_id = $(this).attr('song_id');
    $("#cmt_" + id).hide()
    $("#cmt_text_" + id).show();
    $('#save_' + id).show();
    $('#cancel_' + id).show();
    $('#delete-comment_' + id).hide();
    $(this).hide();
  });

  $(document).on('click',".cancel", function() {
    id = $(this).attr('data_id');
    $('#edit-comment_' + id).show();
    $('#delete-comment_' + id).show();
    $('#save_' + id).hide();
    $("#cmt_" + id).show();
    $("#cmt_text_" + id).hide();
    $(this).hide();
  });

  $(document).on('click',".save", function() {
    var id, song_id, content;
    id = $(this).attr('data_id');
    song_id = $(this).attr('song_id');
    content = $("#cmt_text_" + id).val();
    $.ajax ( {
      url: '/songs/' + song_id + '/comments/' + id,
      type: 'PATCH',
      data: 'content=' + content,
      dataType: 'script'
    });
      $("#cmt_text_" + id).hide();
      $("#cmt_" + id).show();
      $("#cmt_" + id).text(content);
      $('#save_' + id).hide();
      $('#cancel_' + id).hide();
      $('#edit-comment_' + id).show();
      $('#delete-comment_' + id).show();
  });
});
