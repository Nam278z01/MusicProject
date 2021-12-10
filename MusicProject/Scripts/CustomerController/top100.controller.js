appMusic.controller('Top100Controller', function ($scope, $rootScope, $routeParams, $location, $http, $window) {
    $rootScope.title = "Top 100 | My music"
    $rootScope.currentIndex = 3
    $rootScope.currentSubIndex = 6

    // Tab controlls ấy
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

    //Lây về dữ liệu top 100
    $scope.songsTop100 = []
    $http({
        method: 'get',
        url: 'Top100/GetTop100Songs',
        params: { collectionID: $routeParams.col, nation: $routeParams.n}
    }).then(function (res) {
        $scope.songsTop100 = res.data
    }, function (err) {
        alert('Failed to get songs!')
    })
})
