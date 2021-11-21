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
})

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