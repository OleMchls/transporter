transporterApp = angular.module 'transporter'

transporterApp.directive('truck', ['$compile', 'SVGNodeService', ($compile, SVGNodeService) ->
  restrict: 'E',
  scope: '=',

  link: (scope, element, attrs) ->
    rectSize = 2

    rect = SVGNodeService.createSVGNode('rect', scope,
        width: "truck | screenSize:#{rectSize}",
        height: "truck | screenSize:#{rectSize}",
        x: "truck | screenCoordinateX:#{-0.5 * rectSize}",
        y: "truck | screenCoordinateY:#{-0.5 * rectSize}"
    )

    rect.classList.add('truck')

    element.replaceWith(rect);
])
