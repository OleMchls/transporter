transporterApp = angular.module 'transporter'

transporterApp.controller 'IndexController', ['$scope', 'CityService', 'RouteService', ($scope, City, Route) ->

  $scope.cities = [
    new City(100, 100)
    new City(400, 300)
  ]

  $scope.routes = []

  selectedCity = null

  $scope.select = (city) ->
    if (selectedCity)
      $scope.routes.push new Route(selectedCity, city)
    else
      selectedCity = city

]
