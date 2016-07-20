function EntryController(EntryJSON, foodService) {
  EntryCtrl = this;
  EntryCtrl.entry = EntryJSON.data;

  EntryCtrl.createFood = function() {
    EntryCtrl.food.entry_id = EntryCtrl.entry.id;
    foodService.createFood(EntryCtrl.food)
      .then(function(response) {
        EntryCtrl.entry.foods.push(response.data);
        EntryCtrl.foodForm.$setPristine();
        EntryCtrl.foodForm.$setUntouched();
        EntryCtrl.food = {}
      }, function(error) {
        console.log(error);
      });
  }
}

angular
  .module('fitnessTracker')
    .controller('EntryController', EntryController);
