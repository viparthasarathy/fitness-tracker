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

  function calculateWeeklyMeasurementAverages(measurements) {
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

  function calculateWeeklyIntakeAverages(foods) {
    var calories = foods.map(function(food) { return food.calories });
    var protein = foods.map(function(food) { return food.protein});
    var carbs = foods.map(function(food) { return food.carbs });
    var fats = foods.map(function(food) { return food.fats });

    return {
      calories: findMean(calories),
      protein: findMean(protein),
      carbs: findMean(carbs),
      fats: findMean(fats)
    }
  }

  function calculateMeasurementChange(firstMeasurements, secondMeasurements) {
    if (secondMeasurements) {
      return {
        weight:  (firstMeasurements.weight - secondMeasurements.weight),
        bodyfat: (firstMeasurements.bodyfat - secondMeasurements.bodyfat),
        height:  (firstMeasurements.height - secondMeasurements.height),
        waist: (firstMeasurements.waist - secondMeasurements.waist),
        chest:  (firstMeasurements.chest - secondMeasurements.chest)
      };
    }
    else {
      return {};
    }
  }

  function filterWeeklyEntries(startOfWeek, entries) {
    var endOfWeek = new Date();
    endOfWeek.setDate(startOfWeek.getDate() + 7);
    var weeksEntries = []
    for (i = 0; i < entries.length; i++) {
      var entryDay = new Date(entries[i].day);
      if (entryDay > startOfWeek && entryDay <= endOfWeek) {
        weeksEntries.push(entries[i]);
      }
    }
    return weeksEntries;
  }

  var startOfThisWeek = new Date();
  startOfThisWeek.setDate(startOfThisWeek.getDate() - 7)
  var startOfLastWeek = new Date();
  startOfLastWeek.setDate(startOfLastWeek.getDate() - 14)

  var thisWeeksEntries = filterWeeklyEntries(startOfThisWeek, ChapterStatsCtrl.chapter.entries.slice(0, 7));
  var lastWeeksEntries = filterWeeklyEntries(startOfLastWeek, ChapterStatsCtrl.chapter.entries.slice(0, 14));

  ChapterStatsCtrl.firstEntryID = ChapterStatsCtrl.chapter.entries[ChapterStatsCtrl.chapter.entries.length - 1].id;
  ChapterStatsCtrl.firstMeasurement = ChapterStatsCtrl.chapter.measurements[ChapterStatsCtrl.chapter.measurements.length - 1];

  function notNull(value) {
    return value !== null;
  }

  var thisWeeksMeasurements = thisWeeksEntries.map(function(entry) { return entry.measurement; }).filter(notNull);
  var lastWeeksMeasurements = lastWeeksEntries.map(function(entry) { return entry.measurement; }).filter(notNull);

  var thisWeeksFoods = thisWeeksEntries.map(function(entry) { return entry.foods }).reduce(function(allFoods, foods) { return allFoods.concat(foods) }, []);
  var lastWeeksFoods = lastWeeksEntries.map(function(entry) { return entry.foods }).reduce(function(allFoods, foods) { return allFoods.concat(foods) }, []);

  ChapterStatsCtrl.thisWeeksIntakes = calculateWeeklyIntakeAverages(thisWeeksFoods);
  ChapterStatsCtrl.lastWeeksIntakes = calculateWeeklyIntakeAverages(lastWeeksFoods);


  ChapterStatsCtrl.thisWeekMeasurements = calculateWeeklyMeasurementAverages(thisWeeksMeasurements);
  ChapterStatsCtrl.lastWeekMeasurements = calculateWeeklyMeasurementAverages(lastWeeksMeasurements);

  ChapterStatsCtrl.measurementChange = calculateMeasurementChange(ChapterStatsCtrl.thisWeekMeasurements, ChapterStatsCtrl.lastWeekMeasurements)

  for (var measurement in ChapterStatsCtrl.measurementChange) {
    if (ChapterStatsCtrl.measurementChange.hasOwnProperty(measurement)) {
      if (isNaN(ChapterStatsCtrl.measurementChange[measurement])) {
        ChapterStatsCtrl.measurementChange[measurement] = "N/A"
      } else {
        ChapterStatsCtrl.measurementChange[measurement] = ChapterStatsCtrl.measurementChange[measurement].toFixed(1);
      }
    };
  }

  ChapterStatsCtrl.averageChangeWeight = ((ChapterStatsCtrl.thisWeekMeasurements.weight - ChapterStatsCtrl.firstMeasurement.weight) / 7).toFixed(2);
  ChapterStatsCtrl.estimatedTDE = ChapterStatsCtrl.averageChangeWeight * 500 + ChapterStatsCtrl.calculateAverage(ChapterStatsCtrl.chapter.total_calories)
}

angular
  .module('fitnessTracker')
    .controller('ChapterStatsController', ChapterStatsController);
