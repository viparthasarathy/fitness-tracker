function UserController($scope, Auth) {
  Auth.currentUser().then(function (user) {
    $scope.user = user;
  })
}

angular
  .module('fitnessTracker')
    .controller('UserController', UserController);
