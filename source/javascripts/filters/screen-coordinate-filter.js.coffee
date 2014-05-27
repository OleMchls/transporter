transporterApp = angular.module 'transporter'

# conditional based on optional argument
transporterApp.filter("screenCoordinateX", ->
  (entity) ->
    entity.level.map.screenCoords(x: entity.x, y: entity.y).x
).filter("screenCoordinateY", ->
  (entity) ->
    entity.level.map.screenCoords(x: entity.x, y: entity.y).y
)
