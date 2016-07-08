function LogController(logJSON) {
  var logCtrl = this;
  logCtrl.log = logJSON;
}

angular
  .module('fitnessTracker')
    .controller('LogController', LogController);
