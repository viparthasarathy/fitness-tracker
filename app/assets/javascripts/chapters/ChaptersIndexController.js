function ChaptersIndexController(chaptersJSON) {
  var ChaptersIndexCtrl = this;
  ChaptersIndexCtrl.chapters = chaptersJSON.data;
  console.log(ChaptersIndexCtrl.chapters);
}

angular
  .module('fitnessTracker')
    .controller('ChaptersIndexController', ChaptersIndexController);
