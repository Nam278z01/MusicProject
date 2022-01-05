appMusic.controller('ListenedController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.currentIndex = 7
    $rootScope.title = "Đã nghe | My music"

    $scope.isActiveNav = 1
    $scope.activeNav = function (index) {
        $scope.isActiveNav = index
    }
    $scope.checkActiveNav = function (index) {
        return $scope.isActiveNav == index
    }

    //Get listenedSong
    $scope.songsListened = []
    $scope.totalCountSongListened = 0
    $scope.pageSizeSongListened = 24
    $scope.maxSizeSongListened = 5
    $scope.pageIndexSongListened = 1
    $scope.loadSongSuccessfullSongListened = false // Dùng cho ẩn hiện phần loading item

    // Nếu lấy dữ liệu rồi (khi click vào tabs đó rồi) thì ko cần lấy lại dư liệu nữa
    $scope.isGetSongListened = false
    $scope.getSongListened = function () {
        if (!$scope.isGetSongListened) {
            getResultsPageSongListened(1)
        }
    }

    $scope.pageChangedSongListened = function (newPage) {
        getResultsPageSongListened(newPage);
    };

    $scope.getSongListened()

    function getResultsPageSongListened(index) {
        $scope.pageIndexSongListened = index
        $http({
            method: 'get',
            url: '/Listened/GetListenedSong',
            params: { pageIndex: index, pageSize: $scope.pageSizeSongListened }
        }).then(function (response) {
            $scope.songsListened = response.data.songs
            $scope.totalCountSongListened = response.data.totalCount
            $scope.loadSongSuccessfullSongListened = true
            $scope.isGetSongsofSongListened = true
        }, function (error) {
            alert('Failed to get the songs!')
        })
    }

    //Get listenedAlbum
    $scope.albumsListened = []
    $scope.totalCountAlbumListened = 0
    $scope.pageSizeAlbumListened = 24
    $scope.maxSizeAlbumListened = 5
    $scope.pageIndexAlbumListened = 1
    $scope.loadAlbumSuccessfullAlbumListened = false // Dùng cho ẩn hiện phần loading item

    // Nếu lấy dữ liệu rồi (khi click vào tabs đó rồi) thì ko cần lấy lại dư liệu nữa
    $scope.isGetAlbumListened = false
    $scope.getAlbumListened = function () {
        if (!$scope.isGetAlbumListened) {
            getResultsPageAlbumListened(1)
        }
    }

    $scope.pageChangedAlbumListened = function (newPage) {
        getResultsPageAlbumListened(newPage);
    };

    $scope.getAlbumListened()

    function getResultsPageAlbumListened(index) {
        $scope.pageIndexAlbumListened = index
        $http({
            method: 'get',
            url: '/Listened/GetAlbumsListened',
            params: { pageIndex: index, pageSize: $scope.pageSizeAlbumListened }
        }).then(function (response) {
            $scope.albumsListened = response.data.albums
            $scope.totalCountAlbumListened = response.data.totalCount
            $scope.loadAlbumSuccessfullAlbumListened = true
            $scope.isGetSongsofAlbumListened = true
        }, function (error) {
            alert('Failed to get the albums!')
        })
    }

    //Get listenedPlaylist
    $scope.playlistsListened = []
    $scope.totalCountPlaylistListened = 0
    $scope.pageSizePlaylistListened = 24
    $scope.maxSizePlaylistListened = 5
    $scope.pageIndexPlaylistListened = 1
    $scope.loadAlbumSuccessfullPlaylistListened = false // Dùng cho ẩn hiện phần loading item

    // Nếu lấy dữ liệu rồi (khi click vào tabs đó rồi) thì ko cần lấy lại dư liệu nữa
    $scope.isGetPlaylistListened = false
    $scope.getPlaylistListened = function () {
        if (!$scope.isGetPlaylistListened) {
            getResultsPagePlaylistListened(1)
        }
    }

    $scope.pageChangedPlaylistListened = function (newPage) {
        getResultsPagePlaylistListened(newPage);
    };

    $scope.getPlaylistListened()

    function getResultsPagePlaylistListened(index) {
        $scope.pageIndexPlaylistListened = index
        $http({
            method: 'get',
            url: '/Listened/GetPlaylistsListened',
            params: { pageIndex: index, pageSize: $scope.pageSizePlaylistListened }
        }).then(function (response) {
            $scope.playlistsListened = response.data.playlists
            $scope.totalCountPlaylistListened = response.data.totalCount
            $scope.loadAlbumSuccessfullPlaylistListened = true
            $scope.isGetSongsofPlaylistListened = true
        }, function (error) {
            alert('Failed to get the playlist!')
        })
    }
})
