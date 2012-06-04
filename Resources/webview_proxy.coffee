class WebviewProxy
  constructor: ->
    @wv = Ti.UI.createWebView(
      height: 1
      width: 320
      bottom: 0
      left: 0
    )
    @vp = Titanium.Media.createVideoPlayer()
    @vp.hide()
    # @wv.addEventListener 'error', -> setTimeout((=> puts "did load"; @wv.url = "http://google.com"), 3000)
    @register_event_listener()

  view: ->
    @vp

  register_event_listener: (e) ->
    Ti.App.addEventListener 'view_movie', (e) =>
      @vp.url = e.url
      @vp.show()
      @vp.play()
      # puts "Proxy opening #{e.url}"
      # @wv.url = e.url
