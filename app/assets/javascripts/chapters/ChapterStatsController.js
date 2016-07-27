function ChapterStatsController(chapterJSON) {
  var ChapterStatsCtrl = this;
  var ChapterStatsCtrl.chapter = ChapterJSON.data;

  ChapterStatsCtrl.calculateAverage = function(total) {

    if (ChapterStatsCtrl.chapter.entries.length > 0) {
      return Math.round(total / ChapterStatsCtrl.chapter.entries.length)
    } else {
      return 0;
    }
  }
}

angular
  .module('fitnessTracker')
    .controller('ChapterStatsController', ChapterStatsController);
