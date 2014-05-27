transporterApp = angular.module 'transporter'

transporterApp.controller 'IndexController', ['$scope', 'LevelService', 'CityService', 'GoodService', ($scope, Level, City, Good) ->
  $scope.$watch('mapInitialized', (newValue, oldValue) ->
    level = new Level(map: $scope.map).load(name: 'test-map')
    $scope.level = level
  )

  selectedCity = null

  $scope.select = (city) ->
    if (selectedCity)
      $scope.level.addRoute selectedCity, city
    else
      selectedCity = city

]
