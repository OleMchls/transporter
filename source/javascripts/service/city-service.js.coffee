transporterApp = angular.module 'transporter'

transporterApp.service 'CityService', ['GoodService', (Good) ->
  class City
    constructor: ({@level, @x, @y, @goods}) ->
      @goods ||= []

    @fromJson: (json) ->
      goods = new Good(good.name) for good in json.goods
      new City(x: json.x, y: json.y, goods: goods)

    distanceTo: (city) ->
      Math.sqrt(Math.pow((city.x - @x), 2) + Math.pow((city.y - @y), 2))

    hasPlayerTruck: (player) ->
      hasTruck = false
      for truck in player.trucks
        do (truck) =>
          hasTruck = true if truck.currentCity is @
      hasTruck
]
