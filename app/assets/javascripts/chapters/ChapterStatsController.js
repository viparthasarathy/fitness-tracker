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

  function calculateChange(firstMeasurements, secondMeasurements) {
    if (secondMeasurements) {
      return {
        weight:  (firstMeasurements.weight - secondMeasurements.weight || undefined),
        bodyfat: (firstMeasurements.bodyfat - secondMeasurements.bodyfat || undefined),
        height:  (firstMeasurements.height - secondMeasurements.height || undefined),
        waist: (firstMeasurements.waist - secondMeasurements.waist || undefined),
        chest:  (firstMeasurements.chest - secondMeasurements.chest || undefined)
      };
    }
    else {
      return {};
    }
  }

  ChapterStatsCtrl.firstEntryID = ChapterStatsCtrl.chapter.entries[ChapterStatsCtrl.chapter.entries.length - 1].id;
  ChapterStatsCtrl.firstMeasurement = ChapterStatsCtrl.chapter.measurements[ChapterStatsCtrl.chapter.measurements.length - 1];

  ChapterStatsCtrl.thisWeekMeasurements = calculateWeeklyAverages(ChapterStatsCtrl.chapter.measurements.slice(0, 7));
  ChapterStatsCtrl.lastWeekMeasurements = calculateWeeklyAverages(ChapterStatsCtrl.chapter.measurements.slice(7, 14));

  console.log(ChapterStatsCtrl.lastWeekMeasurements);
  ChapterStatsCtrl.measurementChange = calculateChange(ChapterStatsCtrl.thisWeekMeasurements, ChapterStatsCtrl.lastWeekMeasurements);

  console.log(ChapterStatsCtrl.measurementChange);
}

angular
  .module('fitnessTracker')
    .controller('ChapterStatsController', ChapterStatsController);
