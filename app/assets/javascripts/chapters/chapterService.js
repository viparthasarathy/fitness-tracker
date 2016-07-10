function chapterService($http) {
  this.createChapter = function(chapter) {
    return $http.post("/chapters", chapter)
  }
}

angular
  .module('fitnessTracker')
    .service('chapterService', chapterService);
