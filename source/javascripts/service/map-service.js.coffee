transporterApp = angular.module 'transporter'

transporterApp.service 'MapService', ->
  class Map
    @BASE_SIZE = 0.01

    constructor: ({@level, @viewport, @margin}) ->

    dimensions: =>
      infinity = 1/0
      dimensions =
        max:
          x: -infinity
          y: -infinity
        min:
          x: infinity
          y: infinity

      for city in @level.cities
        if city.x > dimensions.max.x then dimensions.max.x = city.x
        if city.y > dimensions.max.y then dimensions.max.y = city.y
        if city.x < dimensions.min.x then dimensions.min.x = city.x
        if city.y < dimensions.min.y then dimensions.min.y = city.y

      dimensions

    width: =>
      dimensions = @dimensions()
      dimensions.max.x - dimensions.min.x

    height: =>
      dimensions = @dimensions()
      dimensions.max.y - dimensions.min.y

    screenCoords: ({x, y}) =>
      dimensions = @dimensions()

      xRelativePosition = (x - dimensions.min.x) / @width()
      yRelativePosition = (y - dimensions.min.y) / @height()

      x: @margin + xRelativePosition * (@viewport.width - 2 * @margin)
      y: @margin + yRelativePosition * (@viewport.height - 2 * @margin)

    baseSize: =>
      Map.BASE_SIZE * @viewport.width
