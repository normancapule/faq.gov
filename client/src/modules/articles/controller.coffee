Ctrl = ($scope,$state,$stateParams, Article, Tip, Comment, Category, $rootScope, $uibModal)->
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

  $scope.addComment = () ->
    if !$rootScope.currentUser
      $rootScope.$broadcast 'login', {}
    else
      $scope.modalInstance = $uibModal.open(
        templateUrl: 'modules/articles/addCommentModal.html'
        controller: 'commentModalCtrl'
        resolve:
          articleId: $scope.article.id
      )
      $scope.modalInstance.result.then (data) ->
        $scope.comments.push data

Ctrl.$inject = ['$scope','$state','$stateParams','Article','Tip', 'Comment', 'Category', '$rootScope', '$uibModal']
angular.module('client').controller('ArticleCtrl', Ctrl)
