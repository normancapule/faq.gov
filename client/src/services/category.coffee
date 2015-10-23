module = ($resource)->


  Category = $resource "/api/categories", null, {
    getList:
      method: 'GET'
      isArray: false
      url: '/api/categories'
  }

  Category

module.$inject = ['$resource']
angular.module('client').factory('Category', module)
