function EntryController(EntryJSON, foodService, $scope) {
  var EntryCtrl = this;
  EntryCtrl.entry = EntryJSON.data;

  EntryCtrl.calculateTotals = function() {
    EntryCtrl.totalCalories = EntryCtrl.entry.foods.reduce( (total, food) => total + food.calories, 0);
    EntryCtrl.totalProtein = EntryCtrl.entry.foods.reduce( (total, food) => total + food.protein, 0);
    EntryCtrl.totalCarbs = EntryCtrl.entry.foods.reduce( (total, food) => total + food.carbs, 0);
    EntryCtrl.totalFats = EntryCtrl.entry.foods.reduce( (total, food) => total + food.fats, 0);
    if (isNaN(EntryCtrl.totalCalories)) { EntryCtrl.totalCalories = "Invalid input."}
    if (isNaN(EntryCtrl.totalProtein)) { EntryCtrl.totalProtein = "Invalid input."}
    if (isNaN(EntryCtrl.totalCarbs)) { EntryCtrl.totalCarbs = "Invalid input."}
    if (isNaN(EntryCtrl.totalFats)) { EntryCtrl.totalFats = "Invalid input."}
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

  EntryCtrl.deleteFood = function(food, index) {
    foodService.deleteFood(food.id)
      .then(function(response) {
        EntryCtrl.entry.foods.splice(index, 1);
        EntryCtrl.calculateTotals();
      });
  }

  EntryCtrl.updateFood = function(food, index) {
    foodService.updateFood(food)
      .then(function(response) {
        EntryCtrl.entry.foods[index] = response.data;
        EntryCtrl.calculateTotals();
      });
  }
}

angular
  .module('fitnessTracker')
    .controller('EntryController', EntryController);
