transporterApp = angular.module 'transporter'

transporterApp.directive('city', ['$compile', 'SVGNodeService', ($compile, SVGNodeService) ->
  restrict: 'E',
  scope: '=',

  link: (scope, element, attrs) ->
    circleSize = 1

    circle = SVGNodeService.createSVGNode('circle', scope, r: "city | screenSize:#{circleSize}", cx: 'city | screenCoordinateX', cy: 'city | screenCoordinateY')
    circle.classList.add('city')
    circle.addEventListener('click', -> scope.$apply -> scope.select(scope.city))

    scope.$watch 'selectedCity', (newValue, oldValue) ->
      circle.classList.remove('selected')
      circle.classList.add('selected') if newValue is scope.city

    element.replaceWith(circle);
])
