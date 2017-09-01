jQuery(document).ready(function($){
  $(document).on('click',"#dislike", function() {
    var id;
    id = $(this).attr('data_id');
    console.log($(this).attr('data_id'))
    $.ajax ( {
      url: '/likes/' + id,
      type: 'DELETE',
      dataType: 'script'
    });
  });
});
