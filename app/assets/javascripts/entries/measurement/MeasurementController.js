function MeasurementController(EntryJSON, MeasurementService, $state) {
  var MeasurementCtrl = this;
  MeasurementCtrl.entry = EntryJSON.data;
  MeasurementCtrl.measurement = MeasurementCtrl.entry.measurement;

  MeasurementCtrl.saveMeasurement = function() {
    MeasurementCtrl.measurement.entry_id = MeasurementCtrl.entry.id;
    if (MeasurementCtrl.measurement.id === null) {
      console.log(MeasurementCtrl.measurement);
      MeasurementService.createMeasurement(MeasurementCtrl.measurement)
        .then(function(response) {
          console.log(response);
      });
    } else {
      console.log(MeasurementCtrl.measurement);
      MeasurementService.updateMeasurement(MeasurementCtrl.measurement)
        .then(function(response) {
          console.log(response);
        });
    }
  }
}

angular
  .module('fitnessTracker')
    .controller('MeasurementController', MeasurementController);
