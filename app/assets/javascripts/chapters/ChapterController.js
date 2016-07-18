function ChapterController(chapterJSON, $state, chapterService, entryService) {
  var ChapterCtrl = this;
  ChapterCtrl.chapter = chapterJSON.data;
  ChapterCtrl.chapter.created_at = new Date(ChapterCtrl.chapter.created_at);
  if (ChapterCtrl.chapter.completed_at !== null) {
    ChapterCtrl.chapter.completed_at = new Date(ChapterCtrl.chapter.completed_at);
  }

  ChapterCtrl.markComplete = function() {
    chapterService.updateChapter(ChapterCtrl.chapter.id).then(function(response) {
      $state.go('log');
    }, function(error) {
      console.log(error);
    });
  }

  ChapterCtrl.createEntry = function() {
    entryService.createEntry({
      chapter_id: ChapterCtrl.chapter.id,
      notes: ChapterCtrl.newEntry.notes,
      day: ChapterCtrl.newEntry.day
    });
  }

}

angular
  .module('fitnessTracker')
    .controller('ChapterController', ChapterController);
