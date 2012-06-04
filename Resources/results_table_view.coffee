class ResultsTableView
  constructor: ->
    @table_view = Ti.UI.createTableView(
      top:   51
      width: 320
      left:  0
      opacity: 0
      style: Ti.UI.iPhone.TableViewStyle.PLAIN,
      separatorColor: '#000'
      backgroundColor: '#000'
    )
    @init_search_handler()

  win: (window) ->
    window.add @table_view
    @

  init_search_handler: ->
    @sh = new SearchHandler().table_view(@table_view)
