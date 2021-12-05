appMusic.controller('MyPlaylistController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.currentIndex = 5
    $rootScope.currentSubIndex = -1
    $rootScope.title = "My Playlist"
   
    $rootScope.currentIndex = 2
    $rootScope.currentSubIndex = 2
    $scope.playlists = []
    $scope.totalCount = 0
    $scope.pageSize = 24
    $scope.maxSize = 5
    $scope.pageIndex = $routeParams.page || 1
    $scope.loadSongSuccessfull = false

    getResultsPage($scope.pageIndex)

    $scope.pageChanged = function (newPage) {
        getResultsPage(newPage);
        $location.search("page", newPage)
    };

    function getResultsPage(index) {
        $scope.pageIndex = index
        $http({
            method: 'get',
            url: '/MyPlaylist/GetPlaylistUsers',
            params: { pageIndex: $scope.pageIndex, pageSize: $scope.pageSize }
        }).then(function (response) {
            $scope.playlistUsers = response.data.playlistUsers
            $scope.totalCount = response.data.totalCount
            $scope.loadSongSuccessfull = true
        }, function (error) {
            alert('Failed to get the playlist!')
        })
    }
})