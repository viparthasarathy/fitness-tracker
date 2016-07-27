function MeasurementService($http) {
  this.createMeasurement = function(measurement) {
    return $http.post('/measurements', measurement);
  }

  this.updateMeasurement = function(measurement) {
    return $http.put('/measurements/' + measurement.id, measurement);
  }
}

angular
  .module('fitnessTracker')
    .service('MeasurementService', MeasurementService);
