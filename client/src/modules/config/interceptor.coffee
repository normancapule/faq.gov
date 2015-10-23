angular.module('client').factory('httpInterceptor', [
  '$q','$rootScope','$injector',
  ($q, $rootScope,$injector) ->
    {
      responseError: (response) ->
        title = response.data.message or 'Oops!'
        message = response.data.error or response.data.errors?.join("<br><br>") or 'Something went wrong'
        switch response.status
          when 403
            swal text: message, type: 'error', title: 'Error'
            $injector.get('$state').go("admin.dashboard")
          when 401
            swal text: message, type: 'error', title: 'Error'
          when 500,422
            swal text: message, type: 'error', title: 'Error'
        $q.reject(response)

    }

]).config [
  '$httpProvider'
  ($httpProvider) ->
    $httpProvider.interceptors.push('httpInterceptor')
]

