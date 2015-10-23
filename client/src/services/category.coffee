module = ($resource)->


  Category = $resource "/api/categories/:id", null, {}

  Category

module.$inject = ['$resource']
angular.module('client').factory('Category', module)
