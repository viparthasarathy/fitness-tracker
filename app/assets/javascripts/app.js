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
              $state.go('home');
            })
          }
        })
        .state('signin', {
          url: '/signin',
          templateUrl: 'auth/_signin.html',
          controller: 'AuthenticationController as AuthCtrl',
          onEnter: function($state, Auth) {
            Auth.currentUser().then(function (){
              $state.go('home');
            })
          }
        })
        .state('user', {
          url: '/user',
          templateUrl: 'user/_user.html',
          controller: 'UserController as UserCtrl'
        });

        $urlRouterProvider.otherwise('/signin');
      });
