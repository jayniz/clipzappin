class SearchView
  constructor: ->
    @view = Ti.UI.createView(
      top: 0
      height: 50
    )
    @create_search_field()
    @create_search_button()

  win: (window) ->
    window.add @view
    @

  create_search_field: ->
    f = Ti.UI.createTextField(
      backgroundColor: '#ffffff'
      left:   0
      height: 50
      width:  280
    )
    @view.add f

  create_search_button: ->
    b = Ti.UI.createButton(
      right:  0
      width:  50
      height: 50
    )
    @view.add b
