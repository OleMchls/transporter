transporterApp = angular.module 'transporter'

transporterApp.directive('city', ['$compile', 'SVGNodeService', ($compile, SVGNodeService) ->
  restrict: 'E',
  scope: '=',

  link: (scope, element, attrs) ->
    circleSize = 1

    circle = SVGNodeService.createSVGNode('circle', scope, r: "city | screenSize:#{circleSize}", cx: 'city | screenCoordinateX', cy: 'city | screenCoordinateY')
    element.replaceWith(circle);
])
