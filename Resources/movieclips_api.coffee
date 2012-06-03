class MovieClipsAPI
  constructor: ->
    @base = "http://jsonclips.herokuapp.com"

  search: (q, callback) ->
    client = Ti.Network.createHTTPClient()
    client.open 'GET', @search_url(q)
    client.onload = (r) -> 
      if parseInt(@status) == 200
        try
          clips = JSON.parse(@responseText)
          callback(success: true, clips: clips)
        catch e
          callback(success:false, error: JSON.stringify(e))
      else
        callback(success: false, error: @status)
    client.send()

  search_url: (q) ->
    t = Ti.Network.encodeURIComponent(q)
    url = "#{@base}/search?q=#{t}"
    puts url
    url

  get_stream_url: (clip_id, callback) ->
    uri = "http://movieclips.com/webservices/get-movieclip-stream-url/?id=#{clip_id}"
    puts "Getting #{uri}"
    client = Ti.Network.createHTTPClient()
    client.open 'GET', uri
    client.onload = (r) -> 
      if parseInt(@status) == 200
        try
          data = JSON.parse(@responseText)
          url = "http://ios.movieclips.com#{data.url}"
          puts "Found URL: #{url}"
          callback(success: true, url: url)
        catch e
          callback(success:false, error: JSON.stringify(e))
      else
        callback(success: false, error: @status)
    client.send()


