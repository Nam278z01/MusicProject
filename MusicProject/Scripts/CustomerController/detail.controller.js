//app.controller('DetailsController', function ($scope, $rootScope, $http, $routeParams) {
//    $rootScope.currentIndex = -1
//    $rootScope.currentSubIndex = -1
//    $http({
//        method: 'get',
//        url: '/Detail/GetSongByID',
//        params: { songid: $routeParams.song }
//    }).then(function (response) {
//        $scope.song = response.data
//        //start: Title
//        $rootScope.title = $scope.song.Song.SongName + " | "
//        var length = $scope.song.Artists.length
//        for (var i = 0; i < length; i++) {
//            $rootScope.title += $scope.song.Artists[i].ArtistName
//            if (i != length - 1) {
//                $rootScope.title += ", "
//            }
//        }
//        $rootScope.title += " | MyMusic"
//        //end: Title
//    }, function (error) {
//        alert('Failed to get the song!')
//    })

//    $http({
//        method: 'get',
//        url: '/Discovery/GetSongswithArtist'
//    }).then(function (response) {
//        $scope.songs = response.data
//    }, function (error) {
//        alert('Failed to get the songs!')
//    })
//})