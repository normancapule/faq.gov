angular.module('client').config [
  '$stateProvider',
  ($stateProvider) ->

    $stateProvider
      .state 'categories',
        url: '/categories',
        templateUrl: 'modules/categories/layout.html',
        abstract: true

      .state 'categories.index',
        url: '',
        controller: 'CategoriesCtrl',
        templateUrl: 'modules/categories/index.html'
        data:
           unauthenticated: true
    
      .state 'categories.add',
        url: '/add',
        controller: 'AddCtrl',
        templateUrl: 'modules/categories/add.html'
        data:
          unauthenticated: true

]