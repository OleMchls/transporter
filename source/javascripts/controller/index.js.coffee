transporterApp = angular.module 'transporter'

transporterApp.controller 'IndexController', ['$scope', 'LevelService', ($scope, level) ->

  $scope.level = level

  selectedCity = null

  $scope.select = (city) ->
    if (selectedCity)
      $scope.level.addRoute selectedCity, city
    else
      selectedCity = city

]
