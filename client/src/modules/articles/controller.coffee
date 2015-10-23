Ctrl = ($scope,$state,$stateParams, Article, Tip, Comment, $rootScope, $uibModal)->
  Article.get(id: $stateParams.id)
    .$promise.then (data) ->
      $scope.article = data
  Tip.query(article_id: $stateParams.id)
    .$promise.then (data) ->
      $scope.tips = data
  Comment.query(article_id: $stateParams.id)
    .$promise.then (data) ->
      $scope.comments = data

  $scope.addTip = () ->
    if !$rootScope.currentUser
      $rootScope.$broadcast 'login', {}
    else
      $scope.modalInstance = $uibModal.open(
        templateUrl: 'modules/articles/addTipModal.html'
        controller: 'tipModalCtrl'
        resolve:
          articleId: $scope.article.id
      )
      $scope.modalInstance.result.then (data) ->
        $scope.tips.push data

Ctrl.$inject = ['$scope','$state','$stateParams','Article','Tip', 'Comment', '$rootScope', '$uibModal']
angular.module('client').controller('ArticleCtrl', Ctrl)
