class SearchWindow
  constructor: ->
    @win = Ti.UI.createWindow()
    @create_table_view()
    @create_search_view()


  create_table_view: ->
    @table_view = new ResultsTableView()
    @table_view.win(@win)

  create_search_view: ->
    @search_view = new SearchView()
    @search_view.win(@win)

  open: ->
    @win.open()

