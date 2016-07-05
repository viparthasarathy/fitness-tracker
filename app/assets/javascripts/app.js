angular
  .module('fitnessTracker', ['ui.router', 'templates', 'Devise'])
    .config(function($stateProvider, $urlRouterProvider) {
      $stateProvider
        .state('signup', {
          url: '/signup',
          templateUrl: 'auth/_signup.html',
          controller: 'AuthenticationController as AuthCtrl',
          onEnter: function($state, Auth) {
            Auth.currentUser().then(function (){
              $state.go('user');
            })
          }
        })
        .state('signin', {
          url: '/signin',
          templateUrl: 'auth/_signin.html',
          controller: 'AuthenticationController as AuthCtrl',
          onEnter: function($state, Auth) {
            Auth.currentUser().then(function (){
              $state.go('user');
            })
          }
        })
        .state('user', {
          url: '/user',
          templateUrl: 'user/_user.html',
          controller: 'UserController as UserCtrl',
          onEnter: function($state, Auth) {
            if !Auth.isAuthenticated() { $state.go('signin'); }
          }
        });

        $urlRouterProvider.otherwise('/signin');
      });
