var View          = famous.core.View;
var Surface       = famous.core.Surface;
var EventHandler  = famous.core.EventHandler;
var StateModifier = famous.modifiers.StateModifier;

// var FlexScrollView = require('FlexScrollView');
var FlexScrollView = flex.FlexScrollView;
var CollectionLayout = flex.layouts.CollectionLayout;

/*
 * @name FlexyView
 * @constructor
 * @description
 */

FlexyView = function() {
    View.apply(this, arguments);

    var surface = new Surface({
        size: [500, 500],
        content: "Hello world",
        properties: {
            'background-color': 'red'
        }
    });

    surface.on('click', function() {
        FlowRouter.go('/about');
    })

    var modifier = new StateModifier({
        origin: [0.5, 0.5],
        align: [0.5, 0.5]
    });

    this.add(modifier).add(surface);
}

FlexyView.prototype = Object.create(View.prototype);
FlexyView.prototype.constructor = FlexyView;

FlexyView.DEFAULT_OPTIONS = {
};




// Create scrollable layout where items have a fixed width/height
var scrollView = new FlexScrollView({
  layout: CollectionLayout,
  layoutOptions: {
  itemSize: [100, 100], // item has width and height of 100 pixels
  margins: [10, 5, 10, 5], // outer margins
  spacing: [10, 10] // spacing between items
  },
  dataSource: [
  new Surface({content: 'item 1'}),
  new Surface({content: 'item 2'}),
  new Surface({content: 'item 3'})
  ]
});
