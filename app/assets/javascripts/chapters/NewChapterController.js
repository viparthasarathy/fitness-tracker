function NewChapterController(chapterService) {
  var NewChapterCtrl = this;
  NewChapterCtrl.create = function() {
    chapterService.createChapter({
      goal: NewChapterCtrl.goal,
      title: NewChapterCtrl.title,
      description: NewChapterCtrl.description
    }).then(function(response) {
      console.log(response);
    }, function(error) {
      console.log(error);
    });
  }
}

angular
  .module('fitnessTracker')
    .controller('NewChapterController', NewChapterController)
