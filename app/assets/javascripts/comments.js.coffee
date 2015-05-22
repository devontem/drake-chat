window.client = new Faye.Client('/faye')
 
jQuery ->
  client.subscribe '/comments', (payload) -> #watches the /comments view for updates, when new @comment, sends as 'payload'
    $('#comments').find('.media-list').prepend(payload.message) if payload.message

  $('#new_comment').submit -> $(this).find("input[type='submit']").val('Sending...').prop('disabled', true)