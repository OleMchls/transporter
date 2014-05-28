transporterApp = angular.module 'transporter'

transporterApp.service 'MapService', ->
  class Map
    @BASE_SIZE = 0.01

    constructor: ({@level, @viewport, @margin}) ->
      @aspectRatio = 1

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

    updateLevelData: (data) =>
      @aspectRatio = data.aspectRatio

    width: =>
      dimensions = @dimensions()
      dimensions.max.x - dimensions.min.x

    height: =>
      dimensions = @dimensions()
      dimensions.max.y - dimensions.min.y

    screenWidth: =>
      width = @viewport.width - 2 * @margin
      height = @viewport.height - 2 * @margin

      if height < @designatedHeight() then height * @aspectRatio else width

    screenHeight: =>
      height = @viewport.height - 2 * @margin
      designatedHeight = @designatedHeight()

      if height < designatedHeight then height else designatedHeight

    designatedHeight: =>
      width = @viewport.width - 2 * @margin
      parseInt(width / @aspectRatio, 10)

    screenCoords: ({x, y}) =>
      dimensions = @dimensions()

      if typeof x is 'function' then x = x()
      if typeof y is 'function' then y = y()

      xRelativePosition = (x - dimensions.min.x) / @width()
      yRelativePosition = (y - dimensions.min.y) / @height()

      screenWidth = @screenWidth()
      screenHeight = @screenHeight()

      xOffset = (@viewport.width - screenWidth - 2 * @margin) / 2.0
      yOffset = (@viewport.height - screenHeight - 2 * @margin) / 2.0

      x: @margin + xOffset + xRelativePosition * screenWidth
      y: @margin + yOffset + yRelativePosition * screenHeight

    baseSize: =>
      Map.BASE_SIZE * (@screenWidth() + @screenHeight()) / 2.0
