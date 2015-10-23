angular.module('client').config [
  '$stateProvider',
  ($stateProvider) ->

    $stateProvider
      .state 'admin',
        url: '/admin',
        controller: 'AdminCtrl',
        templateUrl: 'modules/admin/index.html',
        data:
          authenticated: true
]
