class ResultsTableView
  constructor: ->
    @table_view = Ti.UI.createTableView(
      top: 50
    )
    @init_search_handler()

  win: (window) ->
    window.add @table_view
    @

  init_search_handler: ->
    @sh = new SearchHandler().table_view(@table_view)
