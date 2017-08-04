jQuery(document).ready(function($){
  document.addEventListener("turbolinks:load", function() {
    $('input[name="search_by_permision"]').click(function() {
      if($(this).siblings(":checked").attr('checked', false)) {
        $('.custom-btn').trigger('click');
       }
    });
  })
});
