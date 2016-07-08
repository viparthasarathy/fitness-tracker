function LogService($http) {
  this.getLog = function() {
    return $http.get('/log');
  }
}

angular
  .module('fitnessTracker')
    .service('logService', LogService);
