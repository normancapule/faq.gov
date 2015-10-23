Ctrl = ($scope,Comment, $modalInstance, $rootScope, $uibModal, articleId)->
  $scope.comment = {content: ''}
  $scope.saveComment = (form) ->
    form.$submitted = true
    Comment.save(article_id: articleId, comment: $scope.comment)
      .$promise.then (data) ->
        $modalInstance.close(data)

  $scope.cancel = () ->
    $modalInstance.close()


Ctrl.$inject = ['$scope','Comment', '$modalInstance', '$rootScope', '$uibModal', 'articleId']
angular.module('client').controller('commentModalCtrl', Ctrl)
