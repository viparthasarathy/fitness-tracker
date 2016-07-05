function AuthenticationController($scope, $state, Auth) {
  $scope.login = function() {
    Auth.login($scope.user).then(function() {
      $state.go('user')
    }, function(error) {
      console.log(error);
    })
  }

  $scope.register = function() {
    Auth.register($scope.user).then(function() {
      $state.go('user')
    }, function(error) {
      console.log(error);
    })
  }
}

angular
  .module('fitnessTracker')
    .controller('AuthenticationController', AuthenticationController);
