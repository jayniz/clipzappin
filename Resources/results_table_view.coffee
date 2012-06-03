class ResultsTableView
  constructor: ->
    @table_view = Ti.UI.createTableView(
      top:   43
      width: 320
      left:  0
      opacity: 0
      style: Ti.UI.iPhone.TableViewStyle.PLAIN,
      separatorStyle: Titanium.UI.iPhone.TableViewSeparatorStyle.NONE
      separatorColor: 'transparent'
    )
    @init_search_handler()

  win: (window) ->
    window.add @table_view
    @

  init_search_handler: ->
    @sh = new SearchHandler().table_view(@table_view)
