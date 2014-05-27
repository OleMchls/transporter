transporterApp = angular.module 'transporter'

# conditional based on optional argument
transporterApp.filter "screenSize", ->
  (entity, size) ->
    entity.level.map.baseSize() * size
