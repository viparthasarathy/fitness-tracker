function LogService($http) {
  this.getLog = function() {
    return $http.get('/log');
  }
}

angular
  .module('app')
    .service('logService', LogService);
