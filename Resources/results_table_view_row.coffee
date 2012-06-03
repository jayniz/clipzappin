class ResultsTableViewRow
  constructor: (clip1, clip2) ->
    clip1 ?= {}
    clip2 ?= {}
    @clips = [clip1, clip2]
    @create_row()
    @create_clip_views()

  view: ->
    @row

  create_row: ->
    @row = Ti.UI.createTableViewRow(
      allowSelection: false
      classname: 'result'
      height: 100
      width: 320
      top: 0
      left: 0
      selectionStyle: Titanium.UI.iPhone.TableViewCellSelectionStyle.NONE
    )

  create_clip_views: ->
    @cv1 = @create_clip_view(@clips[0], 0)
    @cv2 = @create_clip_view(@clips[1], 160)
    true

  create_clip_view: (clip, left) ->
    v = Ti.UI.createImageView(
      height: 100
      width: 160
      top: 0
      left: left
      image: clip.image_url
    )
    @add_event_listener clip, v
    @row.add v

  add_event_listener: (clip, view) ->
    view.addEventListener 'click', ->
      api = new MovieClipsAPI()
      api.get_stream_url clip.id, (s) ->
        puts s
        if s.success
          Ti.App.fireEvent 'view_movie', url: s.url
        else
          alert "woops"
