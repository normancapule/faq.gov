Ctrl = ($scope,$state,Session,$uibModal,$rootScope,$http)->
  $scope.credentials = {}
  $scope.openModal = () ->
    $scope.modalInstance = $uibModal.open(
      templateUrl: 'modules/navbar/loginModal.html'
    )

    $scope.modalInstance.result.then (data) ->
      console.log(data)

  $scope.logout = () ->
    Session.logout().$promise.then (success) ->
      $rootScope.clearSession()
      $state.go("home")

  $scope.login =(form)->
    form.$submitted = true
    Session.login(credentials: $scope.credentials).$promise
      .then (data) ->
        localStorage.setItem("AuthToken", data.auth_token)
        localStorage.setItem("UserId", data.user_id)
        $rootScope.currentUser = data
        $http.defaults.headers.common.Authorization = data.auth_token
        $http.defaults.headers.common.UserId = data.user_id
        $scope.credentials = {}
        $scope.modalInstance.close()

Ctrl.$inject = ['$scope','$state','Session','$uibModal','$rootScope','$http']
angular.module('client').controller('NavbarCtrl', Ctrl)

