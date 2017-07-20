// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

jQuery(document).ready(function($){
  var top = jQuery('.menu-nav').offset().top - parseFloat(jQuery('.menu-nav').css('margin-top').replace(/auto/, 0));
  jQuery(window).scroll(function (event) {
    if (jQuery(this).scrollTop() >= top) {
      jQuery('.menu-nav').css({
        'position': 'fixed',
        'top': 0,
        'right': 0,
        'left': 0,
        'z-index': 9999
      });
    } else {
        jQuery('.menu-nav').css({
          'position': 'relative',
          'top': 0,
          'z-index': 9999
        });
      }
  });
});
