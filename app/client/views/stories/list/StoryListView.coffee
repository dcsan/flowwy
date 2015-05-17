View = famous.core.View
Surface = famous.core.Surface
Transform = famous.core.Transform
StateModifier = famous.modifiers.StateModifier
FlexScrollView = flex.FlexScrollView
CollectionLayout = flex.layouts.CollectionLayout

###
# @name StoryListView
# @constructor
# @description
###

_createBack = ->
  surface = new Surface(
    size: [
      undefined
      undefined
    ]
    content: 'Hello from About View'
    properties: 'background-color': '#67FBE6' )
  modifier = new StateModifier(
    origin: [
      0.5
      0.5
    ]
    align: [
      0.5
      0.5
    ])
  @add(modifier).add surface
  return

_createScrollView = ->
  surfaces = []
  scrollView = new FlexScrollView(
    layout: CollectionLayout
    mouseMove: true
    direction: 1
    layoutOptions:
      itemSize: [ undefined, 150 ]
      margins: [0, 0, 0, 0 ]
      spacing: [10, 5]
    dataSource: surfaces)
  i = 0
  surf = undefined
  while i <= 20
    node = new (famous.core.RenderNode)

    #TODO - get data from a subscription
    storyData = {
      title: 'story ' + i
    }
    surf = new ReactiveTemplate(
      size: [
        undefined
        undefined
      ]
      template: Template.StoryCard
      data: storyData
      classes: [ 'minicard' ]
      properties:
        color: 'black'
        textAlign: 'center'
        backgroundColor: 'white')
    surf.state = new StateModifier(transform: Transform.translate(0, 0, 1))
    surf.pipe scrollView
    surf.url = "/story/" + i
    node.add(surf.state).add surf

    # TODO routing from story list to story detail page
    surf.on('click', ->
      console.log("url is", this.url)
      FlowRouter.go(this.url);
    )

    # famous.utilities.Timer.setTimeout(function() {}, 100);
    surfaces.push node
    i++
  scrollView.state = new StateModifier(
    origin: [
      0.5
      0.5
    ]
    align: [
      0.5
      0.5
    ])
  @add(scrollView.state).add scrollView
  return

famodev.helpers
ReactiveTemplate = famodev.ReactiveTemplate

###
# @name StoryListView
# @constructor
# @description
###

@StoryListView = ->
  View.apply this, arguments
  _createBack.call this
  _createScrollView.call this
  return

StoryListView.prototype = Object.create(View.prototype)
StoryListView::constructor = StoryListView
StoryListView.DEFAULT_OPTIONS = {}
