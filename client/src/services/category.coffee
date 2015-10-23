module = ($resource)->


  Category = $resource "/api/categories", null, {
    getList:
      method: 'GET'
      url: '/api/categories'
  }

  Category

module.$inject = ['$resource']
angular.module('client').factory('Category', module)
