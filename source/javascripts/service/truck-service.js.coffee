transporterApp = angular.module 'transporter'

transporterApp.service 'TruckService', ->
  class Truck
    BASE_SPEED = 10
    startTime = undefined
    constructor: ({@player, @currentCity}) ->
      @busy = false
      @currentPos = {x: @currentCity.x, y: @currentCity.y}

    x: ->
    y: ->

    distPerMs: -> BASE_SPEED / 100000

    startRoute: ({startCity, targetCity}) ->
      if @currentCity == startCity && @currentCity != targetCity
        @busy = true
        @currentCity = undefined
        startTime = new Date()
        distance = startCity.distanceTo targetCity
        timeToTarget = distance / @distPerMs()
        console.log 'start', timeToTarget
        setTimeout @finishRoute, timeToTarget, {startCity: startCity, targetCity: targetCity}

    finishRoute: ({startCity, targetCity}) ->
      @busy = false
      @currentPos = {x: targetCity.x, y: targetCity.y}
      console.log 'done'
