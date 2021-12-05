appMusic.controller('Top100Controller', function ($scope, $rootScope, $routeParams, $location, $http, $window) {
    $rootScope.currentIndex = 3
    $rootScope.currentSubIndex = 6
    $rootScope.title = "Top 100"
    $scope.songs = []

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

    $http({
        method: 'get',
        url: 'Top100/GetTop100Songs',
        params: { collectionID: $routeParams.col, nation: $routeParams.n}
    }).then(function (res) {
        $scope.songs = res.data
    }, function (err) {
        alert('Failed to get songs!')
    })
})
