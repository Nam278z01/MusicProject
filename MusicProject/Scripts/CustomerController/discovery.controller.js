appMusic.controller('DiscoveryController', function ($scope, $rootScope, $routeParams, $location) {
    $rootScope.currentIndex = 2
    // $rootScope.currentSubIndex = 1
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
    $rootScope.currentIndex = 2
    $rootScope.currentSubIndex = 1
    $scope.songs = []
    $scope.totalCount = 0
    $scope.pageSize = 24
    $scope.maxSize = 5
    $scope.pageIndex = $routeParams.page || 1

    getResultsPage($scope.pageIndex)

    $scope.pageChanged = function (newPage) {
        getResultsPage(newPage);
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
        }, function (error) {
            alert('Failed to get the songs!')
        })
    }

    $scope.playMusic = function (song) {
        $rootScope.song = song
        document.querySelector('.play-music').classList.remove('hidden')
    }
})

appMusic.controller('PlaylistDiscoveryController', function ($scope, $rootScope, $http, $location, $routeParams) {
    $rootScope.currentIndex = 2
    $rootScope.currentSubIndex = 2
    $scope.playlists = []
    $scope.totalCount = 0
    $scope.pageSize = 24
    $scope.maxSize = 5
    $scope.pageIndex = $routeParams.page || 1

    getResultsPage($scope.pageIndex)

    $scope.pageChanged = function (newPage) {
        getResultsPage(newPage);
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
        }, function (error) {
            alert('Failed to get the playlists!')
        })
    }
})

appMusic.controller('ArtistDiscoveryController', function ($scope, $rootScope, $http, $location, $routeParams) {
    $rootScope.currentIndex = 2
    $rootScope.currentSubIndex = 4
    $scope.artists = []
    $scope.totalCount = 0
    $scope.pageSize = 24
    $scope.maxSize = 5
    $scope.pageIndex = $routeParams.page || 1

    getResultsPage($scope.pageIndex)

    $scope.pageChanged = function (newPage) {
        getResultsPage(newPage);
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
        }, function (error) {
            alert('Failed to get the artists!')
        })
    }
})

appMusic.controller('AlbumDiscoveryController', function ($scope, $rootScope, $http, $location, $routeParams) {
    $rootScope.currentIndex = 2
    $rootScope.currentSubIndex = 4
    $scope.albums = []
    $scope.totalCount = 0
    $scope.pageSize = 24
    $scope.maxSize = 5
    $scope.pageIndex = $routeParams.page || 1

    getResultsPage($scope.pageIndex)

    $scope.pageChanged = function (newPage) {
        getResultsPage(newPage);
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
        }, function (error) {
            alert('Failed to get the albums!')
        })
    }
})