angular.module(
  'client',
  [
    'ngSanitize',
    'ui.router',
    'templates',
    'ngResource',
    'ngAnimate',
    'textAngular',
    'ui.bootstrap',
    'Navbar',
    'angularVideoBg'
  ]
).config ->
  new WOW().init()


