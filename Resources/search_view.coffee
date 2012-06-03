class SearchView
  constructor: ->
    @view = Ti.UI.createView(
      top: 1
      left: 0
      height: 60
      backgroundImage: 'search_back.png'
      width:320
    )
    @create_search_field()
    @create_search_button()

  win: (window) ->
    window.add @view
    @

  create_search_field: ->
    @f = Ti.UI.createTextField(
      left:   20
      top: 6
      height: 30
      width:  272
      value: 'Las Vegas'
      backgroundColor: 'transparent'
      font:
        fontFamily: 'Helvetica'
        fontSize: 16
      color: '#8c8c8b'
    )
    @view.add @f

  create_search_button: ->
    @b = Ti.UI.createView(
      top: 2
      right:  0
      width:  58
      height: 40
    )
    @bimg = Ti.UI.createImageView(
      width: 58
      bottom:-50
      height: 60
      image: 'loader_asset.png'
    )
    @b.add @bimg
    @create_search_button_event_listener()
    @view.add @b

  create_search_button_event_listener: ->
    @b.addEventListener 'click', =>
      # Let's leak
      animate = true

      Ti.App.addEventListener 'search_complete', -> animate = false
      a = Ti.UI.createAnimation(duration: 500, curve:Titanium.UI.ANIMATION_CURVE_EASE_IN)
      a.bottom = 0
      b = Ti.UI.createAnimation(duration: 500, curve:Titanium.UI.ANIMATION_CURVE_EASE_OUT)
      b.bottom = -50
      a.addEventListener 'complete', => @bimg.animate(b)
      b.addEventListener 'complete', => @bimg.animate(a) if animate
      @bimg.animate(a)
      @f.blur()

      Ti.App.fireEvent('search', q: @f.value)

