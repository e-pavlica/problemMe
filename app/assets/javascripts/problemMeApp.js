var problemMeApp = angular.module('problemMeApp', [
  'ngResource',
  'ngRoute'
])
  .config(function($routeProvider){
    $routeProvider
      .when('/',{
        templateUrl:'/search.html',
        controller: 'searchController'
      })
      .when('/problems/:id',{
        templateUrl:'/results.html',
        controller: 'problemsController'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
