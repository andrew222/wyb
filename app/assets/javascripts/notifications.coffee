$(document).on 'click', '.new-notification-popup .save-btn', () ->
  $popup = $(".new-notification-popup")
  $popup.find("form.notification").submit()
