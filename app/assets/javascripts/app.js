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
        })
        .state('chapters', {
          url: '/chapters',
          templateUrl: 'chapters/_chapters.html',
          controller: 'ChaptersController as ChaptersCtrl'
        })
        .state('chapters.new', {
          url: '/new',
          templateUrl: 'chapters/_new.html',
          controller: 'NewChapterController as NewChapterCtrl'
        })
        .state('chapters.show', {
          url: '/:id',
          templateUrl: 'chapters/_show.html',
          controller: 'ChapterController as ChapterCtrl'
        })
        .state('chapters.index', {
          url: '/index',
          templateUrl: 'chapters/_index.html',
          controller: 'ChaptersIndexController as ChaptersIndexCtrl'
        })

        $urlRouterProvider.otherwise('/signin');
      });
