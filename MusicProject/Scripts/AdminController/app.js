var appMusic = angular.module("AppMusic", []);

appMusic.run(function ($rootScope, $http, $window, $location) {
    // Đăng xuất 
    $rootScope.Logout = function () {
        $http({
            method: 'get',
            url: '/Admin/Login/Logout'
        }).then(function (res) {
            $window.location.reload();
        }, function (err) {
            alert('Failed to logout!')
        })
    }
})

