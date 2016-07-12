function chapterService($http) {
  this.createChapter = function(chapter) {
    return $http.post("/chapters", chapter);
  }
  this.getChapter = function(id) {
    return $http.get("/chapters/" + id);
  }
  this.updateChapter = function(id) {
    return $http.put("/chapters/" + id);
  }
}

angular
  .module('fitnessTracker')
    .service('chapterService', chapterService);
