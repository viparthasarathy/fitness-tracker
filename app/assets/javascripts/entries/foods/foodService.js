function foodService($http) {
  this.createFood = function(food) {
    return $http.post('/foods', food);
  }

  this.deleteFood = function(id) {
    return $http.delete('/foods/' + id)
  }

  this.updateFood = function(food) {
    return $http.put('/foods/' + food.id, food);
  }
}

angular
  .module('fitnessTracker')
    .service('foodService', foodService);
