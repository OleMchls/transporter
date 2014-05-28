transporterApp = angular.module 'transporter'

transporterApp.service 'TruckService', ->
  class Truck
    BASE_SPEED = 10
    startTime = undefined
    constructor: ({@player, @currentCity}) ->
      @busy = false
      @currentPos = {x: @currentCity.x, y: @currentCity.y}
      @level = @currentCity.level

    x: =>
      return unless @busy
      xDelta = @targetCity.x - @startCity.x
      Math.floor((@startCity.x + xDelta * @routeProgress()) * 10000) / 10000


    y: =>
      return unless @busy
      yDelta = @targetCity.y - @startCity.y
      Math.floor((@startCity.y + yDelta * @routeProgress()) * 10000) / 10000

    distPerMs: -> BASE_SPEED / 100000

    startRoute: (route, onSuccess) =>
      [startCity, targetCity] = [route.start, route.target]
      if @currentCity == startCity && @currentCity != targetCity
        @busy = true
        @startCity = startCity
        @targetCity = targetCity
        @currentCity = undefined
        @startTime = new Date()
        distance = startCity.distanceTo targetCity
        @timeToTarget = distance / @distPerMs()
        setTimeout @finishRoute, @timeToTarget, route, onSuccess

    finishRoute: (route, onSuccess) =>
      [startCity, targetCity] = [route.start, route.target]
      @busy = false
      @currentPos = {x: targetCity.x, y: targetCity.y}
      @currentCity = targetCity
      onSuccess()

    routeProgress: =>
      timePassed = new Date() - @startTime
      timePassed / @timeToTarget
