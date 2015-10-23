angular.module('client').config [
  '$stateProvider',
  ($stateProvider) ->

    $stateProvider
      .state 'categories',
        url: '/categories',
        templateUrl: 'modules/categories/layout.html'
        abstract: true
    
      .state 'categories.index',
        url: '/add',
        controller: 'CategoriesCtrl',
        templateUrl: 'modules/categories/index.html'
        data:
          unauthenticated: true

]