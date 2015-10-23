module = ($resource)->

  Comment = $resource "/api/articles/:article_id/comments/:id", {id: '@id', article_id: '@article_id'},
    {

    }

  Comment



module.$inject = ['$resource']
angular.module('client').factory('Comment', module)





