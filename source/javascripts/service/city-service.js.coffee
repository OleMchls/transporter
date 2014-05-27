transporterApp = angular.module 'transporter'

transporterApp.service 'CityService', ->
  class City
    constructor: (@x, @y, @goods = []) ->
