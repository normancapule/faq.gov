angular.module('client').config [
  '$stateProvider',
  ($stateProvider) ->

    $stateProvider
      .state 'categories',
        url: '/categories',
        controller: 'CategoriesCtrl',
        templateUrl: 'modules/categories/index.html'
        data:
          unauthenticated: true

]