module = ($resource)->

  Search = $resource "/api/search", null,
    {
      search:
        method: 'GET'
        isArray: false
    }

  Search



module.$inject = ['$resource']
angular.module('client').factory('Search', module)


