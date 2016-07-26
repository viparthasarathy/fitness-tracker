function FoodsController(EntryJSON, foodService, $scope) {
  var FoodsCtrl = this;
  FoodsCtrl.entry = EntryJSON.data;

  FoodsCtrl.calculateTotals = function() {
    FoodsCtrl.totalCalories = FoodsCtrl.entry.foods.reduce( (total, food) => total + food.calories, 0);
    FoodsCtrl.totalProtein = FoodsCtrl.entry.foods.reduce( (total, food) => total + food.protein, 0);
    FoodsCtrl.totalCarbs = FoodsCtrl.entry.foods.reduce( (total, food) => total + food.carbs, 0);
    FoodsCtrl.totalFats = FoodsCtrl.entry.foods.reduce( (total, food) => total + food.fats, 0);
    if (isNaN(FoodsCtrl.totalCalories)) { FoodsCtrl.totalCalories = "Invalid input."}
    if (isNaN(FoodsCtrl.totalProtein)) { FoodsCtrl.totalProtein = "Invalid input."}
    if (isNaN(FoodsCtrl.totalCarbs)) { FoodsCtrl.totalCarbs = "Invalid input."}
    if (isNaN(FoodsCtrl.totalFats)) { FoodsCtrl.totalFats = "Invalid input."}
  };

  FoodsCtrl.calculateTotals();

  FoodsCtrl.createFood = function() {
    FoodsCtrl.food.entry_id = FoodsCtrl.entry.id;
    foodService.createFood(FoodsCtrl.food)
      .then(function(response) {
        FoodsCtrl.entry.foods.push(response.data);
        FoodsCtrl.foodForm.$setPristine();
        FoodsCtrl.foodForm.$setUntouched();
        FoodsCtrl.food = {}
        FoodsCtrl.calculateTotals();
      });
  }

  FoodsCtrl.deleteFood = function(food, index) {
    foodService.deleteFood(food.id)
      .then(function(response) {
        FoodsCtrl.entry.foods.splice(index, 1);
        FoodsCtrl.calculateTotals();
      });
  }

  FoodsCtrl.updateFood = function(food, index) {
    foodService.updateFood(food)
      .then(function(response) {
        FoodsCtrl.entry.foods[index] = response.data;
        FoodsCtrl.calculateTotals();
      });
  }
}

angular
  .module('fitnessTracker')
    .controller('FoodsController', FoodsController);
