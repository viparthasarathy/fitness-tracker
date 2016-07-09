function NewChapterController(ChapterService) {
  var NewChapterCtrl = this;
  NewChapterCtrl.create = function() {
    ChapterService.createChapter({
      goal: NewChapterCtrl.goal,
      title: NewChapterCtrl.title,
      description: NewChapterCtrl.description
    })
  }
}

angular
  .module('fitnessTracker')
    .controller('NewChapterController', NewChapterController)
