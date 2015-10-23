Ctrl = ($scope,$state,$stateParams, Article, Tip, Comment)->
  Article.get(id: $stateParams.id)
    .$promise.then (data) ->
      $scope.article = data
  Tip.query(article_id: $stateParams.id)
    .$promise.then (data) ->
      $scope.tips = data
  Comment.query(article_id: $stateParams.id)
    .$promise.then (data) ->
      $scope.comments = data
Ctrl.$inject = ['$scope','$state','$stateParams','Article','Tip', 'Comment']
angular.module('client').controller('ArticleCtrl', Ctrl)
