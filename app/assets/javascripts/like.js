jQuery(document).ready(function($){
  document.addEventListener("turbolinks:load", function() {
    $("#like").on('click', function() {
      var id;
      id = $(this).attr('data_id');
      $.ajax ( {
        url: '/likes',
        type: 'POST',
        data: 'song_id=' + id ,
        dataType: 'script'
      });
    });
  });
});
