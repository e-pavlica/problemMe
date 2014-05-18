problemMeApp.controller('problemsController', function($scope, $document, $window, $route, $routeParams, $resource) {
  var Problem = $resource('/problems/:id.json', {id: '@id'});
  $scope.problem = Problem.get({id:$routeParams.id});
  $scope.probvid = $scope.problem.problem_video;
  $document.ready(function(){
    var tag = document.createElement('script');
    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
    console.log('loaded yt api');
  });

  var player;

  $window.onYouTubeIframeAPIReady = function() {
    console.log('ytready');
    player = new YT.Player('player1', {
      height: $(window).height(),
      width: $(window).width(),
      playerVars: {
        controls: 0,
        showinfo: 0,
        color: 'white',
      },
      videoId: YouTubeGetID($scope.problem.problem_video),
      events: {
        'onReady': onPlayerReady,
        'onStateChange': onPlayerStateChange
      }
    });

  };

  function onPlayerReady(event) {
    event.target.playVideo();
  }

  var done = false;
  function onPlayerStateChange(event) {
    if (event.data == YT.PlayerState.PLAYING && !done) {
      setTimeout(stopVideo, 6000);
      done = true;
    }
  }
  function stopVideo() {
    player.stopVideo();
  }

});