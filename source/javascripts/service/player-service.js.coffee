transporterApp = angular.module 'transporter'

transporterApp.service 'PlayerService', ->
  class Player
    constructor: () ->
      @trucks = []

    getFreeTrucks: () ->
      @trucks.filter (truck) -> truck.busy == false
