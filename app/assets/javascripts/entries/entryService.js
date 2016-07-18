function entryService($http) {
  this.getEntry = function(id) {
    return $http.get('/entries/' + id);
  }

  this.createEntry = function(entry) {
    return $http.post('/entries/', entry);
  }
}

angular
  .module('fitnessTracker')
    .service('entryService', entryService);
