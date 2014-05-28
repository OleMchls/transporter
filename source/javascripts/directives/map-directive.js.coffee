transporterApp = angular.module 'transporter'

transporterApp.directive('transporterMap', ['$compile', '$window', 'ViewportService', 'MapService', ($compile, $window, Viewport, Map) ->
  restrict: 'A',
  scope: '=',

  link:
    pre: (scope, iElement, iAttrs, controller) ->
      iAttrs.mapMargin ||= 20
      mapMargin = parseInt(iAttrs.mapMargin, 10)

      scope.viewport = new Viewport(width: 0, height: 0);
      scope.map = new Map(viewport: scope.viewport, margin: mapMargin);
      scope.mapInitialized = true

    post: (scope, iElement, iAttrs, controller) ->
      scope.onResizeFunction = ->
        # Firefox needs te computedStyle madness
        scope.viewport.width = iElement[0].offsetWidth or parseInt(window.getComputedStyle(iElement[0]).width, 10)
        scope.viewport.height = iElement[0].offsetHeight or parseInt(window.getComputedStyle(iElement[0]).height, 10)

      # Call to the function when the page is first loaded
      scope.onResizeFunction()
      angular.element($window).bind "resize", ->
        scope.onResizeFunction()
        scope.$apply()
])
