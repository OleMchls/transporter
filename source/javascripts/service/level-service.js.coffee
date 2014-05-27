transporterApp = angular.module 'transporter'

transporterApp.service 'LevelService', ['CityService', 'RouteService', 'GoodService', (City, Route, Good)->

  class Level
    constructor: (@cities, @routes = []) ->

    addRoute: (startCity, targetCity) ->
      @routes.push new Route(startCity, targetCity)

  cities = [
    new City(100, 100)
    new City(400, 100)
  ]

  for city in cities
    do (city) ->
      city.goods.push new Good('Iron', Math.random(), Math.random())
      city.goods.push new Good('Oil', Math.random(), Math.random())
      city.goods.push new Good('poly hydridocarbyne', Math.random(), Math.random())

  new Level cities, []

]
