problemMeApp.controller('searchController', function($scope, $resource, $location){
  $scope.searchString = 'How do I find my passion?';
  $scope.location = $location.path();
  var Search = $resource('/problems/')

  $scope.searchProblems = function(){
    
  };
});