appMusic.controller('HomeController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.title = 'My Music | Nghe nhạc Hot, tải nhạc Hay'
    //Tab hoạt động là trang home
    $rootScope.currentIndex = 1
    //Tắt tab con đi 
    $rootScope.currentSubIndex = -1

    //Hiển thí loading item đó
    $scope.loadSongSuccessfull = false
    $scope.loadSongSuccessfull2 = false
    $scope.loadSongSuccessfull3 = false

    //Lấy 10 playlist random
    $http({
        method: 'get',
        url: '/Home/Get10PlaylistsRandom'
    }).then(function (res) {
        $scope.playlistsRandom = res.data
        $scope.loadSongSuccessfull = true
    }, function (err) {
        alert('Failed to get playlists!')
    })

    //Lấy 10 playlist mới nhất
    $http({
        method: 'get',
        url: '/Home/Get10PlaylistsNewest'
    }).then(function (res) {
        $scope.playlistsNewest = res.data
        $scope.loadSongSuccessfull2 = true
    }, function (err) {
        alert('Failed to get playlists!')
    })

    //Lấy 10 album random
    $http({
        method: 'get',
        url: '/Home/Get10AlbumsRandom'
    }).then(function (res) {
        $scope.albumsRandom = res.data
        $scope.loadSongSuccessfull3 = true
    }, function (err) {
        alert('Failed to get albums!')
    })

    //Lấy 10 bài hát mới nhất
    $http({
        method: 'get',
        url: '/Home/Get10SongsNewest'
    }).then(function (res) {
        $scope.songsNewest = res.data
        $scope.songNewestpicked = $scope.songsNewest[0]
    }, function (err) {
        alert('Failed to get songs!')
    })

    //Lấy 10 bài hát random
    $http({
        method: 'get',
        url: '/Home/Get10SongsRandom'
    }).then(function (res) {
        $scope.songsRandom = res.data
    }, function (err) {
        alert('Failed to get songs!')
    })

    //Mouse over hoặc click phần bài hát mới nhất thì show nó lên phần cần show đó và kích hoạt màu cho dễ nhận biết bài hát này đc chọn
    $scope.ispickedSongNewest = 0
    $scope.pickedSongNewst = function (index, s) {
        return $scope.ispickedSongNewest == index
    }
    $scope.pickSongNewst = function (index, s) {
        $scope.songNewestpicked = s
        $scope.ispickedSongNewest = index
    }
})