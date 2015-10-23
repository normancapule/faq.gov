Ctrl = ($scope,$state,Search)->
  console.log 'H O M E P A G E, B O Y S'
  $scope.vid = "AW1AUe0MbQE"
  $scope.vid = "7PTriE459ko"

  $scope.getResult = (val) ->
    Search.search(
      query: val
    )
    .$promise.then (data) ->
      return data.collection

  $scope.onSelect = ($item, $model, $label) ->
    $state.go('articles.show', {id: $item.id})

Ctrl.$inject = ['$scope','$state','Search']
angular.module('client').controller('HomeCtrl', Ctrl)
