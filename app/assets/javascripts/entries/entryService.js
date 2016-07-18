function entryService($http) {
  this.getEntry = function(id) {
    return $http.get('/entries/' + id);
  }
}

angular
  .module('fitnessTracker')
    .service('entryService', entryService);
