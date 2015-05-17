var View          = famous.core.View;
var Surface       = famous.core.Surface;
var EventHandler  = famous.core.EventHandler;
var StateModifier = famous.modifiers.StateModifier;

/*
 * @name HomeView
 * @constructor
 * @description
 */

HomeView = function() {
    View.apply(this, arguments);

    this._eventInput.on('ready', function() {
        console.info("HomeView.js is ready");
    });

    this._eventInput.on('leave', function() {
        console.info("leaving HomeView.js");
    });

    _createSurface.call(this);
}

HomeView.prototype = Object.create(View.prototype);
HomeView.prototype.constructor = HomeView;

HomeView.DEFAULT_OPTIONS = {
};

function _createSurface() {
    var surface = new Surface({
        size: [500, 500],
        content: "Hello world",
        properties: {
            'color': 'white',
            'text-align': 'center',
            'font-size': '2em',
            'line-height': '500px',
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