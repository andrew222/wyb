$(document).ready ->
  $(".setting-dropdown-btn").dropdown()

  $('.certificate-image').magnificPopup
    type: 'image'
    closeOnContentClick: true
    mainClass: 'mfp-img-mobile'
    image: verticalFit: true

  return
