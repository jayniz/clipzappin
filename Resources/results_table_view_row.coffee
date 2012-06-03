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
      classname: 'result',
      height: 100
      width: 320
      top: 0
      left: 0
    )

  create_clip_views: ->
    @cv1 = @create_clip_view(@clips[0], 0)
    @cv2 = @create_clip_view(@clips[1], 150)
    true

  create_clip_view: (clip, left) ->
    c = Ti.UI.createImageView(
      height: 100
      width: 160
      top: 0
      left: left
      image: clip.image_url
    )
    @row.add c
