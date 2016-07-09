function chapterService($http) {
  this.createChapter = function(chapterParams) {
    return $http.post("/chapters", chapterParams)
  }
}

angular
  .module('fitnessTracker')
    .service('chapterService', chapterService);
