

appMusic.controller('SearchController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.title = 'Tìm kiếm bài hát, playlist, album và nghệ sĩ'
    $rootScope.currentIndex = 0
    $rootScope.currentSubIndex = -1

    $scope.searchValue = $routeParams.q || '' //Lấy value từ url để cho vào input (đoạn dưới)
    // Phục vụ cho việc xác định trang tìm kiếm
    $scope.name = {
        song: 'bai-hat',
        playlist: 'playlist',
        album: 'album',
        artist: 'nghe-si'
    }

    // Nếu đúng thì submit input đc nhá
    function checkInputSearch() {
        if ($scope.searchValue) {
            $scope.isChange = true
        } else {
            $scope.isChange = false
        }
    }
    checkInputSearch()
    $scope.changeInput = checkInputSearch

    //Đoạn submit đây
    $scope.searchInput = function (name) {
        if ($scope.isChange) {
            $location.path('/tim-kiem/' + name).search({ q: $scope.searchValue, page: 1 })
        }
    }

    //Click vào dấu "x" trên input thì...
    $scope.deleteInput = function () {
        $location.path('/tim-kiem')
        $location.search({ q: null, page: null })
        $scope.searchValue = ''
        $scope.isChange = false
    }
})

appMusic.controller('SongSearchController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.title = $routeParams.q + " | Bài hát hay nhất "
    $rootScope.currentSubIndex = -1

    //Lấy về bài hát cần tìm kiếm
    $scope.songs = []
    $scope.totalCount = 0
    $scope.pageSize = 24
    $scope.maxSize = 5
    $scope.pageIndex = $routeParams.page
    $scope.loadSongSuccessfull = false

    getResultsPage($scope.pageIndex)

    $scope.pageChanged = function (newPage) {
        $location.path('/tim-kiem/bai-hat').search("page", newPage)
        getResultsPage(newPage);
    };

    function getResultsPage(index) {
        $scope.pageIndex = index
        $http({
            method: 'get',
            url: '/Search/GetSongsSearch',
            params: { pageIndex: $scope.pageIndex, pageSize: $scope.pageSize, textSearch: $routeParams.q }
        }).then(function (res) {
            $scope.songs = res.data.songs
            $scope.totalCount = res.data.totalCount
            $scope.loadSongSuccessfull = true
        }, function (err) {
            alert("Failed to get songs!")
        })
    }

    //Chơi nhạc 
    $scope.playMusic = function (song) {
        $rootScope.songIsPlayed = song
        document.querySelector('.play-music').classList.remove('hidden')
    }
})

appMusic.controller('ArtistSearchController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.title = $routeParams.q + " | Tìm kiếm nghệ sĩ "
    $rootScope.currentSubIndex = 1

    //Lấy về nghệ sĩ cần tìm kiếm
    $scope.totalCount = 0
    $scope.pageSize = 24
    $scope.maxSize = 5
    $scope.pageIndex = $routeParams.page
    $scope.loadSongSuccessfull = false

    getResultsPage($scope.pageIndex)

    $scope.pageChanged = function (newPage) {
        $location.path('/tim-kiem/nghe-si').search("page", newPage)
        getResultsPage(newPage);
    };

    function getResultsPage(index) {
        $scope.pageIndex = index
        $http({
            method: 'get',
            url: '/Search/GetArtistsSearch',
            params: { pageIndex: $scope.pageIndex, pageSize: $scope.pageSize, textSearch: $routeParams.q }
        }).then(function (res) {
            $scope.artists = res.data.artists
            $scope.totalCount = res.data.totalCount
            $scope.loadSongSuccessfull = true
        }, function (err) {
            alert("Failed to get artists!")
        })
    }
})


appMusic.controller('AlbumSearchController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.title = $routeParams.q + " | Tìm kiếm Album "
    $rootScope.currentSubIndex = -1

    //Lấy về album cần tìm kiếm
    $scope.totalCount = 0
    $scope.pageSize = 24
    $scope.maxSize = 5
    $scope.pageIndex = $routeParams.page
    $scope.loadSongSuccessfull = false

    getResultsPage($scope.pageIndex)

    $scope.pageChanged = function (newPage) {
        $location.path('/tim-kiem/album').search("page", newPage)
        getResultsPage(newPage);
    };

    function getResultsPage(index) {
        $scope.pageIndex = index
        $http({
            method: 'get',
            url: '/Search/GetAlbumsSearch',
            params: { pageIndex: $scope.pageIndex, pageSize: $scope.pageSize, textSearch: $routeParams.q }
        }).then(function (res) {
            $scope.albums = res.data.albums
            $scope.totalCount = res.data.totalCount
            $scope.loadSongSuccessfull = true
        }, function (err) {
            alert("Failed to get albums!")
        })
    }
})

appMusic.controller('PlaylistSearchController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.title = $routeParams.q + " | Tìm kiếm Playlist "
    $rootScope.currentSubIndex = -1

    //Lấy về playlist cần tìm kiếm
    $scope.totalCount = 0
    $scope.pageSize = 24
    $scope.maxSize = 5
    $scope.pageIndex = $routeParams.page
    $scope.loadSongSuccessfull = false

    getResultsPage($scope.pageIndex)

    $scope.pageChanged = function (newPage) {
        $location.path('/tim-kiem/playlist').search("page", newPage)
        getResultsPage(newPage);
    };

    function getResultsPage(index) {
        $scope.pageIndex = index
        $http({
            method: 'get',
            url: '/Search/GetPlaylistsSearch',
            params: { pageIndex: $scope.pageIndex, pageSize: $scope.pageSize, textSearch: $routeParams.q }
        }).then(function (res) {
            $scope.playlists = res.data.playlists
            $scope.totalCount = res.data.totalCount
            $scope.loadSongSuccessfull = true
        }, function (err) {
            alert("Failed to get playlists!")
        })
    }
})