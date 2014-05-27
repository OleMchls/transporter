transporterApp = angular.module 'transporter'

transporterApp.service 'LevelService', ['CityService', 'RouteService', 'GoodService', (City, Route, Good)->

  class Level
    constructor: ({@map}) ->
      @cities = []
      @routes = []

    addCity: (city) =>
      @cities.push(city)

    addRoute: ({startCity, targetCity}) ->
      @routes.push new Route(startCity: startCity, targetCity: targetCity)
]
