jQuery(document).ready(function($){
  document.addEventListener("turbolinks:load", function() {
    $(document).on('click',".reply-comment", function() {
      var id;
      id = $(this).attr('data_id');
      $('#reply_text_' + id).show();
      $('#save-comment-reply_' + id).show();
      $(this).hide();
      $('#cancel-comment-reply_' + id).show();
    });

    $(document).on('click', '.cancel-comment-reply', function() {
      var id;
      id = $(this).attr('data_id');
      $('#save-comment-reply_' + id).hide();
      $(this).hide();
      $('#reply_text_' + id).hide();
      $('#reply-comment_' + id).show();
    });

    $(document).on('click', '.save-comment-reply', function() {
      var id, song_id, content, parent_id;
      id = $(this).attr('data_id');
      song_id = $(this).attr('song_id');
      content = $('#reply_text_' + id).val();
      parent_id = $(this).attr('parent_id');
      $.ajax ({
        url: '/songs/' + song_id + '/comments',
        type: 'POST',
        data: 'song_id=' + song_id  + '&content=' + content + '&parent_id=' + parent_id,
        dataType: 'script'
      });
        $(this).hide();
        $('#cancel-comment-reply_' + id).hide();
        $('#reply_text_' + id).hide();
        $('#reply-comment_' + id).show();
    });
  });
});
