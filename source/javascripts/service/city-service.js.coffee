transporterApp = angular.module 'transporter'

transporterApp.service 'CityService', ->
  class City
    constructor: ({@level, @x, @y, @goods}) ->
      @goods ||= []
