module = ($resource)->

  Category = $resource "/api/categories/:id", {id: '@id'},
    {

    }

  Category



module.$inject = ['$resource']
angular.module('client').factory('Category', module)



