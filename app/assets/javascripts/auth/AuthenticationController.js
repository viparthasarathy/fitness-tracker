function AuthenticationController($scope, $state, Auth) {
  $scope.time_zone = {
    "value": "Pacific Time (US & Canada)",
    "values": ["Pacific Time (US & Canada)", "Mountain Time (US & Canada)"]
  }
  $scope.login = function() {
    Auth.login($scope.user).then(function() {
      $state.go('log')
    }, function(error) {
      $scope.signInForm.password.$error.server = true;
      $scope.serverPasswordError = "Invalid email/password combination.";
    })
  }

  $scope.register = function() {
    Auth.register($scope.user).then(function() {
      $state.go('log')
    }, function(error) {
      for (errorObject in error.data.errors) {
        if (errorObject == "email") {
          $scope.signUpForm.email.$error.server = true;
          $scope.serverEmailError = "Email " + error.data.errors.email[0] + "."
        } else {
          $scope.signUpForm.password.$error.server = true;
          $scope.serverPasswordError = "Password " + error.data.errors.email[0] + "."
        }
      }
      $scope.signUpForm.email.$error.server = true;
    })
  }
}

angular
  .module('fitnessTracker')
    .controller('AuthenticationController', AuthenticationController);
