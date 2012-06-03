Ti.include "movieclips_api.js"
Ti.include "search_window.js"
Ti.include "search_view.js"
Ti.include "search_handler.js"
Ti.include "results_table_view.js"

puts = (w) ->
  Titanium.API.error JSON.stringify(w)

new SearchWindow().open()
