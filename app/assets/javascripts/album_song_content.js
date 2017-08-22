jQuery(document).ready(function($){
  document.addEventListener("turbolinks:load", function() {
    $(document).on('click',".replace-content-song", function() {
      var id;
      id = $(this).attr('data_id');
      $.ajax ( {
        url: '/albums/album_song',
        type: 'GET',
        data: 'id=' + id ,
        dataType: 'script'
      });
    });
  });
});
