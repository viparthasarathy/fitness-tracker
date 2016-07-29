function LogController(logJSON) {
  var LogCtrl = this;
  LogCtrl.log = logJSON.data;
  LogCtrl.chapters = LogCtrl.log.chapters;

  function calculateStats(chapters) {
    var totalCalories = chapters.reduce( (total, chapter) => total + chapter.total_calories, 0)
    var totalProtein = chapters.reduce( (total, chapter) => total + chapter.total_protein, 0)
    var totalCarbs = chapters.reduce( (total, chapter) => total + chapter.total_carbs, 0)
    var totalFats = chapters.reduce( (total, chapter) => total + chapter.total_fats, 0)
    var totalEntries = chapters.reduce( (total, chapter) => total + chapter.entries.length, 0)
    if (totalEntries > 0) {
      return {
        averageCalories: Math.round(totalCalories/totalEntries),
        averageProtein: Math.round(totalProtein/totalEntries),
        averageCarbs: Math.round(totalCarbs/totalEntries),
        averageFats: Math.round(totalFats/totalEntries)
      }
    } else {
      return false;
    }
  }

  LogCtrl.gainStats = calculateStats(LogCtrl.chapters.filter(function(c) {return c.goal > 0}));
  LogCtrl.loseStats = calculateStats(LogCtrl.chapters.filter(function(c) {return c.goal < 0}));
  LogCtrl.maintainStats = calculateStats(LogCtrl.chapters.filter(function(c) {return c.goal === 0}));

  LogCtrl.noCurrentChapter = function() {
    return LogCtrl.chapters.length == 0 || LogCtrl.chapters[0].completed_at !== null
  }

  // Additional features: Display earliest measurement, latest measurement average, total change, and average change in weight while gaining, losing, and maintaining.
}

angular
  .module('fitnessTracker')
    .controller('LogController', LogController);
