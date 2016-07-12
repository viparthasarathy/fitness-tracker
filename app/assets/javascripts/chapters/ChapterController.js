function ChapterController(chapterJSON, $state) {
  var ChapterCtrl = this;
  ChapterCtrl.chapter = chapterJSON.data;
  ChapterCtrl.chapter.created_at = new Date(ChapterCtrl.chapter.created_at)
  if (ChapterCtrl.chapter.completed_at !== null) { ChapterCtrl.chapter.completed_at = new Date(ChapterCtrl.chapter.completed_at) }

  console.log(ChapterCtrl.chapter)

}

angular
  .module('fitnessTracker')
    .controller('ChapterController', ChapterController)
