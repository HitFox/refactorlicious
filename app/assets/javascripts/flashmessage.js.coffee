hide = (element) ->
  element.addClass 'hidden'

$(document).on 'ready', ->
  $message = $('.flashmessage')
  return if $message.length is 0

  setTimeout hide.bind(@, $message), 3000
