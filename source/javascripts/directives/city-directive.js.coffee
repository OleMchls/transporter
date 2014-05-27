transporterApp = angular.module 'transporter'

transporterApp.directive('city', ['$compile', 'SVGNodeService', ($compile, SVGNodeService) ->
  restrict: 'E',
  scope: '=',

  link: (scope, element, attrs) ->
    circle = SVGNodeService.createSVGNode('circle', scope, r: 40, cx: 'city | screenCoordinateX', cy: 'city | screenCoordinateY')
    element.replaceWith(circle);
])
