problemMeApp.controller('problemsController', function($scope, $document, $window, $route, $routeParams, $resource) {
  var Problem = $resource('/problems/:id.json', {id: '@id'});
  $scope.problem = Problem.get({id:$routeParams.id});
  $scope.answerNum = 0;
  

  

  $document.ready(function(){
    var tag = document.createElement('script');
    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
    console.log('loaded yt api');
  });

  var player, staging;

  $window.onYouTubeIframeAPIReady = function() {
    // console.log('ytready');
    player = new YT.Player('player1', {
      height: $(window).height(),
      width: $(window).width(),
      playerVars: {
        controls: 1,
        showinfo: 0,
        rel: 0,
        color: 'white'
      },
      videoId: YouTubeGetID($scope.problem.problem_video),
      events: {
        'onReady': onPlayerReady,
        'onStateChange': onPlayerStateChange
      }
    });
    staging = new YT.Player('player2', {
      height: $(window).height(),
      width: $(window).width(),
      playerVars: {
        controls: 1,
        showinfo: 0,
        rel: 0,
        color: 'white'
      },
      videoId: YouTubeGetID($scope.problem.videos[$scope.answerNum].url),
      events: {
        // 'onReady': onPlayerReady,
        'onStateChange': onPlayerStateChange
      }
    });

  };

  function onPlayerReady(event) {
    event.target.playVideo();
  }

  var done = false;
  function onPlayerStateChange(event) {
    if (event.data == YT.PlayerState.ENDED) {
      // setTimeout(stopVideo, 6000);
      // done = true;
      playNextVideo();
      $scope.answerNum += 1;
    }
  }
  function playNextVideo() {
    if ($scope.answerNum % 2 == 0) {
      $('#player1').fadeOut();
      $('#player2').fadeIn();
      staging.playVideo();
      // cue new video in player
      player.cueVideoById(YouTubeGetID($scope.problem.videos[$scope.answerNum].url))
    } else if ($scope.answerNum !== $scope.problem.videos.length - 1){
      $('#player2').fadeOut();
      $('#player1').fadeIn();
      player.playVideo();
      // cue new video in staging
      staging.cueVideoById(YouTubeGetID($scope.problem.videos[$scope.answerNum].url))
    } else {
      player.destroy();
      staging.destroy();
      $('#player1').html('<h3>You\'ve reached the last video.</h3>');
      $('#player2').fadeOut();
      $('#player1').fadeIn();
    }
  }

  $scope.userSelectsNext = function() {
    playNextVideo();
  };

  $scope.favoriteButton = function($event) {
    $event.preventDefault();
    $event.target.addClass('active');
  };


});