transporterApp = angular.module 'transporter'

# Thank you Igor! http://jsfiddle.net/IgorMinar/TSAag/
transporterApp.service 'AnimatorService', ['$window', '$rootScope', ($window, $rootScope) ->
  requestAnimationFrame = $window.requestAnimationFrame or $window.mozRequestAnimationFrame or $window.msRequestAnimationFrame or $window.webkitRequestAnimationFrame
  (tick) -> requestAnimationFrame -> $rootScope.$apply tick
]
