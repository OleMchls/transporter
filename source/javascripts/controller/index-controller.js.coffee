transporterApp = angular.module 'transporter'

transporterApp.controller 'IndexController', ['$scope', 'LevelService', 'CityService', 'GoodService', ($scope, Level, City, Good) ->
  $scope.$watch('map', (newValue, oldValue) ->
    level = new Level(map: $scope.map)

    cities = [
      new City(level: level, x: 0, y: 0)
      new City(level: level, x: -0.8, y: 0.5)
    ]

    for city in cities
      do (city) ->
        city.goods.push new Good('Iron', Math.random(), Math.random())
        city.goods.push new Good('Oil', Math.random(), Math.random())
        city.goods.push new Good('poly hydridocarbyne', Math.random(), Math.random())
        level.addCity city

    $scope.level = level
  )

  selectedCity = null

  $scope.select = (city) ->
    if (selectedCity)
      $scope.level.addRoute selectedCity, city
    else
      selectedCity = city

]
