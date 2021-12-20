var appMusic = angular.module("AppMusic", ['angularUtils.directives.dirPagination', 'ngSanitize']);

appMusic.filter("jsDate", function () {
    return function (x) {
        return x.replace('/Date(', '').replace(')/', '');
    };
});

appMusic.filter("cvNation", function () {
    return function (x) {
        if (x == 1) {
            return 'Việt Nam'
        } else if (x == 2) {
            return 'Âu Mỹ'
        } else {
            return 'Châu Á'
        }
    };
});

appMusic.run(function ($rootScope, $http, $window, $location) {
    // Đăng xuất 
    $rootScope.Logout = function () {
        $http({
            method: 'get',
            url: '/Administrator/Login/Logout'
        }).then(function (res) {
            $window.location.reload()
        }, function (err) {
            alert('Failed to logout!')
        })
    }

    $rootScope.create_UUID = function () {
        var dt = new Date().getTime();
        var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
            var r = (dt + Math.random() * 16) % 16 | 0;
            dt = Math.floor(dt / 16);
            return (c == 'x' ? r : (r & 0x3 | 0x8)).toString(16);
        });
        return uuid;
    }
})

