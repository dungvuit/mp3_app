jQuery(document).ready(function($){
  document.addEventListener("turbolinks:load", function() {
    $("#dislike").on('click', function() {
      var id;
      id = $(this).attr('data_id');
      $.ajax ( {
        url: '/likes/' + id,
        type: 'DELETE',
        dataType: 'script'
      });
    });
  });
});
