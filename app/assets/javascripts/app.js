angular
  .module('fitnessTracker', ['ui.router', 'templates', 'Devise']);
    .config(function($stateProvider, $urlRouteProvider) {
      $stateProvider
        .state('signup', {
          url: '/signup',
          templateUrl: 'auth/_signup.html',
          controller: 'AuthenticationController as AuthCtrl'
        })
        .state('signin', {
          url: '/signin',
          templateUrl: 'auth/_signin.html',
          controller: 'AuthenticationController as AuthCtrl'
        });

        $urlRouterProvider.otherwise('/signin');
      });
