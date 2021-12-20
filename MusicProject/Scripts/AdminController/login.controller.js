var appMusic = angular.module("AppMusic", []);

appMusic.controller('LoginController', function ($scope, $rootScope, $http, $window) {
    // Đăng nhập
    $rootScope.Admins = null;
    $rootScope.AN = "";
    $rootScope.PW = "";
    $rootScope.quyenad = "";
    $rootScope.quyenus = "";
    let LoginObj = {}
    $rootScope.Login = function () {
        LoginObj.AccountName = $scope.AccountName
        LoginObj.Password = $scope.Password
        console.log(LoginObj)
        $http({
            method: 'post',
            url: '/Administrator/Login/Login',
            data: LoginObj
        }).then(function (res) {
            if (res.data) {
                $window.location.href = '/Administrator/DashBoard/Index'
            }
            else {
                $rootScope.AN = "";
                $rootScope.PW = "";
                alert("tai khoan admin khong dung!");
                $rootScope.Admins = res.data;
                if (d.data.Role == "admin") {
                    $rootScope.quyenad = "";
                    $rootScope.quyenus = "Không quyền";
                }
                else {
                    $rootScope.quyenad = "Không quyền";
                    $rootScope.quyenus = "";
                }
            }
        }, function (err) {
            alert("Failed to get account!")
        })
    }
})
