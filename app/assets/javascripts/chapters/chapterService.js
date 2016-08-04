function chapterService($http) {
  this.createChapter = function(chapter) {
    return $http.post("/chapters", chapter);
  }
  this.getChapter = function(id) {
    return $http.get("/chapters/" + id);
  }
  this.updateChapter = function(id) {
    return $http.patch("/chapters/" + id);
  }
  this.getChapters = function() {
    return $http.get("/chapters");
  }
  this.getChapterStats = function(id) {
    return $http.get("/chapters/" + id + "/stats");
  }
}

angular
  .module('fitnessTracker')
    .service('chapterService', chapterService);
