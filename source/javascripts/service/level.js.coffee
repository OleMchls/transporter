transporterApp = angular.module 'transporter'

transporterApp.service 'LevelService', ['CityService', 'RouteService', (City, Route)->

  class Level
    constructor: (@cities, @routes = []) ->

    addRoute: (startCity, targetCity) ->
      @routes.push new Route(startCity, targetCity)

  cities = [
    new City(100, 100)
    new City(400, 100)
  ]

  new Level cities, []

]
