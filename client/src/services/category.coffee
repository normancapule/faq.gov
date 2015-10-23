module = ($resource)->

  Category = $resource "/api/categories/:id", null, {
    getList:
      method: 'GET'
      isArray: false
      url: '/api/categories'
  }

  Category

module.$inject = ['$resource']
angular.module('client').factory('Category', module)
