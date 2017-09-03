jQuery(document).ready ($) ->
  toastr.options =
    'closeButton': false
    'debug': false
    'newestOnTop': true
    'progressBar': false
    'positionClass': 'toast-top-left'
    'preventDuplicates': true
    'onclick': null
    'showDuration': '300'
    'hideDuration': '1000'
    'timeOut': '2000'
    'extendedTimeOut': '1000'
    'showEasing': 'swing'
    'hideEasing': 'linear'
    'showMethod': 'fadeIn'
    'hideMethod': 'fadeOut'
  return
