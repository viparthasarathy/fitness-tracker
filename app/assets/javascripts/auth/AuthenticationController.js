function AuthenticationController($scope, $state, Auth) {
  $scope.login = function() {
    Auth.login($scope.user).then(function() {
      $state.go('user')
    })
  }

  $scope.register = function() {
    Auth.register($scope.user).then(Function() {
      $state.go('user')
    });
  }
}

angular
  .module('fitnessTracker')
    .controller('AuthenticationController', AuthenticationController);
