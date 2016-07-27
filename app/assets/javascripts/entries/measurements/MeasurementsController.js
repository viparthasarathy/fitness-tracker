function MeasurementsController(EntryJSON, MeasurementService) {
  var MeasurementsCtrl = this;
  MeasurementsCtrl.entry = EntryJSON.data;
  MeasurementsCtrl.measurement = MeasurementsCtrl.entry.measurement;
}

angular
  .module('fitnessTracker')
    .controller('MeasurementsController', MeasurementsController);
