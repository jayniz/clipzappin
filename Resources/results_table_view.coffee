class ResultsTableView
  constructor: ->
    @table_view = Ti.UI.createTableView(
      top: 50
    )

  win: (window) ->
    window.add @table_view
    @

