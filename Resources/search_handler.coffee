class SearchHandler
  constructor: ->
    @api = new MovieClipsAPI()
    Ti.App.addEventListener 'search', (e) => @handle_search(e)

  table_view: (tv) ->
    @tv = tv
    @

  handle_search: (e) ->
    @api.search(e.q, (r) => @handle_response(r))
    puts e

  handle_response: (r) ->
    puts "Search returned #{r.clips.length} clips"
