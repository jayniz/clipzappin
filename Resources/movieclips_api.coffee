class Movieclips
  constructor: ->
    @base = "http://jsonclips.herokuapp.com"

  search: (q, callback) ->
    client = Ti.Network.createHTTPClient()
    client.open 'GET', @search_url(q)
    client.onload = (r) -> @handle_response(r, callback)
    client.send()

  handle_response: (r, callback) ->
    if parseInt(@status) == 200
      try
        clips = JSON.parse(@responseText)
        callback(success: true, clips: clips)
      catch e
        callback(success:false, error: JSON.stringify(e))
    else
      callback(success: false, error: @status)


