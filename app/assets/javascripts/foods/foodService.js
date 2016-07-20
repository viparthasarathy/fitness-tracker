function foodService($http) {
  this.createFood = function(food) {
    return $http.post('/foods', food);
  }
}

angular
  .module('fitnessTracker')
    .service('foodService', foodService);
