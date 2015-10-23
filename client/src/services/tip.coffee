module = ($resource)->

  Tip = $resource "/api/articles/:article_id/tips/:id", {id: '@id', article_id: '@article_id'},
    {

    }

  Tip



module.$inject = ['$resource']
angular.module('client').factory('Tip', module)




