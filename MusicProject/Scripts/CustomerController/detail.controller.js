appMusic.controller('SongDetailsController', function ($scope, $rootScope, $http, $routeParams) {
    //Sidebar tab, tab con hoạt động tắt hết đi
    $rootScope.currentIndex = -1
    $rootScope.currentSubIndex = -1

    //Lấy về thông tin chi tiết bài hát
    $http({
        method: 'get',
        url: '/Detail/GetSong',
        params: { songID: $routeParams.song }
    }).then(function (response) {
        $scope.song = response.data
        $http({
            method: 'get',
            url: '/Detail/Get10SongsRandomCollection',
            params: { songID: $routeParams.song, collectionID: $scope.song.Collections[0].CollectionID }
        }).then(function (response) {
            $scope.songs = response.data
        }, function (error) {
            alert('Failed to get the songs!')
        })
        //start: Title
        $rootScope.title = $scope.song.Song.SongName + " | "
        var length = $scope.song.Artists.length
        for (var i = 0; i < length; i++) {
            $rootScope.title += $scope.song.Artists[i].ArtistName
            if (i != length - 1) {
                $rootScope.title += ", "
            }
        }
        $rootScope.title += " | MyMusic"
        //end: Title
    }, function (error) {
        alert('Failed to get the song!')
    })

    // Ẩn hiện phần lyric (hay rút ngắn - xem thêm lyric)
    $scope.isShorten = true
    $scope.titleShorten = "Xem thêm"
    $scope.seeMore = function () {
        $scope.isShorten = !$scope.isShorten
        if ($scope.isShorten) {
            $scope.titleShorten = "Xem thêm"

        } else {
            $scope.titleShorten = "Thu gọn"
        }
    }

    //Copy lyric bài hát
    function copyTextToClipboard(text) {
        var textArea = document.createElement("textarea");
        textArea.style.position = 'fixed';
        textArea.style.top = 0;
        textArea.style.left = 0;

        textArea.style.width = '2em';
        textArea.style.height = '2em';

        textArea.style.padding = 0;

        textArea.style.border = 'none';
        textArea.style.outline = 'none';
        textArea.style.boxShadow = 'none';

        textArea.style.background = 'transparent';

        textArea.value = text;

        document.body.appendChild(textArea);
        textArea.focus();
        textArea.select();

        document.body.removeChild(textArea);
    }

    var copyBtn = document.querySelector('.btn-copy')

    copyBtn.addEventListener('click', function (event) {
        let text = document.querySelector('.song-detail__lyric-script').textContent
        copyTextToClipboard(text);
    });
})

appMusic.controller('PlaylistADetailsController', function ($scope, $rootScope, $http, $routeParams) {
    //Sidebar tab, tab con hoạt động tắt hết đi
    $rootScope.currentIndex = -1
    $rootScope.currentSubIndex = -1

    // Lấy về thông tin chi tiết playlist admin (gồm bài hát của nó) và lấy về playlist cùng collection
    $http({
        method: 'get',
        url: '/Detail/GetPlaylistAdminwithSongs',
        params: { playlistID: $routeParams.id }
    }).then(function (response) {
        $scope.playlist = response.data.playlist
        $scope.playlists = response.data.playlists
        $rootScope.title = "Playlist | " + $scope.playlist.PlaylistAdmin.PlaylistName + " | MyMusic"
    }, function (error) {
        alert('Failed to get the playlist!')
    })
})

appMusic.controller('PlaylistUDetailsController', function ($scope, $rootScope, $http, $routeParams, $location) {
    //Sidebar tab, tab con hoạt động tắt hết đi
    $rootScope.currentIndex = -1
    $rootScope.currentSubIndex = -1

    // Lấy về thông tin chi tiết user (gồm bài hát của nó) và lấy về playlist cùng collection
    $http({
        method: 'get',
        url: '/Detail/GetPlaylistUserwithSongs',
        params: { playlistID: $routeParams.id }
    }).then(function (response) {
        if (response.data.access) {
            $scope.playlist = response.data.playlist
            $rootScope.title = "Playlist | " + $scope.playlist.PlaylistUser.PlaylistName + " | MyMusic"
        } else {
            $location.path('/')
        }
    }, function (error) {
        alert('Failed to get the playlist!')
    })
})

appMusic.controller('ArtistDetailsController', function ($scope, $rootScope, $http, $routeParams, $location) {
    //Sidebar tab, tab con hoạt động tắt hết đi
    $rootScope.currentIndex = -1
    $rootScope.currentSubIndex = -1

    // Artist gồm 3 phần trang chủ, bài hát, album, tạo cái này để làm như cái tabs control
    $scope.isActiveNav = 1
    $scope.activeNav = function (index) {
        $scope.isActiveNav = index
    }
    $scope.checkActiveNav = function (index) {
        return $scope.isActiveNav == index
    }

    //Get songs of artist
    $scope.songsofArtist = []
    $scope.totalCountArtist = 0
    $scope.pageSizeArtist = 24
    $scope.maxSizeArtist = 5
    $scope.pageIndexArtist = 1
    $scope.loadSongSuccessfullArtist = false // Dùng cho ẩn hiện phần loading item

    // Nếu lấy dữ liệu rồi (khi click vào tabs đó rồi) thì ko cần lấy lại dư liệu nữa
    $scope.isGetSongsofArtist = false
    $scope.getSongsofArtist = function () {
        if (!$scope.isGetSongsofArtist) {
            getResultsPageArtist(1)
        }
    }

    $scope.pageChangedArtist = function (newPage) {
        getResultsPageArtist(newPage);
    };

    function getResultsPageArtist(index) {
        $scope.pageIndexArtist = index
        $http({
            method: 'get',
            url: '/Detail/GetSongsByArtistPage',
            params: { pageIndex: index, pageSize: $scope.pageSizeArtist, artistID: $routeParams.id }
        }).then(function (response) {
            $scope.songsofArtist = response.data.songs
            $scope.totalCountArtist = response.data.totalCount
            $scope.loadSongSuccessfullArtist = true
            $scope.isGetSongsofArtist = true
        }, function (error) {
            alert('Failed to get the songs!')
        })
    }

    //Get album of artist
    $scope.albumsofArtist = []
    $scope.totalCountArtistAlbum = 0
    $scope.pageSizeArtistAlbum = 24
    $scope.maxSizeArtistAlbum = 5
    $scope.pageIndexArtistAlbum = 1
    $scope.loadSongSuccessfullArtistAlbum = false // Dùng cho ẩn hiện phần loading item

    // Nếu lấy dữ liệu rồi (khi click vào tabs đó rồi) thì ko cần lấy lại dư liệu nữa
    $scope.isGetSongsofArtistAlbum = false
    $scope.getSongsofArtistAlbum = function () {
        if (!$scope.isGetSongsofArtistAlbum) {
            getResultsPageArtistAlbum(1)
        }
    }

    $scope.pageChangedArtistAlbum = function (newPage) {
        getResultsPageArtistAlbum(newPage);
    };

    function getResultsPageArtistAlbum(index) {
        $scope.pageIndexArtistAlbum = index
        $http({
            method: 'get',
            url: '/Detail/GetAlbumsByArtist',
            params: { pageIndex: index, pageSize: $scope.pageSizeArtistAlbum, artistID: $routeParams.id }
        }).then(function (response) {
            $scope.albumsofArtist = response.data.albums
            $scope.totalCountArtistAlbum = response.data.totalCount
            $scope.loadSongSuccessfullArtistAlbum = true
            $scope.isGetSongsofArtistAlbum = true
        }, function (error) {
            alert('Failed to get the albums!')
        })
    }
})

appMusic.controller('AlbumDetailsController', function ($scope, $rootScope, $http, $routeParams) {
    $http({
        method: 'get',
        url: '/Detail/GetAlbumDetail',
        params: { albumID: $routeParams.id }
    }).then(function (res) {
        $scope.album = JSON.parse(res.data)
        console.log($scope.album)
    }, function (err) {
        alert("Failed to get album!")
    })
})