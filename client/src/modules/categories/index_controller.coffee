Ctrl = ($scope,$state,$stateParams,Category)->
  $scope.collection = []

  $scope.addPage =->
    $state.go('categories.add')

  Category.getList().$promise
    .then (data) ->
      $scope.collection = data.collection
    .catch (data) ->
      data.error

  


Ctrl.$inject = ['$scope','$state', '$stateParams','Category']
angular.module('client').controller('CategoriesCtrl', Ctrl)
