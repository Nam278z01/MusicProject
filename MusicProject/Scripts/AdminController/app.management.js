var appMusic = angular.module("AppMusic", ['ngSanitize', 'ngTable', 'ui.select', 'ngFileUpload']);

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

appMusic.filter('propsFilter', function () {
    return function (items, props) {
        var out = [];

        if (angular.isArray(items)) {
            var keys = Object.keys(props);

            items.forEach(function (item) {
                var itemMatches = false;

                for (var i = 0; i < keys.length; i++) {
                    var prop = keys[i];
                    var text = props[prop].toLowerCase();
                    if (item[prop].toString().toLowerCase().indexOf(text) !== -1) {
                        itemMatches = true;
                        break;
                    }
                }

                if (itemMatches) {
                    out.push(item);
                }
            });
        } else {
            // Let the output be the input untouched
            out = items;
        }
        return out;
    };
});

appMusic.run(function ($rootScope, $http, $window, $location) {
    $rootScope.snackbarContent = "Hello!"
    var myTimeout
    $rootScope.showSnackbar = function (content, kind) {
        $rootScope.snackbarContent = content
        let snackbar = $('#snackbar')
        if (kind == 'error') {
            snackbar.css({ 'background-color': '#F44336' })
            snackbar.css({ 'background-image': 'unset' })
        } else if (kind == 'success') {
            snackbar.css({ 'background-image': 'linear-gradient(to right, #2F80ED, #00AEEF)' })
            snackbar.css({ 'background-color': 'unset' })
        } else if (kind == 'warning') {
            snackbar.css({ 'background-image': 'linear-gradient(45deg, #F2AF12 0%, #FFD200 100%)' })
            snackbar.css({ 'background-color': 'unset' })
        } else {
            snackbar.css({ 'background-color': 'rgba(24, 34, 45, 1)' })
            snackbar.css({ 'background-image': 'unset' })
        }
        if (snackbar.hasClass('show')) {
            snackbar.removeClass('show')
            setTimeout(function () {
                clearTimeout(myTimeout)
                snackbar.addClass('show')
                myTimeout = setTimeout(function () {
                    snackbar.removeClass('show')
                }, 3000);
            }, 100);
        } else {
            snackbar.addClass('show')
            myTimeout = setTimeout(function () {
                snackbar.removeClass('show')
            }, 3000);
        }
    }
    //Như tab controls ấy
    $rootScope.currentIndex = -1
    $rootScope.currentSubIndex = -1
    $rootScope.isActiveNav = function (index) {
        return index == $rootScope.currentIndex
    }
    $rootScope.isActiveSubNav = function (index) {
        return index == $rootScope.currentSubIndex
    }

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

