class SearchView
  constructor: ->
    @view = Ti.UI.createView(
      top: 0
      height: 60
      backgroundImage: 'search_back.png'
    )
    @create_search_field()
    @create_search_button()

  win: (window) ->
    window.add @view
    @

  create_search_field: ->
    @f = Ti.UI.createTextField(
      left:   20
      top: 5
      height: 30
      width:  280
      value: 'Las Vegas'
      backgroundColor: 'transparent'
      font:
        fontFamily: 'Helvetica'
        fontSize: 16
      color: '#8c8c8b'
    )
    @view.add @f

  create_search_button: ->
    @b = Ti.UI.createButton(
      right:  0
      width:  50
      height: 50
    )
    @create_search_button_event_listener()
    @view.add @b

  create_search_button_event_listener: ->
    @b.addEventListener 'click', =>
      @f.blur()
      Ti.App.fireEvent('search', q: @f.value)

