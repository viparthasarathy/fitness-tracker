function LogController(logJSON) {
  var LogCtrl = this;
  LogCtrl.log = logJSON.data;
  LogCtrl.chapters = LogCtrl.log.chapters;

  LogCtrl.noCurrentChapter = function() {
    LogCtrl.chapters[LogCtrl.length -1].completed_at !== null
  }
  debugger;
}

angular
  .module('fitnessTracker')
    .controller('LogController', LogController);
