transporterApp = angular.module 'transporter'

screenCoordinate = (entity, offset) ->
  map = entity.level.map
  offset = if offset then map.baseSize() * offset else 0

  coords = map.screenCoords(x: entity.x, y: entity.y)
  coords.x += offset
  coords.y += offset
  coords

transporterApp.filter("screenCoordinateX", ->
  (entity, offset) ->
    screenCoordinate(entity, offset).x || -1000
).filter("screenCoordinateY", ->
  (entity, offset) ->
    screenCoordinate(entity, offset).y || -1000
)
