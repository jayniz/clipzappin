Ti.include "movieclips_api.js"
Ti.include "webview_proxy.js"
Ti.include "search_window.js"
Ti.include "search_view.js"
Ti.include "search_handler.js"
Ti.include "results_table_view_row.js"
Ti.include "results_table_view.js"

puts = (w) ->
  Titanium.API.error JSON.stringify(w)

delay = 1
setTimeout (-> new SearchWindow().open(); Ti.App.fireEvent 'search', q: "Las Vegas"), delay

