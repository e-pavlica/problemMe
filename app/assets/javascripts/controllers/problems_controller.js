problemMeApp.controller('problemsController', function($scope) {
  $scope.hello = 'world';
  $scope.ytLink = 'http://youtu.be/EI0tsBZlp6Q';
  $scope.ytId = YouTubeGetID($scope.ytLink);
});