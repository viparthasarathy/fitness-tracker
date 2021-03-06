function AuthenticationController($scope, $state, Auth) {

  $scope.user = {email: "example@example.com",
                 password: "example"
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
    })
  }
}

angular
  .module('fitnessTracker')
    .controller('AuthenticationController', AuthenticationController);
