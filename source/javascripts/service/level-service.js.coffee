transporterApp = angular.module 'transporter'

transporterApp.service 'LevelService', ['LevelLoaderService', 'RouteService', (LevelLoader, Route) ->
  class Level
    constructor: ({@map}) ->
      @players = []
      @map.level = @
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

    addRoute: ({startCity, targetCity, player}) ->
      route = new Route(start: startCity, target: targetCity)
      if truck = player.getFreeTrucks()[0]
        index = (@routes.push(route) - 1)
        truck.startRoute route, => @routes[index] = null

]
