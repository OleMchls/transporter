transporterApp = angular.module 'transporter'

transporterApp.directive('truck', ['$compile', 'SVGNodeService', ($compile, SVGNodeService) ->
  restrict: 'E',
  scope: '=',

  link: (scope, element, attrs) ->
    rectSize = 2
    strokeWidth = 0.2

    rect = SVGNodeService.createSVGNode('rect', scope,
        width: "truck | screenSize:#{rectSize}",
        height: "truck | screenSize:#{rectSize}",
        x: "truck | screenCoordinateX:#{-0.5 * rectSize}",
        y: "truck | screenCoordinateY:#{-0.5 * rectSize}"
    )
    rect.classList.add('truck')


    line = SVGNodeService.createSVGNode('line', scope,
        x1: "truck.route.start  | screenCoordinateX",
        y1: "truck.route.start  | screenCoordinateY",
        x2: "truck.route.target | screenCoordinateX",
        y2: "truck.route.target | screenCoordinateY",
        stroke: "'black'",
        "stroke-width": "truck | screenSize:#{strokeWidth}"
    )
    line.classList.add('route')

    element[0].parentElement.appendChild(line)
    element.replaceWith(rect);
])
