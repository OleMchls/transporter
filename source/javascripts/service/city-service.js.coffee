transporterApp = angular.module 'transporter'

transporterApp.service 'CityService', ['GoodService', (Good) ->
  class City
    constructor: ({@level, @x, @y, @goods}) ->
      @goods ||= []

    @fromJson: (json) ->
      goods = new Good(good.name) for good in json.goods
      new City(x: json.x, y: json.y, goods: goods)
]
