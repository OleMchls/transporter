transporterApp = angular.module 'transporter'

transporterApp.service 'GoodService', ->
  class Good
    constructor: (@name) ->
