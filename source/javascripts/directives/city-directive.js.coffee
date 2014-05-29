transporterApp = angular.module 'transporter'

transporterApp.directive('city', ['$compile', 'SVGNodeService', ($compile, SVGNodeService) ->
  restrict: 'E',
  scope: '=',
  replace: true,
  compile: SVGNodeService.compile,
  template: '<circle ng-attr-r="city | screenSize:1" ng-attr-cx="city | screenCoordinateX" ng-attr-cy="city | screenCoordinateY" ng-class="{selected: citySelected(city)}" ng-click="select(city)" />'
])
