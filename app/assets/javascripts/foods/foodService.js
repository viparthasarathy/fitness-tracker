function foodService($http) {
  this.createFood = function(food) {
    $http.post('/foods', food);
  }
}

angular
  .application('fitnessTracker')
    .service('foodService', foodService);
