jQuery(document).ready(function($){
  $(document).on('click',".delete-comment", function() {
    var id;
    id = $(this).attr('data_id');
    song_id = $(this).attr('song_id')
    $.ajax ( {
      url: '/songs/' + song_id + '/comments/' + id,
      type: 'DELETE',
      dataType: 'script'
    });
  });
});
