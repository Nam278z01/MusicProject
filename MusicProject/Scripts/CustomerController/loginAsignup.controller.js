appMusic.controller('LoginController', function ($scope, $rootScope, $http, $window) {
    $scope.isLoginSubmit = true // Được sử dụng hiển thị thông báo tài khoản không chính xác khi ấn submit

    // Đăng nhập
    let LoginObj = {}
    $scope.loginSubmit = function () {
        LoginObj.AccountName = $scope.EmailLogin
        LoginObj.Password = $scope.PassLogin
        $http({
            method: 'post',
            url: '/Login/Login',
            data: LoginObj
        }).then(function (res) {
            // Phải reload nha
            if (res.data.login == "1") {
                $window.location.reload();
            } else {
                $scope.isLoginSubmit = false
            }
        }, function (err) {
            alert('Failed to get Account!')
        })
    }

    // Đăng xuất 
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


    let sidebarSetting = document.querySelector('.sidebar__setting')
    document.body.addEventListener('click', function (e) {
        if (e.target.closest('.sidebar__setting') == null && e.target.closest('.sidebar__btn-setting') == null) {
            sidebarSetting.classList.remove('show')
        }
        if (e.target.closest('.sidebar__btn-setting')) {
            sidebarSetting.classList.toggle('show')
        }
    })
})