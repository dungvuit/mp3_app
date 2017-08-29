jQuery(document).ready(function($){
  document.addEventListener("turbolinks:load", function() {
    $(document).on('click',"#comment", function() {
      var id, content;
      id = $(this).attr('data_id');
      content = $('#content').val();
      $.ajax ( {
        url: '/songs/' + id + '/comments',
        type: 'POST',
        data: 'song_id=' + id  + '&content=' + content,
        dataType: 'script'
      });
    });
  });
});
