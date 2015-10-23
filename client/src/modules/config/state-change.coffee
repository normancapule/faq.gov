angular.module('client').run [
  '$rootScope','$location','$state','$window','$http','Session', ($rootScope,$location,$state,$window,$http,Session) ->
    $rootScope.authenticatorFlag = true

    $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
      authToken = localStorage.getItem('AuthToken')
      userId = localStorage.getItem('UserId')

      if $rootScope.authenticatorFlag
        event.preventDefault()
        $rootScope.authenticatorFlag = false
        $http.defaults.headers.common.Authorization = authToken
        $http.defaults.headers.common.UserId = userId
        if authToken
          Session.getCurrentUser().$promise
            .then (data) ->
              $rootScope.currentUser = data
              evalState toState,toParams
            .catch (err) ->
              unless err.message == "transition prevented"
                $rootScope.authenticatorFlag = true
                localStorage.removeItem('AuthToken')
                localStorage.removeItem('UserId')
                localStorage.removeItem('SearchApiLink')
                $state.go("login")
        else
          evalState toState,toParams

    $rootScope.$on '$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->
      $rootScope.authenticatorFlag = true

    evalState =(toState,toParams)->
      if toState.data.authenticated && $rootScope.currentUser
        cache = getCachedUrl()
        if cache.name
          $state.go(cache.name, cache.params)
        else
          $state.go(toState.name, toParams)
      else if toState.data.unauthenticated && $rootScope.currentUser
        $state.go('home')
      else if toState.data.unauthenticated && !$rootScope.currentUser
        $state.go(toState.name, toParams)
      else
        setUrlToCache(toState, toParams)
        $state.go("login")

    setUrlToCache = (toState, toParams='{}') ->
      localStorage.setItem('originalUrlName', toState.name)
      localStorage.setItem('originalUrlParams', JSON.stringify(toParams))

    getCachedUrl = () ->
      cache =
        name: localStorage.getItem('originalUrlName')
        params: JSON.parse(localStorage.getItem('originalUrlParams')||'{}')
      localStorage.removeItem('originalUrlName')
      localStorage.removeItem('originalUrlParams')
      cache

]

