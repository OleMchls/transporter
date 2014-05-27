transporterApp = angular.module 'transporter'

transporterApp.controller 'IndexController', ['$scope', 'LevelService', 'CityService', 'GoodService', 'PlayerService', 'TruckService', ($scope, Level, City, Good, Player, Truck) ->

  $scope.$watch('mapInitialized', (newValue, oldValue) ->
    level = new Level(map: $scope.map).load(name: 'test-map')
    level.players.push player = new Player()
    $scope.level = level
    $scope.currentPlayer = player
  )

  $scope.selectedCity = null

  $scope.unassignedTrucks = 1

  $scope.select = (city) ->
    if ($scope.unassignedTrucks > 0)
      $scope.unassignedTrucks--
      $scope.currentPlayer.trucks.push new Truck({player: $scope.currentPlayer, currentCity: city})
      return
    if ($scope.selectedCity)
      if $scope.selectedCity == city then return $scope.selectedCity = null
      $scope.level.addRoute startCity: $scope.selectedCity, targetCity: city, player: $scope.currentPlayer
    else
      $scope.selectedCity = city

]
