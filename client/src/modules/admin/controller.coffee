Ctrl = ($scope, $state) ->
  console.log('t')
Ctrl.$inject = ['$scope', '$state']
angular.module('client').controller('AdminCtrl', Ctrl)
