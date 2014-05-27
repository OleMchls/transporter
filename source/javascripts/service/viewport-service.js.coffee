transporterApp = angular.module 'transporter'

transporterApp.service 'ViewportService', ->
  class Viewport
    constructor: ({@width, @height}) ->
