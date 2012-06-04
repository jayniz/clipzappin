class SearchWindow
  constructor: ->
    @win = Ti.UI.createWindow(
      backgroundColor: '#fff'
      orientationModes: [Titanium.UI.LANDSCAPE_LEFT, Titanium.UI.LANDSCAPE_RIGHT, Titanium.UI.PORTRAIT]
    )
    @create_background_view()
    @create_table_view()
    @create_search_view()
    @create_webview_proxy()

  create_webview_proxy: ->
    @win.add new WebviewProxy().view()

  create_table_view: ->
    @table_view = new ResultsTableView()
    @table_view.win(@win)

  create_search_view: ->
    @search_view = new SearchView()
    @search_view.win(@win)

  create_background_view: ->
    @bg_view = Ti.UI.createImageView(
      width: 76
      height: 66
      top: 200
      left: 120
      image: 'noresults_back.png'
    )
    @bg_view.addEventListener 'click', => @background_click_handler()
    @win.add @bg_view

  background_click_handler: ->
    unless @d
      @d = Ti.UI.createOptionDialog(
        title: "@jannis made this at Movie Hack Day 2012. It displays movie clips from movieclips.com, using http://jsonclips.herokuapp.com. Design by @cuchicosta"
        options: ["moviehackday.com", "@jannis", "@cuchicosta", "jsonclips.herokuapp.com", "Back"]
      )
      @d.addEventListener 'click', (e) =>
        if e.index == 0
          Ti.Platform.openURL("http://moviehackday.com")
        else if e.index == 1
          Ti.Platform.openURL("http://twitter.com/jannis")
        else if e.index == 2
          Ti.Platform.openURL("http://twitter.com/cuchicosta")
        else if e.index == 3
          Ti.Platform.openURL("http://jsonclips.herokuapp.com")
    @d.show()


  open: ->
    @win.open()

