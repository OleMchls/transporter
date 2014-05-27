transporterApp = angular.module 'transporter'

transporterApp.service 'LevelService', ['LevelLoaderService', 'RouteService', (LevelLoader, Route) ->
  class Level
    constructor: ({@map}) ->
      @cities = []
      @routes = []

    load: ({name}) =>
      LevelLoader.loadLevel(name: name).then((data) =>
        @addCity(city) for city in data.cities
      , -> alert("Could not load map #{name}"))
      @

    addCity: (city) =>
      city.level = @
      @cities.push(city)

    addRoute: ({startCity, targetCity}) ->
      @routes.push new Route(startCity: startCity, targetCity: targetCity)
]
