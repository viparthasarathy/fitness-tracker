function LogController(logJSON) {
  var LogCtrl = this;
  LogCtrl.log = logJSON.data;
  LogCtrl.chapters = LogCtrl.log.chapters;

  LogCtrl.noCurrentChapter = function() {
    return LogCtrl.chapters[0].completed_at !== null
  }
}

angular
  .module('fitnessTracker')
    .controller('LogController', LogController);
