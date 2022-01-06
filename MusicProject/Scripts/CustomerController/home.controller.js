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

    //Lấy 3 rank bài hát
    function getWeekNumber(d) {
        // Copy date so don't modify original
        d = new Date(Date.UTC(d.getFullYear(), d.getMonth(), d.getDate()));
        // Set to nearest Thursday: current date + 4 - current day number
        // Make Sunday's day number 7
        d.setUTCDate(d.getUTCDate() + 4 - (d.getUTCDay() || 7));
        // Get first day of year
        var yearStart = new Date(Date.UTC(d.getUTCFullYear(), 0, 1));
        // Calculate full weeks to nearest Thursday
        var weekNo = Math.ceil((((d - yearStart) / 86400000) + 1) / 7);
        // Return array of year and week number
        return [d.getUTCFullYear(), weekNo];
    }
    let weekyearCurrent = getWeekNumber(new Date)

    $scope.pickedsongsVN
    $scope.pickedsongsUSUK
    $scope.pickedsongsAS
    $http({
        method: 'get',
        url: '/Home/Get3RankSongsofWeek',
        params: { quantity: 3, week: (weekyearCurrent[1] - 1), year: weekyearCurrent[0]}
    }).then(function (res) {
        $scope.songsVN = JSON.parse(res.data.songsVN)
        $scope.songsUSUK = JSON.parse(res.data.songsUSUK)
        $scope.songsAS = JSON.parse(res.data.songsAS)
        $scope.pickedsongsVN = $scope.songsVN[0]
        $scope.pickedsongsUSUK = $scope.songsUSUK[0]
        $scope.pickedsongsAS = $scope.songsAS[0]
    }, function (err) {
        alert('Failed to get songs!')
    })
    $scope.picksongsAS = function (s, name) {
        if (name == 'vn') {
            $scope.pickedsongsVN = s
        } else if (name == 'usuk'){
            $scope.pickedsongsUSUK = s
        } else {
            $scope.pickedsongsAS = s
        }
    }

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
    $scope.pickedSongNewst = function (index) {
        return $scope.ispickedSongNewest == index
    }
    $scope.pickSongNewst = function (index, s) {
        $scope.songNewestpicked = s
        $scope.ispickedSongNewest = index
    }
})