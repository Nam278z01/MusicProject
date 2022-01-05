appMusic.controller('LikedController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.currentIndex = 6
    $rootScope.title = "Yêu thích | My music"

    $scope.isActiveNav = 1
    $scope.activeNav = function (index) {
        $scope.isActiveNav = index
    }
    $scope.checkActiveNav = function (index) {
        return $scope.isActiveNav == index
    }

    //Get likedSong
    $scope.songsLiked = []
    $scope.totalCountSongLiked = 0
    $scope.pageSizeSongLiked = 24
    $scope.maxSizeSongLiked = 5
    $scope.pageIndexSongLiked = 1
    $scope.loadSongSuccessfullSongLiked = false // Dùng cho ẩn hiện phần loading item

    // Nếu lấy dữ liệu rồi (khi click vào tabs đó rồi) thì ko cần lấy lại dư liệu nữa
    $scope.isGetSongLiked = false
    $scope.getSongLiked = function () {
        if (!$scope.isGetSongLiked) {
            getResultsPageSongLiked(1)
        }
    }

    $scope.pageChangedSongLiked = function (newPage) {
        getResultsPageSongLiked(newPage);
    };

    $scope.getSongLiked()

    function getResultsPageSongLiked(index) {
        $scope.pageIndexSongLiked = index
        $http({
            method: 'get',
            url: '/Liked/GetLikedSong',
            params: { pageIndex: index, pageSize: $scope.pageSizeSongLiked }
        }).then(function (response) {
            $scope.songsLiked = response.data.songs
            $scope.totalCountSongLiked = response.data.totalCount
            $scope.loadSongSuccessfullSongLiked = true
            $scope.isGetSongsofSongLiked = true
        }, function (error) {
            alert('Failed to get the songs!')
        })
    }

    //Get likedAlbum
    $scope.albumsLiked = []
    $scope.totalCountAlbumLiked = 0
    $scope.pageSizeAlbumLiked = 24
    $scope.maxSizeAlbumLiked = 5
    $scope.pageIndexAlbumLiked = 1
    $scope.loadAlbumSuccessfullAlbumLiked = false // Dùng cho ẩn hiện phần loading item

    // Nếu lấy dữ liệu rồi (khi click vào tabs đó rồi) thì ko cần lấy lại dư liệu nữa
    $scope.isGetAlbumLiked = false
    $scope.getAlbumLiked = function () {
        if (!$scope.isGetAlbumLiked) {
            getResultsPageAlbumLiked(1)
        }
    }

    $scope.pageChangedAlbumLiked = function (newPage) {
        getResultsPageAlbumLiked(newPage);
    };

    $scope.getAlbumLiked()

    function getResultsPageAlbumLiked(index) {
        $scope.pageIndexAlbumLiked = index
        $http({
            method: 'get',
            url: '/Liked/GetAlbumsLiked',
            params: { pageIndex: index, pageSize: $scope.pageSizeAlbumLiked }
        }).then(function (response) {
            $scope.albumsLiked = response.data.albums
            $scope.totalCountAlbumLiked = response.data.totalCount
            $scope.loadAlbumSuccessfullAlbumLiked = true
            $scope.isGetSongsofAlbumLiked = true
        }, function (error) {
            alert('Failed to get the albums!')
        })
    }

    //Get likedPlaylist
    $scope.playlistsLiked = []
    $scope.totalCountPlaylistLiked = 0
    $scope.pageSizePlaylistLiked = 24
    $scope.maxSizePlaylistLiked = 5
    $scope.pageIndexPlaylistLiked = 1
    $scope.loadAlbumSuccessfullPlaylistLiked = false // Dùng cho ẩn hiện phần loading item

    // Nếu lấy dữ liệu rồi (khi click vào tabs đó rồi) thì ko cần lấy lại dư liệu nữa
    $scope.isGetPlaylistLiked = false
    $scope.getPlaylistLiked = function () {
        if (!$scope.isGetPlaylistLiked) {
            getResultsPagePlaylistLiked(1)
        }
    }

    $scope.pageChangedPlaylistLiked = function (newPage) {
        getResultsPagePlaylistLiked(newPage);
    };

    $scope.getPlaylistLiked()

    function getResultsPagePlaylistLiked(index) {
        $scope.pageIndexPlaylistLiked = index
        $http({
            method: 'get',
            url: '/Liked/GetPlaylistsLiked',
            params: { pageIndex: index, pageSize: $scope.pageSizePlaylistLiked }
        }).then(function (response) {
            $scope.playlistsLiked = response.data.playlists
            $scope.totalCountPlaylistLiked = response.data.totalCount
            $scope.loadAlbumSuccessfullPlaylistLiked = true
            $scope.isGetSongsofPlaylistLiked = true
        }, function (error) {
            alert('Failed to get the playlist!')
        })
    }
})