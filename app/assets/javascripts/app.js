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
          templateUrl: 'log/_show.html',
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
          templateUrl: 'chapters/_index.html',
          controller: 'ChaptersController as ChaptersCtrl',
          onEnter: function($state, Auth) {
            if (!Auth.isAuthenticated()) { $state.go('signin'); }
          },
          resolve: {
            chaptersJSON: function(chapterService) {
              return chapterService.getChapters();
            }
          }
        })
        .state('showChapter', {
          url: '/chapters/:id',
          templateUrl: 'chapters/_show.html',
          controller: 'ChapterController as ChapterCtrl',
          onEnter: function($state, Auth) {
            if (!Auth.isAuthenticated()) { $state.go('signin'); }
          },
          resolve: {
            chapterJSON: function(chapterService, $stateParams) {
              return chapterService.getChapter($stateParams.id);
            }
          }
        })
        .state('showChapter.entryFoods', {
          url: '/entries/:entry_id/foods',
          templateUrl: 'entries/foods/_show.html',
          controller: 'FoodsController as FoodsCtrl',
          resolve: {
            EntryJSON: function(entryService, $stateParams) {
              return entryService.getEntry($stateParams.entry_id);
            }
          }
        })
        .state('showChapter.entryMeasurement', {
          url: '/entries/:entry_id/measurement',
          templateUrl: 'entries/measurement/_show.html',
          controller: 'MeasurementController as MeasurementCtrl',
          resolve: {
            EntryJSON: function(entryService, $stateParams) {
              return entryService.getEntry($stateParams.entry_id);
            }
          }
        });

        $urlRouterProvider.otherwise('/signin');
      });
