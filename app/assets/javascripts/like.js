jQuery(document).ready(function($){
  document.addEventListener("turbolinks:load", function() {
    $(document).on('click',"#like", function() {
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
