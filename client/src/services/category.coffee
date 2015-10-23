module = ($resource) ->

  Category = $resource "/api/categories", null, {}

  Category



module.$inject = ['$resource']
angular.module('client').factory('Category', module)


