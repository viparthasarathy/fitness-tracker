function ChapterStatsController(chapterJSON) {
  var ChapterStatsCtrl = this;
  ChapterStatsCtrl.chapter = chapterJSON.data;
  console.log(ChapterStatsCtrl.chapter.measurements);

  ChapterStatsCtrl.calculateAverage = function(total) {
    if (ChapterStatsCtrl.chapter.entries.length > 0) {
      return Math.round(total / ChapterStatsCtrl.chapter.entries.length)
    } else {
      return 0;
    }
  }

  ChapterStatsCtrl.firstMeasurement = ChapterStatsCtrl.chapter.measurements[ChapterStatsCtrl.chapter.measurements.length - 1];
  console.log(ChapterStatsCtrl.firstMeasurement);
}

angular
  .module('fitnessTracker')
    .controller('ChapterStatsController', ChapterStatsController);
