class SearchHandler
  constructor: ->
    Ti.App.addEventListener 'search', @handle_search

  table_view: (tv) ->
    @tv = tv
    @

  handle_search: (e) ->
    puts e
