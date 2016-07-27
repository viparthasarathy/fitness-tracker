function MeasurementController(EntryJSON, MeasurementService, $state) {
  var MeasurementCtrl = this;
  MeasurementCtrl.entry = EntryJSON.data;
  MeasurementCtrl.measurement = MeasurementCtrl.entry.measurement;
  MeasurementCtrl.message = "Create or update an existing measurement."

  MeasurementCtrl.saveMeasurement = function() {
    MeasurementCtrl.measurement.entry_id = MeasurementCtrl.entry.id;
    if (MeasurementCtrl.measurement.id === undefined) {
      MeasurementService.createMeasurement(MeasurementCtrl.measurement)
        .then(function(response) {
          MeasurementCtrl.message = "Measurement created."
          MeasurementCtrl.measurement.id = response.data.id;
      });
    } else {
      MeasurementService.updateMeasurement(MeasurementCtrl.measurement)
        .then(function(response) {
          MeasurementCtrl.message = "Measurement updated."
        });
    }
  }
}

angular
  .module('fitnessTracker')
    .controller('MeasurementController', MeasurementController);
