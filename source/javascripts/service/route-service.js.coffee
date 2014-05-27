transporterApp = angular.module 'transporter'

transporterApp.service 'RouteService', ->
  class Route
    constructor: ({@start, @target}) ->
