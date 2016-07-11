function NewChapterController(chapterService, $state) {
  var NewChapterCtrl = this;
  NewChapterCtrl.create = function() {
    chapterService.createChapter({
      goal: NewChapterCtrl.goal,
      title: NewChapterCtrl.title,
      description: NewChapterCtrl.description
    }).then(function(response) {
      $state.go('chapters.show', {id: response.data.id});
    }, function(error) {
      $state.go('log')
    });
  }
}

angular
  .module('fitnessTracker')
    .controller('NewChapterController', NewChapterController)
