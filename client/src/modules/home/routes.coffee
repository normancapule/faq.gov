angular.module('client').config [
  '$stateProvider',
  ($stateProvider) ->

    $stateProvider
      .state 'home',
        url: '/',
        controller: 'HomeCtrl',
        templateUrl: 'modules/home/index.html'
        data:
          unauthenticated: true

]
