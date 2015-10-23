Ctrl = ($scope,Tip, $modalInstance, $rootScope, $uibModal, articleId)->
  $scope.tip = {content: ''}
  $scope.saveTip = (form) ->
    form.$submitted = true
    Tip.save(article_id: articleId, tip: $scope.tip)
      .$promise.then (data) ->
        $modalInstance.close(data)

  $scope.cancel = () ->
    $modalInstance.close()


Ctrl.$inject = ['$scope','Tip', '$modalInstance', '$rootScope', '$uibModal', 'articleId']
angular.module('client').controller('tipModalCtrl', Ctrl)

