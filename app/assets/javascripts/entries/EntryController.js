function EntryController(EntryJSON) {
  this.entry = EntryJSON;
}

angular
  .module('fitnessTracker')
    .controller('EntryController', EntryController);
