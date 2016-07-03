function AuthenticationController($scope, $state, Auth) {
  $scope.login = function() {
    Auth.login($scope.user).then(function() {
      console.log("Signed in!")
    })
  }

  $scope.register = function() {
    Auth.register($scope.user).then(Function() {
      console.log("Signed up!")
    });
  }
}

angular
  .module('fitnessTracker')
    .controller('AuthenticationController', AuthenticationController);
