module = angular.module("Navbar", [])

module.directive 'navbar', ->
  restrict: 'AE'
  replace: true
  templateUrl: 'modules/navbar/template.html'
  controller: 'NavbarCtrl'
