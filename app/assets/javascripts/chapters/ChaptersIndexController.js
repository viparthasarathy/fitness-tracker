function ChaptersIndexController(chaptersJSON) {
  var ChaptersCtrl = this;
  ChaptersCtrl.chapters = chaptersJSON.data;
  console.log(ChaptersCtrl.chapters);
}

angular
  .module('fitnessTracker')
    .controller('ChaptersIndexController', ChaptersIndexController);
