'use strict';

// Main module of the application.

angular.module( 'myApp',
  [
    'ng-rails-csrf',
    'templates',
    'ui.bootstrap',
    'ngResource',
    'ngRoute',
  ]
).config( function( $routeProvider ) {
  $routeProvider.when( '/',      { templateUrl: 'main.html',  controller: 'MainCtrl' } );
  $routeProvider.when( '/about', { templateUrl: 'about.html', controller: 'AboutCtrl' } );

  $routeProvider.otherwise( { redirectTo: '/' } );
} );