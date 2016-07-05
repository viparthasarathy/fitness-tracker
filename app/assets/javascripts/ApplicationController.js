function ApplicationController($scope, $state, Auth) {
  $scope.signedIn = Auth.isAuthenticated;
  $scope.signout = Auth.logout;
  Auth.currentUser().then(function (user) {
    $scope.user = user;
  })

  $scope.$on('devise:new-registration', function(event, user) {
    $scope.user = user;
  });

  $scope.$on('devise:login', function(event, user) {
    $scope.user = user;
  });

  $scope.$on('devise:logout', function(event, user) {
    $scope.user = {};
    $state.go('signin')
  });
}


angular
  .module('fitnessTracker')
    .controller('ApplicationController', ApplicationController);
