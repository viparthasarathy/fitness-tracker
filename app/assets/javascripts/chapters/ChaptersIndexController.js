function ChaptersIndexController(chaptersJSON) {
  var ChaptersIndexCtrl = this;
  ChaptersIndexCtrl.chapters = chaptersJSON.data;
}

angular
  .module('fitnessTracker')
    .controller('ChaptersIndexController', ChaptersIndexController);
