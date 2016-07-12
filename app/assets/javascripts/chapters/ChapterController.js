function ChapterController(chapterJSON, $state) {
  var ChapterCtrl = this;
  ChapterCtrl.chapter = chapterJSON.data;
  
}

angular
  .module('fitnessTracker')
    .controller('ChapterController', ChapterController)
