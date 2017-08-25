jQuery(document).ready(function($){
  document.addEventListener("turbolinks:load", function() {
    $(document).on('click',"#delete-comment", function() {
      var id;
      id = $(this).attr('data_id');
      song_id = $(this).attr('song_id')
      $.ajax ( {
        url: '/comments/' + id,
        type: 'DELETE',
        data: 'song_id=' + song_id,
        dataType: 'script'
      });
    });
  });
});
