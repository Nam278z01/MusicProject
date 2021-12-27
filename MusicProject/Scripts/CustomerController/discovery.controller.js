appMusic.controller('DiscoveryController', function ($scope, $rootScope, $routeParams, $location) {
    //Sidebar tab hoạt động là khám phá
    $rootScope.currentIndex = 2

    // Tab controls hết nha nha
    $scope.isActiveNav = function (name) {
        if ($routeParams.n == name) {
            return true
        } else {
            return false
        }
    }

    $scope.isActiveCollection = function (colId) {
        if ($routeParams.col == colId) {
            return true
        } else {
            return false
        }
    }

    $scope.isGenderorisBand = function (g) {
        if ($routeParams.g == g) {
            return true
        } else {
            return false
        }
    }
    $scope.changeGenderorisBand = function (g) {
        $location.search('g', g)
    }
})

appMusic.controller('SongDiscoveryController', function ($scope, $rootScope, $http, $location, $routeParams) {
    $rootScope.title = 'Bài hát | My music'
     //Sidebar tab con hoạt động là bài hát
    $rootScope.currentSubIndex = 1

    //Lấy về danh sách bài hát phân trang
    $scope.songs = []
    $scope.totalCount = 0
    $scope.pageSize = 10
    $scope.maxSize = 5
    $scope.pageIndex = $routeParams.page || 1
    $scope.loadSongSuccessfull = false // Vẫn là phục vụ ẩn hiện loading item

    // Vì tab hot không có params nên làm vậy để lấy đc dữ liệu mong muốn
    if ($routeParams.col && $routeParams.n) {
        getResultsPage($scope.pageIndex)
    } else {
        getResultsPage2($scope.pageIndex)
    }

    $scope.pageChanged = function (newPage) {
        $location.search("page", newPage)
    };

    function getResultsPage(index) {
        $scope.pageIndex = index
        $http({
            method: 'get',
            url: '/Discovery/GetSongsPage',
            params: { pageIndex: $scope.pageIndex, pageSize: $scope.pageSize, collectionID: $routeParams.col, nation: $routeParams.n}
        }).then(function (response) {
            $scope.songs = response.data.songs
            $scope.totalCount = response.data.totalCount
            $scope.loadSongSuccessfull = true
        }, function (error) {
            alert('Failed to get the songs!')
        })
    }

    // Lấy dữ liệu tab hot
    function getResultsPage2(index) {
        $scope.pageIndex = index
        $http({
            method: 'get',
            url: '/Discovery/GetSongsNewAHot',
            params: { pageIndex: $scope.pageIndex, pageSize: $scope.pageSize }
        }).then(function (response) {
            $scope.songs = response.data.songs
            $scope.totalCount = response.data.totalCount
            $scope.loadSongSuccessfull = true
        }, function (error) {
            alert('Failed to get the songs!')
        })
    }
})

appMusic.controller('PlaylistDiscoveryController', function ($scope, $rootScope, $http, $location, $routeParams) {
    $rootScope.title = 'Playlist | My music'
    //Sidebar tab con hoạt động là playlist
    $rootScope.currentSubIndex = 2

    //Lấy về playlist list phân trang
    $scope.playlists = []
    $scope.totalCount = 0
    $scope.pageSize = 24
    $scope.maxSize = 5
    $scope.pageIndex = $routeParams.page || 1
    $scope.loadSongSuccessfull = false

    getResultsPage($scope.pageIndex)

    $scope.pageChanged = function (newPage) {
        $location.search("page", newPage)
    };

    function getResultsPage(index) {
        $scope.pageIndex = index
        $http({
            method: 'get',
            url: '/Discovery/GetPlaylistAdminsPage',
            params: { pageIndex: $scope.pageIndex, pageSize: $scope.pageSize, collectionID: $routeParams.col}
        }).then(function (response) {
            $scope.playlistAdmins = response.data.playlistAdmins
            $scope.totalCount = response.data.totalCount
            $scope.loadSongSuccessfull = true
        }, function (error) {
            alert('Failed to get the playlists!')
        })
    }
})

appMusic.controller('ArtistDiscoveryController', function ($scope, $rootScope, $http, $location, $routeParams) {
    $rootScope.title = 'Nghệ sĩ | My music'
    //Sidebar tab con hoạt động là artist
    $rootScope.currentSubIndex = 4

    //Lấy về danh sách nghệ sĩ
    $scope.artists = []
    $scope.totalCount = 0
    $scope.pageSize = 24
    $scope.maxSize = 5
    $scope.pageIndex = $routeParams.page || 1
    $scope.loadSongSuccessfull = false

    // Như bài hát thì nghệ sĩ có tab hot làm vậy để lấy dữ liệu mong muốn do trang hot ko có params
    if ($routeParams.n) {
        getResultsPage($scope.pageIndex)
    } else {
        getResultsPage2($scope.pageIndex)
    }

    $scope.pageChanged = function (newPage) {
        $location.search("page", newPage)
    };

    function getResultsPage(index) {
        $scope.pageIndex = index
        $http({
            method: 'get',
            url: '/Discovery/GetArtistsPage',
            params: { pageIndex: $scope.pageIndex, pageSize: $scope.pageSize, nation: $routeParams.n, genderorband: $routeParams.g }
        }).then(function (response) {
            $scope.artists = response.data.artists
            $scope.totalCount = response.data.totalCount
            $scope.loadSongSuccessfull = true
        }, function (error) {
            alert('Failed to get the artists!')
        })
    }

    // Đây chính là lấy dữ liệu tab hot
    function getResultsPage2(index) {
        $scope.pageIndex = index
        $http({
            method: 'get',
            url: '/Discovery/GetArtistsHot',
            params: { pageIndex: $scope.pageIndex, pageSize: $scope.pageSize, genderorband: $routeParams.g }
        }).then(function (response) {
            $scope.artists = response.data.artists
            $scope.totalCount = response.data.totalCount
            $scope.loadSongSuccessfull = true
        }, function (error) {
            alert('Failed to get the artists!')
        })
    }
})

appMusic.controller('AlbumDiscoveryController', function ($scope, $rootScope, $http, $location, $routeParams) {
    $rootScope.title = 'Album | My music'
    //Sidebar tab con hoạt động là album
    $rootScope.currentSubIndex = 3

    //Lấy về danh sách album
    $scope.albums = []
    $scope.totalCount = 0
    $scope.pageSize = 24
    $scope.maxSize = 5
    $scope.pageIndex = $routeParams.page || 1
    $scope.loadSongSuccessfull = false

    // Như tab nghệ sĩ và bài hát ấy
    if ($routeParams.n) {
        getResultsPage($scope.pageIndex)
    } else {
        getResultsPage2($scope.pageIndex)
    }

    $scope.pageChanged = function (newPage) {
        $location.search("page", newPage)
    };

    function getResultsPage(index) {
        $scope.pageIndex = index
        $http({
            method: 'get',
            url: '/Discovery/GetAlbumsPage',
            params: { pageIndex: $scope.pageIndex, pageSize: $scope.pageSize, nation: $routeParams.n }
        }).then(function (response) {
            $scope.albums = response.data.albums
            $scope.totalCount = response.data.totalCount
            $scope.loadSongSuccessfull = true
        }, function (error) {
            alert('Failed to get the albums!')
        })
    }

    //Lấy danh sách album hot và mới nè
    function getResultsPage2(index) {
        $scope.pageIndex = index
        $http({
            method: 'get',
            url: '/Discovery/GetAlbumsNewAHot',
            params: { pageIndex: $scope.pageIndex, pageSize: $scope.pageSize }
        }).then(function (response) {
            $scope.albums = response.data.albums
            $scope.totalCount = response.data.totalCount
            $scope.loadSongSuccessfull = true
        }, function (error) {
            alert('Failed to get the albums!')
        })
    }
})