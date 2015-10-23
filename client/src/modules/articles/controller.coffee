Ctrl = ($scope,$state,$stateParams, Article, Tip, Comment, Category)->
  Article.get(id: $stateParams.id)
    .$promise.then (data) ->
      $scope.article = data

      Category.get(id: data.category_id).$promise.then (data) ->
        console.log data
        $scope.relatedArticles = data.articles

  Tip.query(article_id: $stateParams.id)
    .$promise.then (data) ->
      $scope.tips = data

  Comment.query(article_id: $stateParams.id)
    .$promise.then (data) ->
      $scope.comments = data

Ctrl.$inject = ['$scope','$state','$stateParams','Article','Tip', 'Comment', 'Category']
angular.module('client').controller('ArticleCtrl', Ctrl)
