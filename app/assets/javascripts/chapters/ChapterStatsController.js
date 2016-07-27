function ChapterStatsController(chapterJSON) {
  var ChapterStatsCtrl = this;
  ChapterStatsCtrl.chapter = chapterJSON.data;

  ChapterStatsCtrl.calculateAverage = function(total) {
    if (ChapterStatsCtrl.chapter.entries.length > 0) {
      return Math.round(total / ChapterStatsCtrl.chapter.entries.length)
    } else {
      return 0;
    }
  }

  function calculateWeeklyAverages(measurements) {
    var weightVals = measurements.map(function(measurement) { return measurement.weight});
    var bodyfatVals = measurements.map(function(measurement) { return measurement.bodyfat; });
    var heightVals = measurements.map(function(measurement) { return measurement.height; });
    var waistVals = measurements.map(function(measurement) { return measurement.waist; });
    var chestVals = measurements.map(function(measurement) { return measurement.chest; });

    return {
      weight: findMean(weightVals),
      bodyfat: findMean(bodyfatVals),
      height: findMean(heightVals),
      waist: findMean(waistVals),
      chest: findMean(chestVals)
    };
  }

  function findMean(values) {
    var sum = 0;
    var count = 0;
    for (i = 0; i < values.length; i++) {
      if (values[i] !== null && values[i] !== undefined) {
        sum += values[i];
        count ++;
      }
    }
    if (count > 0) {
      return sum/count;
    } else {
      return undefined;
    }
  }

  ChapterStatsCtrl.firstEntryID = ChapterStatsCtrl.chapter.entries[ChapterStatsCtrl.chapter.entries.length - 1].id;
  ChapterStatsCtrl.firstMeasurement = ChapterStatsCtrl.chapter.measurements[ChapterStatsCtrl.chapter.measurements.length - 1];

  ChapterStatsCtrl.thisWeekMeasurements = calculateWeeklyAverages(ChapterStatsCtrl.chapter.measurements.slice(0, 7));
  ChapterStatsCtrl.lastWeekMeasurements = calculateWeeklyAverages(ChapterStatsCtrl.chapter.measurements.slice(7, 14));

  console.log(ChapterStatsCtrl.thisWeekMeasurements);
  console.log(ChapterStatsCtrl.lastWeekMeasurements);
}

angular
  .module('fitnessTracker')
    .controller('ChapterStatsController', ChapterStatsController);
