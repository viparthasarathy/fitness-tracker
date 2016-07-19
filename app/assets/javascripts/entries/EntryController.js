function EntryController(EntryJSON) {
  EntryCtrl = this;
  EntryCtrl.entry = EntryJSON.data;
  console.log(EntryCtrl.entry);
}

angular
  .module('fitnessTracker')
    .controller('EntryController', EntryController);
