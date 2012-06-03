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
    @empty_table_view()
    @fill_table_view(r.clips)

  empty_table_view: ->
    puts "Emptying table view"
    @tv.setData([])

  fill_table_view: (clips) ->
    @rows = for i in [0...clips.length] by 2
      puts "...row #{i/2}"
      new ResultsTableViewRow(clips[i], clips[i+1]).view()
    puts "Setting tv with #{@rows.length} rows"
    puts @rows[0]
    @tv.setData(@rows)


