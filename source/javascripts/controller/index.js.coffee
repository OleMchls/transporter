transporterApp = angular.module 'transporter'

transporterApp.controller 'IndexController', ['$scope', 'CityService', ($scope, CityService) ->
  $scope.cities = [
    new CityService(100, 100)
    new CityService(400, 100)
  ]
]
