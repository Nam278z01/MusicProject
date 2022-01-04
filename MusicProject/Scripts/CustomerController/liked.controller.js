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
})