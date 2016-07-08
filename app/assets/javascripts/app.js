angular
  .module('fitnessTracker', ['ui.router', 'templates', 'Devise', 'ngMessages'])
    .config(function($stateProvider, $urlRouterProvider) {
      $stateProvider
        .state('signup', {
          url: '/signup',
          templateUrl: 'auth/_signup.html',
          controller: 'AuthenticationController as AuthCtrl',
          onEnter: function($state, Auth) {
            Auth.currentUser().then(function (){
              $state.go('log');
            })
          }
        })
        .state('signin', {
          url: '/signin',
          templateUrl: 'auth/_signin.html',
          controller: 'AuthenticationController as AuthCtrl',
          onEnter: function($state, Auth) {
            Auth.currentUser().then(function (){
              $state.go('log');
            })
          }
        })
        .state('log', {
          url: '/log',
          templateUrl: 'log/_log.html',
          controller: 'LogController as LogCtrl',
          onEnter: function($state, Auth) {
            if (!Auth.isAuthenticated()) { $state.go('signin'); }
          },
          resolve: {
            logJSON: function(logService) {
              return logService.getLog();
            }
          }
        });

        $urlRouterProvider.otherwise('/signin');
      });
