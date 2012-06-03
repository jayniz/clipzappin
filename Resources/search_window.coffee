class SearchWindow
  constructor: ->
    @win = Ti.UI.createWindow(backgroundColor: '#fff')
    @create_webview_proxy()
    @create_table_view()
    @create_search_view()

  create_webview_proxy: ->
    @win.add new WebviewProxy().view()

  create_table_view: ->
    @table_view = new ResultsTableView()
    @table_view.win(@win)

  create_search_view: ->
    @search_view = new SearchView()
    @search_view.win(@win)

  open: ->
    @win.open()

