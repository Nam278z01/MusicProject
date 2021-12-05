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
            templateUrl: "../../assets/html/detail_playlistadmin.html",
            controller: "PlaylistADetailsController"
        })
        .when("/chi-tiet/playlistnd", {
            templateUrl: "../../assets/html/detail_playlistuser.html",
            controller: "PlaylistUDetailsController"
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
    $rootScope.playlistsforAdd = []

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

            //Lấy danh sách playlist để thêm bài hát vào playlist
            $http({
                method: 'get',
                url: '/MyPlaylist/GetPlaylistsUserBySong'
            }).then(function (res) {
                $rootScope.playlistsforAdd = res.data
            }, function (err) {
                alert('Adding song to playlist failed!')
            })

        } else {
            // Login - SignIn
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
            })
        }
    }, function (err) {
        alert('Failed to get Account!')
    })

    //Thay đổi url thì cuộn lên đầu
    $rootScope.$on('$routeChangeStart', function (event, next, current) {
        $window.scrollTo(0, 0);
    })

    //Lấy danh sách colletion cho trang tuyển tập
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

    //Lấy để repeat loading
    $rootScope.getTimes = function (n) {
        return new Array(n);
    }  
    //repeat n lần loading
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

    //Thêm playlist trên giao diện
    let scrollTop2
    let modal2 = document.querySelector('#playlist')
    document.body.addEventListener('click', function (e) {
        if (e.target.classList.contains('modal__body') || e.target.closest('.btn-close-form')) {
            document.body.classList.remove('no-scroll')
            document.querySelector('html').scrollTop = scrollTop2
            document.body.style.top = '0px'
            modal2.style.display = 'none'
        }
        if (e.target.closest('.btn-add-song-playlist')) {
            modal2.style.display = 'block'
            // Ẩn thanh cuộn và giữ vị trí
            scrollTop2 = document.querySelector('html').scrollTop
            document.body.classList.add('no-scroll')
            document.body.style.top = -scrollTop2 + 'px'
        }
    })
    //click thanh 3 chấm thì hiện chức năng 
    document.body.addEventListener('click', function (e) {
        let featureMore = document.querySelectorAll('.list-playlist__item-feature')
        if (featureMore) {
            featureMore.forEach(ele => {
                ele.classList.remove('focus')
            })
        }
        let featureMore2 = document.querySelectorAll('.song')
        if (featureMore2) {
            featureMore2.forEach(ele => {
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
        if (e.target.closest('.song__more')) {
            e.target.closest('.song__more').parentElement.classList.toggle('focus')
        }
    })

    //Lấy bài hát để thêm vào playlist
    $rootScope.songIDforAdd
    $rootScope.getSongforAdd = function (song) {
        $rootScope.songIDforAdd = song.Song.SongID
    }
    //Thêm bài hát vào playlist
    $rootScope.addSongtoPlaylist = function (songID, playlistID) {
        $http({
            method: 'post',
            url: '/MyPlaylist/AddSongtoPlaylist',
            datatype: 'json',
            data: { songID: songID, playlistID: playlistID }
        }).then(function (res) {
            if (!res.data) {
                alert("Successfully added song to playlist!")
            } else {
                alert("Adding song to playlist failed!")
            }
        }, function () {
            alert("Adding song to playlist failed!")
        })
    }

    //Test
    $rootScope.testAlert = function (n) {
        alert("hehe")
    }
})
