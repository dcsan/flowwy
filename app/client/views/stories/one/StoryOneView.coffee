View = famous.core.View
Surface = famous.core.Surface
Transform = famous.core.Transform
StateModifier = famous.modifiers.StateModifier
FlexScrollView = flex.FlexScrollView
CollectionLayout = flex.layouts.CollectionLayout

_createBack = ->
  surface = new Surface
    size: [
      undefined
      undefined
    ]
    content: 'One Story'
    properties: 'background-color': '#67FBE6'

  modifier = new StateModifier
    origin: [0.5, 0.5]
    align: [0.5, 0.5]
  @add(modifier).add surface
  return

###
# @name StoryOneView
# @constructor
# @description
###

@StoryOneView = ->
  View.apply this, arguments
  _createBack.call this
  return

StoryOneView.prototype = Object.create(View.prototype)
StoryOneView::constructor = StoryOneView
StoryOneView.DEFAULT_OPTIONS = {}

# TODO respond to 'ready' event in instance