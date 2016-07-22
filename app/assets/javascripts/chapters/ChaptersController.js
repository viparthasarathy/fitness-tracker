function ChaptersController(chaptersJSON) {
  var ChaptersIndexCtrl = this;
  ChaptersIndexCtrl.chapters = chaptersJSON.data;
}

angular
  .module('fitnessTracker')
    .controller('ChaptersController', ChaptersController);
