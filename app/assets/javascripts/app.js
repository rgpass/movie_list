angular.module('movieListApp', [])
.service('movieService', function($http) {
  this.search = function(title) {
    // Can either do it as a query string param
    // return $http.get('/search.json', { params: { title: title }});

    // Or can send it as a header -- which will conceal it (slightly) in the Network panel
    return $http.get('/search.json', { headers: { title: title }});
  };
})
.controller('testController', ["$scope", "movieService", function($scope,movieService) {
  $scope.submit = function() {
    movieService.search($scope.movieTitle).success(function(data) {
      $scope.results = data;
    });
  }

  movieService.search("batman").success(function(data) {
    $scope.results = data;
  });

  $scope.minYear = 2000;
}]);
