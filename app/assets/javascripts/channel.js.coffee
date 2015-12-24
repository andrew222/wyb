client = new Faye.Client('/faye')

client.subscribe '/chat/1', (payload)->
  time = moment(payload.created_at)
  # You probably want to think seriously about XSS here:
  $('ul#chat').append("<li>#{time} : #{payload.message}</li>")

$(document).ready ->
  $form = $('form.channel')
  input = $form.find('#message')
  button = $('.actions button')
  $form.submit (event) ->
    alert("test")
    button.attr('disabled', 'disabled')
    button.val('Posting...')
    publication = client.publish '/chat/1',
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

# in case anyone wants to play with the inspector.
window.client = client
