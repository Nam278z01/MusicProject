appMusic.controller('LoginController', function ($scope, $rootScope, $http, $window) {
    $scope.isLoginSubmit = true

    $scope.loginSubmit = function () {
        $http({
            method: 'get',
            url: '/Login/Login',
            params: { accountname: $scope.EmailLogin, password: $scope.PassLogin}
        }).then(function (res) {
            if (res.data.login == "1") {
                $window.location.reload();
            } else {
                $scope.isLoginSubmit = false
            }
        }, function (err) {
            alert('Failed to get Account!')
        })
    }

    $scope.Logout = function () {
        $http({
            method: 'get',
            url: '/Login/Logout'
        }).then(function (res) {
            if (res.data.login == "0") {
                $window.location.reload();
            } else {
                alert('Failed to logout!')
            }
        }, function (err) {
            alert('Failed to logout!')
        })
    }
})