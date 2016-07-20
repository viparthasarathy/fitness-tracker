function EntryController(EntryJSON, foodService, $scope) {
  EntryCtrl = this;
  EntryCtrl.entry = EntryJSON.data;

  EntryCtrl.calculateTotals = function() {
    EntryCtrl.totalCalories = EntryCtrl.entry.foods.reduce( (total, food) => total + food.calories, 0);
    EntryCtrl.totalProtein = EntryCtrl.entry.foods.reduce( (total, food) => total + food.protein, 0);
    EntryCtrl.totalCarbs = EntryCtrl.entry.foods.reduce( (total, food) => total + food.carbs, 0);
    EntryCtrl.totalFats = EntryCtrl.entry.foods.reduce( (total, food) => total + food.fats, 0);
  };

  EntryCtrl.calculateTotals();

  EntryCtrl.createFood = function() {
    EntryCtrl.food.entry_id = EntryCtrl.entry.id;
    foodService.createFood(EntryCtrl.food)
      .then(function(response) {
        EntryCtrl.entry.foods.push(response.data);
        EntryCtrl.foodForm.$setPristine();
        EntryCtrl.foodForm.$setUntouched();
        EntryCtrl.food = {}
        EntryCtrl.calculateTotals();
      });
  }
}

angular
  .module('fitnessTracker')
    .controller('EntryController', EntryController);
