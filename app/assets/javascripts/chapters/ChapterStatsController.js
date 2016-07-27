function ChapterStatsController(chapterJSON) {
  var ChapterStatsCtrl = this;
  ChapterStatsCtrl.chapter = chapterJSON.data;
  console.log(ChapterStatsCtrl.chapter);

  ChapterStatsCtrl.calculateAverage = function(total) {
    if (ChapterStatsCtrl.chapter.entries.length > 0) {
      return Math.round(total / ChapterStatsCtrl.chapter.entries.length)
    } else {
      return 0;
    }
  }
  ChapterStatsCtrl.firstEntryID = ChapterStatsCtrl.chapter.entries[ChapterStatsCtrl.chapter.entries.length - 1].id;
  ChapterStatsCtrl.firstMeasurement = ChapterStatsCtrl.chapter.measurements[ChapterStatsCtrl.chapter.measurements.length - 1];

}

angular
  .module('fitnessTracker')
    .controller('ChapterStatsController', ChapterStatsController);
