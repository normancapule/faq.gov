Ctrl = ($scope,$state,$stateParams,Category)->
  $scope.currentCategory = new Category

  $scope.backToIndexPage =->
    $state.go('categories.index')

  $scope.addNewCategory =->
    Category.save(category: $scope.currentCategory.name).$promise
      .then (data) ->
        $scope.go('categories.index')

Ctrl.$inject = ['$scope','$state', '$stateParams','Category']
angular.module('client').controller('AddCtrl', Ctrl)
