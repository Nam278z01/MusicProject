appMusic.controller('ListenedController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.currentIndex = 7
    $rootScope.title = "Đã nghe | My music"

    $scope.isActiveNav = 1
    $scope.activeNav = function (index) {
        $scope.isActiveNav = index
    }
    $scope.checkActiveNav = function (index) {
        return $scope.isActiveNav == index
    }
})
