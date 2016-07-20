function foodService($http) {
  this.createFood = function(food) {
    return $http.post('/foods', food);
  }

  this.deleteFood = function(id) {
    return $http.delete('/foods/' + id)
  }
}

angular
  .module('fitnessTracker')
    .service('foodService', foodService);
