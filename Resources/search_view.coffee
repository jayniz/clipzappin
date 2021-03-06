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
    @create_search_event_listener()

  win: (window) ->
    window.add @view
    @

  create_search_field: ->
    @f = Ti.UI.createTextField(
      returnKeyType: Titanium.UI.RETURNKEY_SEARCH
      left:   20
      top: 10
      height: 30
      width:  272
      hintText: "Enter search phrase"
      backgroundColor: 'transparent'
      font:
        fontFamily: 'Helvetica'
        fontSize: 16
      color: '#8c8c8b'
    )
    @f.addEventListener 'blur', =>
      Ti.App.fireEvent('search', q: "#{@f.value}")

    @view.add @f

  create_search_button: ->
    @b = Ti.UI.createView(
      top: 2
      right:  0
      width:  58
      height: 48
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
      @f.blur()

  create_search_event_listener: ->
    Ti.App.addEventListener 'search', =>
      animate = true
      Ti.App.addEventListener 'search_complete', -> animate = false
      a = Ti.UI.createAnimation(duration: 500, curve:Titanium.UI.ANIMATION_CURVE_EASE_IN)
      a.bottom = 0
      a.addEventListener 'complete', (=> @bimg.bottom = -50; @bimg.animate(a) if animate)
      @bimg.animate(a)


