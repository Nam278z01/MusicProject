var appMusic = angular.module("AppMusic", ['angularUtils.directives.dirPagination', 'ngRoute', 'ngSanitize']);

appMusic.config(function ($routeProvider, $locationProvider) {
    $routeProvider
        .when("/", {
            templateUrl: "../../assets/html/N_home.html",
            controller: "HomeController"
        })
        .when("/kham-pha/bai-hat", {
            templateUrl: "../../assets/html/A_discovery_song.html",
            controller: "DiscoveryController"
        })
        .when("/kham-pha/playlist", {
            templateUrl: "../../assets/html/A_discovery_playlist.html",
            controller: "DiscoveryController"
        })
        .when("/kham-pha/album", {
            templateUrl: "../../assets/html/A_discovery_album.html",
            controller: "DiscoveryController"
        })
        .when("/kham-pha/nghe-si", {
            templateUrl: "../../assets/html/A_discovery_artist.html",
            controller: "DiscoveryController"
        })
        .when("/tim-kiem", {
            templateUrl: "../../assets/html/N_search.html",
            controller: "SearchController"
        })
        .when("/tim-kiem/bai-hat", {
            templateUrl: "../../assets/html/search_song.html",
            controller: "SearchController"
        })
        .when("/tim-kiem/playlist", {
            templateUrl: "../../assets/html/search_playlist.html",
            controller: "SearchController"
        })
        .when("/tim-kiem/album", {
            templateUrl: "../../assets/html/search_album.html",
            controller: "SearchController"
        })
        .when("/tim-kiem/nghe-si", {
            templateUrl: "../../assets/html/search_artist.html",
            controller: "SearchController"
        })
        .when("/tuyen-tap", {
            templateUrl: "../../assets/html/N_collection.html",
            controller: "CollectionController"
        })
        .when("/top-100", {
            templateUrl: "../../assets/html/N_top100.html",
            controller: "Top100Controller"
        })
        .when("/my-playlist", {
            templateUrl: "../../assets/html/T_myplaylist.html",
            controller: "MyPlaylistController"
        })
        .when("/nguoi-dung", {
            templateUrl: "../../assets/html/T_user.html",
            controller: "UserController"
        })
        .when("/da-thich/bai-hat", {
            templateUrl: "../../assets/html/T_liked.html",
            controller: "SongLikedController",
        })
        .when("/da-thich/playlist", {
            templateUrl: "../../assets/html/liked_playlist.html",
            controller: "PlaylistLikedController"
        })
        .when("/da-thich/album", {
            templateUrl: "../../assets/html/liked_album.html",
            controller: "AlbumLikedController"
        })
        .when("/da-nghe/bai-hat", {
            templateUrl: "../../assets/html/T_listened.html",
            controller: "SongListenedController"
        })
        .when("/da-nghe/playlist", {
            templateUrl: "../../assets/html/listened_playlist.html",
            controller: "PlaylistListenedController"
        })
        .when("/da-nghe/album", {
            templateUrl: "../../assets/html/listened_album.html",
            controller: "AlbumListenedController"
        })
        .when("/bang-xep-hang", {
            templateUrl: "../../assets/html/rank.html",
            controller: "RankController"
        })
        .when("/chi-tiet/bai-hat", {
            templateUrl: "../../assets/html/detail_song.html",
            controller: "SongDetailsController"
        })
        .when("/chi-tiet/playlistad", {
            templateUrl: "../../assets/html/detail_playlist.html",
            controller: "PlaylistADetailsController"
        })
        .when("/chi-tiet/playlistnd", {
            templateUrl: "../../assets/html/detail_playlist.html",
            controller: "PlaylistADetailsController"
        })
        .when("/chi-tiet/album", {
            templateUrl: "../../assets/html/detail_album.html",
            controller: "AlbumDetailsController"
        })
        .when("/chi-tiet/nghe-si", {
            templateUrl: "../../assets/html/detail_artist.html",
            controller: "ArtistDetailsController"
        })
        .when("/nang-cap", {
            templateUrl: "../../assets/html/upgrade.html",
            controller: "UpgradeController"
        })
        .otherwise({
            redirect: '/'
        })
});

appMusic.run(function ($rootScope, $http, $window, $location) {
    $rootScope.title = 'My Music | Nghe nhạc Hot, tải nhạc Hay'
    $rootScope.User = {}
    $rootScope.UserVip = false
    $rootScope.currentIndex = 1
    $rootScope.currentSubIndex = -1
    $rootScope.songIsPlayed = {}
    $rootScope.logged = false
    $rootScope.song = {}

    $http({
        method: 'get',
        url: '/Login/CheckLogin'
    }).then(function (res) {
        if (res.data.login == "1") {
            $rootScope.User = res.data
            $rootScope.logged = true
            $rootScope.UserVip = ($rootScope.User.user.DueOn || $rootScope.User.user.DueOn > new Date()) ? true : false
            document.querySelector('#modal-login-singup').remove()
            document.querySelector('.signin-singup').remove()
        } else {
            let btnLogin = document.querySelector('#showlogin')
            let btnSignUp = document.querySelector('#showsignup')
            let modalLoginSignUp = document.querySelector('#modal-login-singup')
            let loginForm = document.querySelector('#loginForm')
            let SignUpForm = document.querySelector('#registerForm')
            let body = document.body
            let scrollTop
            let isLogin = true
            btnLogin.onclick = () => {
                modalLoginSignUp.style.display = 'block'
                loginForm.style.display = 'block'
                // Ẩn thanh cuộn và giữ vị trí
                scrollTop = document.querySelector('html').scrollTop
                body.classList.add('no-scroll')
                body.style.top = -scrollTop + 'px'
                isLogin = true
            }
            btnSignUp.onclick = () => {
                modalLoginSignUp.style.display = 'block'
                SignUpForm.style.display = 'block'
                // Ẩn thanh cuộn và giữ vị trí
                scrollTop = document.querySelector('html').scrollTop
                body.classList.add('no-scroll')
                body.style.top = -scrollTop + 'px'
                isLogin = false
            }
            body.addEventListener('click', function (e) {
                if (e.target.classList.contains('modal__body') || e.target.closest('.auth-form__controls-back')) {
                    console.log(e.target.closest('.auth-form__controls-back'), e.target)
                    document.body.classList.remove('no-scroll')
                    document.querySelector('html').scrollTop = scrollTop
                    body.style.top = '0px'
                    modalLoginSignUp.style.display = 'none'
                    SignUpForm.style.display = 'none'
                    loginForm.style.display = 'none'
                }
                if (e.target.closest('.auth-form__switch-btn')) {
                    if (isLogin) {
                        loginForm.style.display = 'none'
                        SignUpForm.style.display = 'block'
                    } else {
                        loginForm.style.display = 'block'
                        SignUpForm.style.display = 'none'
                    }
                    isLogin = !isLogin
                }
            })

            var restrictedPage = $.inArray($location.path(), ['/my-playlist', '/nguoi-dung', '/da-thich/bai-hat', '/da-thich/playlist', '/da-thich/album', '/da-nghe/playlist', '/da-nghe/bai-hat', '/da-thich/album']) != -1;
            if (restrictedPage) {
                $location.path('/')
            }

            $rootScope.$on('$routeChangeStart', function (event, next, current) {
                var restrictedPage = $.inArray($location.path(), ['/my-playlist', '/nguoi-dung', '/da-thich/bai-hat', '/da-thich/playlist', '/da-thich/album', '/da-nghe/playlist', '/da-nghe/bai-hat', '/da-thich/album']) != -1;
                if (restrictedPage) {
                    event.preventDefault()
                    $location.path('/')
                }
                $window.scrollTo(0, 0);
            })
        }
    }, function (err) {
        alert('Failed to get Account!')
    })

    $rootScope.collections = []
    $http({
        method: 'get',
        url: '/Collection/GetCollections'
    }).then(function (res) {
        $rootScope.collections = res.data
    }, function (err) {
        alert("Failed to get collections!")
    })

    $window.addEventListener('load', function () {
        let loading = document.querySelector('.loading')
        loading.classList.add('hidden')
        loading.addEventListener('animationend', function () {
            this.style.display = 'none'
        })
    })


    $rootScope.getTimes = function (n) {
        return new Array(n);
    }  

    $rootScope.eleView

    if (window.innerWidth < 740) {
        $rootScope.eleView = 2
    } else if (window.innerWidth < 1113) {
        $rootScope.eleView = 4
    } else if (window.innerWidth < 1800) {
        $rootScope.eleView = 5
    } else {
        $rootScope.eleView = 6
    }
    $window.addEventListener('resize', () => {
        if (window.innerWidth < 740) {
            $rootScope.eleView = 2
        } else if (window.innerWidth < 1113) {
            $rootScope.eleView = 4
        } else if (window.innerWidth < 1800) {
            $rootScope.eleView = 5
        } else {
            $rootScope.eleView = 6
        }
    })
    document.body.addEventListener('click', function (e) {
        let featureMore = document.querySelectorAll('.list-playlist__item-feature')
        if (featureMore) {
            featureMore.forEach(ele => {
                ele.classList.remove('focus')
            })
        }
        //if (e.target.closest('.list-playlist__item') == null) {
        //    let featureMore = document.querySelectorAll('.list-playlist__item-feature')
        //    if (featureMore) {
        //        featureMore.forEach(ele =>{
        //            ele.classList.remove('focus')
        //        })
        //    }
        //}
        if (e.target.closest('.btn--more')) {
            e.target.closest('.btn--more').parentElement.classList.toggle('focus')
        }
    })

    $rootScope.testAlert = function (n) {
        alert("hehe")
    }
})
