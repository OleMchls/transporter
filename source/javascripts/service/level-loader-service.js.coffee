transporterApp = angular.module 'transporter'

transporterApp.service 'LevelLoaderService', ['$http', '$q', 'CityService', ($http, $q, City) ->
  loadLevel: ({name}) ->
    deferred = $q.defer();

    $http({method: 'GET', url: "/data/levels/#{name}.json"})
      .success (data, status, headers, config) ->
        cities = (City.fromJson(city) for city in data.cities)

        deferred.resolve(cities: cities, map: data.map)

      .error ->
        deferred.reject()

    deferred.promise
]
