class WebviewProxy
  constructor: ->
    @wv = Ti.UI.createWebView(
      height: 10
      width: 320
      bottom: 0
      left: 0
    )
    @register_event_listener()

  view: ->
    @wv

  register_event_listener: (e) ->
    Ti.App.addEventListener 'view_movie', (e) =>
      puts "Proxy opening #{e.url}"
      @wv.url = e.url

