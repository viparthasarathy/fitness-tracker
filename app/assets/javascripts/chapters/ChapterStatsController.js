function ChapterStatsController(chapterJSON) {
  var ChapterStatsCtrl = this;
  ChapterStatsCtrl.chapter = chapterJSON.data;

  // entries

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

  if (ChapterStatsCtrl.chapter.completed_at !== null) {
    var startOfThisWeek = new Date(ChapterStatsCtrl.chapter.completed_at);
    var startOfLastWeek = new Date(ChapterStatsCtrl.chapter.completed_at);
  } else {
    var startOfThisWeek = new Date();
    var startOfLastWeek = new Date();
  }

  startOfThisWeek.setDate(startOfThisWeek.getDate() - 7)
  startOfLastWeek.setDate(startOfLastWeek.getDate() - 14)

  var thisWeeksEntries = filterWeeklyEntries(startOfThisWeek, ChapterStatsCtrl.chapter.entries.slice(0, 7));
  var lastWeeksEntries = filterWeeklyEntries(startOfLastWeek, ChapterStatsCtrl.chapter.entries.slice(0, 14));

  console.log(thisWeeksEntries)
  console.log(ChapterStatsCtrl.chapter)
  console.log(startOfThisWeek)
  


  // measurements

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

  ChapterStatsCtrl.firstEntryID = ChapterStatsCtrl.chapter.entries[ChapterStatsCtrl.chapter.entries.length - 1].id;
  ChapterStatsCtrl.firstMeasurement = ChapterStatsCtrl.chapter.measurements[ChapterStatsCtrl.chapter.measurements.length - 1] || {};
  var thisWeeksMeasurements = thisWeeksEntries.map(function(entry) { return entry.measurement; }).filter(notNull);
  var lastWeeksMeasurements = lastWeeksEntries.map(function(entry) { return entry.measurement; }).filter(notNull);

  ChapterStatsCtrl.thisWeekMeasurements = calculateWeeklyMeasurementAverages(thisWeeksMeasurements);
  ChapterStatsCtrl.lastWeekMeasurements = calculateWeeklyMeasurementAverages(lastWeeksMeasurements);

  ChapterStatsCtrl.measurementChange = calculateMeasurementChange(ChapterStatsCtrl.thisWeekMeasurements, ChapterStatsCtrl.lastWeekMeasurements);
  formatProperties(ChapterStatsCtrl.measurementChange, 1);

  // foods

  function calculateWeeklyIntakeAverages(foods, entryCount) {
    var calories = foods.map(function(food) { return food.calories });
    var protein = foods.map(function(food) { return food.protein});
    var carbs = foods.map(function(food) { return food.carbs });
    var fats = foods.map(function(food) { return food.fats });
    if (entryCount > 0) {
      return {
        calories: calories.reduce( (total, calories) => total + calories, 0)/entryCount,
        protein: protein.reduce( (total, protein) => total + protein, 0)/entryCount,
        carbs: carbs.reduce( (total, carbs) => total + carbs, 0)/entryCount,
        fats: fats.reduce( (total, fats) => total + fats, 0)/entryCount
      }
    } else {
      return {
        calories: undefined,
        protein: undefined,
        carbs: undefined,
        fats: undefined
      }
    }
  }

  function calculateIntakeChange(firstIntakes, secondIntakes) {
    return {
      calories: (firstIntakes.calories - secondIntakes.calories),
      protein: (firstIntakes.protein - secondIntakes.protein),
      carbs: (firstIntakes.carbs - secondIntakes.carbs),
      fats: (firstIntakes.fats - secondIntakes.fats)
    }
  }

  var thisWeeksFoods = thisWeeksEntries.map(function(entry) { return entry.foods }).reduce(function(allFoods, foods) { return allFoods.concat(foods) }, []);
  var lastWeeksFoods = lastWeeksEntries.map(function(entry) { return entry.foods }).reduce(function(allFoods, foods) { return allFoods.concat(foods) }, []);

  ChapterStatsCtrl.thisWeeksIntakes = calculateWeeklyIntakeAverages(thisWeeksFoods, thisWeeksEntries.length);
  ChapterStatsCtrl.lastWeeksIntakes = calculateWeeklyIntakeAverages(lastWeeksFoods, lastWeeksEntries.length);

  ChapterStatsCtrl.intakeChange = calculateIntakeChange(ChapterStatsCtrl.thisWeeksIntakes, ChapterStatsCtrl.lastWeeksIntakes);
  formatProperties(ChapterStatsCtrl.intakeChange, 0);

  // averages, helpers, formatters, etc.

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

  function notNull(value) {
    return value !== null;
  }

  function formatProperties(object, fix) {
    for (var key in object) {
      if (object.hasOwnProperty(key)) {
        if (isNaN(object[key])) {
          object[key] = "N/A";
        } else {
          object[key] = object[key].toFixed(fix);
        }
      };
    }
  }

  if (ChapterStatsCtrl.chapter.completed_at !== null) {
    var daysPassed = Math.round((new Date(ChapterStatsCtrl.chapter.completed_at) - new Date(ChapterStatsCtrl.chapter.created_at)) / (60*60*24*1000));
  } else {
    var daysPassed = Math.round((new Date() - new Date(ChapterStatsCtrl.chapter.created_at)) / (60*60*24*1000));
  }
  if (daysPassed == 0) { daysPassed = 1; }

  ChapterStatsCtrl.averageChangeWeight = ((ChapterStatsCtrl.thisWeekMeasurements.weight - ChapterStatsCtrl.firstMeasurement.weight) / daysPassed).toFixed(2);
  if (ChapterStatsCtrl.averageChangeWeight === "NaN") { ChapterStatsCtrl.averageChangeWeight = "N/A" }

  ChapterStatsCtrl.estimatedTDE = ChapterStatsCtrl.averageChangeWeight * 500 + ChapterStatsCtrl.calculateAverage(ChapterStatsCtrl.chapter.total_calories) || "N/A";

}

angular
  .module('fitnessTracker')
    .controller('ChapterStatsController', ChapterStatsController);
