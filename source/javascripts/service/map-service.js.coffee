transporterApp = angular.module 'transporter'

transporterApp.service 'MapService', ->
  class Map
    constructor: ({@viewport}) ->

    screenCoords: ({x, y}) =>
      x: ((x + 1) / 2) * @viewport.width
      y: ((y + 1) / 2) * @viewport.height
