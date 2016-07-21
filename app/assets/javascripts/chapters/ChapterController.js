function ChapterController(chapterJSON, $state, chapterService, entryService) {
  var ChapterCtrl = this;
  ChapterCtrl.chapter = chapterJSON.data;
  console.log(ChapterCtrl.chapter);

  ChapterCtrl.chapter.created_at = new Date(ChapterCtrl.chapter.created_at);
  if (ChapterCtrl.chapter.completed_at !== null) {
    ChapterCtrl.chapter.completed_at = new Date(ChapterCtrl.chapter.completed_at);
  }

  ChapterCtrl.calculateAverage = function(total) {

    if (ChapterCtrl.chapter.entries.length > 0) {
      return Math.round(total / ChapterCtrl.chapter.entries.length)
    } else {
      return 0;
    }
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
    }).then(function(response) {
      ChapterCtrl.chapter.entries.unshift(response.data)
    }, function(error) {
      ChapterCtrl.newEntryForm.day.$error.server = true;
      ChapterCtrl.serverChapterError = "Day " + error.data.day[0] + ".";
    });
  }

  ChapterCtrl.setServerErrorFalse = function() {
    ChapterCtrl.newEntryForm.day.$error.server = false;
  }

}

angular
  .module('fitnessTracker')
    .controller('ChapterController', ChapterController);
