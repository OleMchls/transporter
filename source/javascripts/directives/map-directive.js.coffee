transporterApp = angular.module 'transporter'

transporterApp.directive('transporterMap', ['$compile', '$window', 'ViewportService', 'MapService', ($compile, $window, Viewport, Map) ->
  restrict: 'A',
  scope: '=',

  link:
    pre: (scope, iElement, iAttrs, controller) ->
      scope.viewport = new Viewport(width: 0, height: 0);
      scope.map = new Map(viewport: scope.viewport);
      scope.mapInitialized = true

    post: (scope, iElement, iAttrs, controller) ->
      scope.onResizeFunction = ->
        scope.viewport.width = iElement[0].offsetWidth
        scope.viewport.height = iElement[0].offsetHeight

      # Call to the function when the page is first loaded
      scope.onResizeFunction()
      angular.element($window).bind "resize", ->
        scope.onResizeFunction()
        scope.$apply()
])
