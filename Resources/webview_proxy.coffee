class WebviewProxy
  constructor: ->
    @vp = Titanium.Media.createVideoPlayer(
      movieControlMode:Titanium.Media.VIDEO_CONTROL_DEFAULT
      fullscreen: true
      height: 1
      bottom:0
    )
    @vp.hide()
    @register_event_listener()

  view: ->
    @vp

  register_event_listener: (e) ->
    @vp.addEventListener 'fullscreen', (e) =>
      return if e.entering
      @vp.stop()
      @vp.hide()
    Ti.App.addEventListener 'view_movie', (e) =>
      @vp.url = e.url
      @vp.show()
      @vp.play()
