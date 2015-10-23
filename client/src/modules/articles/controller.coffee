Ctrl = ($scope,$state,$stateParams, Article)->
  Article.get(id: $stateParams.id)
    .$promise.then (data) ->
      $scope.article = data
Ctrl.$inject = ['$scope','$state','$stateParams','Article']
angular.module('client').controller('ArticleCtrl', Ctrl)

