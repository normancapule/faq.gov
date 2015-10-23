module = ($resource)->

  Article = $resource "/api/articles/:id", {id: '@id'},
    {

    }

  Article



module.$inject = ['$resource']
angular.module('client').factory('Article', module)



