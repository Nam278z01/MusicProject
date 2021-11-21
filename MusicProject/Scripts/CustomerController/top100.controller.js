appMusic.controller('Top100Controller', function ($scope, $rootScope, $routeParams, $location) {
    $rootScope.currentIndex = 3
    $rootScope.currentSubIndex = 6
    $rootScope.title = "Top 100"

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
})