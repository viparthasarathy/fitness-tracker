function EntryController(EntryJSON, foodService) {
  EntryCtrl = this;
  EntryCtrl.entry = EntryJSON.data;
  console.log(EntryCtrl.entry);

  EntryCtrl.createFood = function() {
    foodService.createFood(EntryCtrl.food)
      .then(function(response) {
        console.log(response);
      }, function(error) {
        console.log(error);
      });
  }
}

angular
  .module('fitnessTracker')
    .controller('EntryController', EntryController);
