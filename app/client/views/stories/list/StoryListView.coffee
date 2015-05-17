View = famous.core.View
Surface = famous.core.Surface
EventHandler = famous.core.EventHandler
StateModifier = famous.modifiers.StateModifier

###
# @name StoryListView
# @constructor
# @description
###

@StoryListView = ->
  View.apply this, arguments
  surface = new Surface
    size: [
      undefined, undefined
    ]
    content: 'StoryListView'
    properties: 'background-color': 'red'

  # surface.on('click', function() {
  #     FlowRouter.go('/about');
  # })

  modifier = new StateModifier
    origin: [0.5, 0.5]

    align: [
      0.5
      0.5
    ]

  @add(modifier).add surface
  return

StoryListView.prototype = Object.create(View.prototype)
StoryListView::constructor = StoryListView
StoryListView.DEFAULT_OPTIONS = {}

