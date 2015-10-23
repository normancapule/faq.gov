Ctrl = ($scope,$state)->
  console.log 'H O M E P A G E, B O Y S'
  $scope.vid = "AW1AUe0MbQE"
  $scope.vid = "7PTriE459ko"

Ctrl.$inject = ['$scope','$state']
angular.module('client').controller('HomeCtrl', Ctrl)
