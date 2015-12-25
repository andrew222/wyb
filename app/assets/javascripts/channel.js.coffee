client = new Faye.Client('/faye')

client.subscribe '/channels/new', (payload)->
  console.log(payload)
  $('ul#chat').append("<li>#{payload.created_at} : #{payload.message}</li>")

$(document).ready ->
  $form = $('form.channel')
  input = $form.find('#message')
  button = $('.actions button')
  $form.submit (event) ->
    button.attr('disabled', 'disabled')
    button.val('Posting...')
    publication = client.publish '/channels/new',
      message: input.val()
      created_at: new Date()
    publication.callback ->
      input.val('')
      button.removeAttr('disabled')
      button.val("Post")
    publication.errback ->
      button.removeAttr('disabled')
      button.val("Try Again")
    event.preventDefault()
    false

window.client = client
