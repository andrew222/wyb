window.update = ->
  $.ajax
    url: "/update_status"
    dateType: "script"

window.onlines = ->
  $.ajax
    url: "/onlines"
    dataType: "json"
    success: (data) ->
      names = data["names"]
      userElems = $(".users-list .comment-btn")
      $.each names, (idx, name) ->
        onlineElem = $(".comment-btn[data-name='"+name+"']")
        userElems = removeElem(userElems, onlineElem)
        onlineElem.find("i").removeClass("fa-comment-o").addClass("fa-comment")
      userElems.find("i").removeClass("fa-comment").addClass("fa-comment-o")
window.removeElem = (arr, elem) ->
  result = arr.filter (idx, srcElem) ->
    return srcElem != elem.get(0)
  return result

$(document).ready ->
  $(".setting-dropdown-btn").dropdown()

  $('.certificate-image').magnificPopup
    type: 'image'
    closeOnContentClick: true
    mainClass: 'mfp-img-mobile'
    image: verticalFit: true

  return
