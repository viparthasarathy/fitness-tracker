function ChapterController(chapterJSON, $state, chapterService) {
  var ChapterCtrl = this;
  ChapterCtrl.chapter = chapterJSON.data;
  ChapterCtrl.markComplete = function() {
    chapterService.updateChapter(ChapterCtrl.chapter.id).then(function(response) {
      $state.go('log');
    }, function(error) {
      console.log(error);
    });
  }
  ChapterCtrl.chapter.created_at = new Date(ChapterCtrl.chapter.created_at);
  if (ChapterCtrl.chapter.completed_at !== null) {
    ChapterCtrl.chapter.completed_at = new Date(ChapterCtrl.chapter.completed_at);
  }
}

angular
  .module('fitnessTracker')
    .controller('ChapterController', ChapterController);
