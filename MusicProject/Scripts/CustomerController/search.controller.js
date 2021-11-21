

appMusic.controller('SearchController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.title = 'Tìm kiếm bài hát, playlist, album và nghệ sĩ'
    $rootScope.currentIndex = 0
    $rootScope.currentSubIndex = -1
    $scope.searchValue = $routeParams.q || ''
    $scope.name = {
        song: 'bai-hat',
        playlist: 'playlist',
        album: 'album',
        artist: 'nghe-si'
    }
    if ($scope.searchValue) {
        $scope.isChange = true
    } else {
        $scope.isChange = false
    }

    $scope.searchInput = function (name) {
        if ($scope.searchValue && $scope.isChange) {
            $location.path('/tim-kiem/' + name).search({ q: $scope.searchValue, page: 1 })
        }
    }

    $scope.changeInput = function () {
        if ($scope.searchValue) {
            $scope.isChange = true
        } else {
            $scope.isChange = false
        }
    }

    $scope.deleteInput = function () {
        $location.path('/tim-kiem')
        $location.search({ q: null, page: null })
        $scope.searchValue = ''
        $scope.isChange = false
    }
})

appMusic.controller('SongSearchController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.title = $routeParams.q + " | Bài hát hay nhất " + $routeParams.q
    $rootScope.currentSubIndex = 1

    $scope.songs = []
    $scope.totalCount = 0
    $scope.pageSize = 5
    $scope.maxSize = 5
    $scope.pageIndex = $routeParams.page || 1

    getResultsPage($scope.pageIndex)

    $scope.pageChanged = function (newPage) {
        $location.path('/tim-kiem/bai-hat').search("page", newPage)
        getResultsPage(newPage);
    };

    function getResultsPage(index) {
        $scope.pageIndex = index
        $http({
            method: 'get',
            url: './assets/js/dataSong.json'
        }).then(function (res) {
            $scope.songs = res.data.songs
            $scope.totalCount = res.data.totalCount
        }, function (err) {
            alert("Failed to get collections!")
        })
    }

    $scope.playMusic = function (song) {
        $rootScope.song = song
    }
})