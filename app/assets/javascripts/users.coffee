$(document).on 'change', '.search-filter select', () ->
  searchUsers()
  
window.searchUsers = () ->
  $searchBlock = $('.search-filter')
  lanName = $searchBlock.find("select option:selected").val()
  q = $searchBlock.find("input").val()
  data = {}
  if q != ""
    data.q = q
  if lanName != ''
    data.lanName = lanName
  $.ajax
    method: 'GET'
    url: '/users/search'
    dataType: 'script'
    data: data
