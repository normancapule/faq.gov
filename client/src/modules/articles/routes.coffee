angular.module('client').config [
  '$stateProvider',
  ($stateProvider) ->

    $stateProvider
      .state 'articles',
        url: '/articles',
        templateUrl: 'modules/articles/layout.html',
        abstract: true

      .state 'articles.show',
        url: '/:id',
        controller: 'ArticleCtrl',
        templateUrl: 'modules/articles/show.html'
        data:
          unauthenticated: true

]

