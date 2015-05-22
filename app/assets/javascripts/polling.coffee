window.Poller = {
  poll: function(timeout){
    if timeout is 0
      Poller.request()
    else
      this.pollTimeout = setTimeout ->
        Poller.request()
      , timeout || 5000
    },
  clear: function(){ clearTimeout(this.pollTimeout) },
  request: function(){
    first_id = $('.comment').first().data('id')
    $.get('/comments', after_id: first_id)
  }
}


  Poller.poll() if $('#comments').size() > 0
  return