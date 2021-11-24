appMusic.controller('HomeController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.title = 'My Music | Nghe nhạc Hot, tải nhạc Hay'
    $rootScope.currentIndex = 1
    $rootScope.currentSubIndex = -1

    $http({
        method: 'get',
        url: '/Home/Get10SongsRandom'
    }).then(function (res) {
        $scope.songsRandom = res.data
    }, function (err) {
        alert('Failed to get songs!')
    })
    $http({
        method: 'get',
        url: '/Home/Get10SongsNewest'
    }).then(function (res) {
        $scope.songsNewest = res.data
        $scope.songNewestpicked = $scope.songsNewest[0]
    }, function (err) {
        alert('Failed to get songs!')
    })
    $http({
        method: 'get',
        url: '/Home/Get10AlbumsRandom'
    }).then(function (res) {
        $scope.albumsRandom = res.data
    }, function (err) {
        alert('Failed to get albums!')
    })
    $http({
        method: 'get',
        url: '/Home/Get10PlaylistsNewest'
    }).then(function (res) {
        $scope.playlistsNewest = res.data
    }, function (err) {
        alert('Failed to get playlists!')
    })
    $http({
        method: 'get',
        url: '/Home/Get10PlaylistsRandom'
    }).then(function (res) {
        $scope.playlistsRandom = res.data
    }, function (err) {
        alert('Failed to get playlists!')
    })

    $scope.ispickedSongNewest = 0
    $scope.pickedSongNewst = function (index, s) {
        return $scope.ispickedSongNewest == index
    }
    $scope.pickSongNewst = function (index, s) {
        $scope.songNewestpicked = s
        $scope.ispickedSongNewest = index
    }
})