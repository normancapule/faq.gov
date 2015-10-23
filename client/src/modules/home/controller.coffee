Ctrl = ($scope, $state, Search, Category)->
  console.log 'H O M E P A G E, B O Y S'
  $scope.vid = "7PTriE459ko"
  
  $scope.categories = {}

  Category.query().$promise.then (data) ->
    $scope.categories = data

  $scope.getResult = (val) ->
    Search.search(
      query: val
    )
    .$promise.then (data) ->
      console.log(data)
      return data.collection

  $scope.onSelect = ($item, $model, $label) ->
    console.log($model)
    console.log($item)
    console.log($label)

Ctrl.$inject = ['$scope','$state','Search', 'Category']
angular.module('client').controller('HomeCtrl', Ctrl)
