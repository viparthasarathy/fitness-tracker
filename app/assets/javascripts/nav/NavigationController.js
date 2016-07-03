function NavigationController($scope, Auth) {
  $scope.signedIn = Auth.isAuthenticated;
  $scope.logout = Auth.logout;
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
  });
}

angular
  .module('fitnessTracker')
    .controller('NavigationController', NavigationController);
