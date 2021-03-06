var appMusic = angular.module("AppMusic", ['angularUtils.directives.dirPagination', 'ngRoute', 'ngSanitize', 'ngFileUpload']);

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
        .when("/da-thich", {
            templateUrl: "../../assets/html/T_liked.html",
            controller: "LikedController",
        })
        .when("/da-nghe", {
            templateUrl: "../../assets/html/T_listened.html",
            controller: "ListenedController"
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

appMusic.filter("jsDate", function () {
    return function (x) {
        return x.replace('/Date(', '').replace(')/', '');
    };
});

appMusic.filter("cvNation", function () {
    return function (x) {
        if (x == 1) {
            return 'Vi???t Nam'
        } else if (x == 2) {
            return '??u M???'
        } else {
            return 'Ch??u ??'
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
    $rootScope.title = 'My Music | Nghe nh???c Hot, t???i nh???c Hay'
    //Sidebar tab ho???t ?????ng l?? trang home
    $rootScope.currentIndex = 1
    //Sidebar tab con (c???a kh??m ph?? & nghe g?? h??m nay) ho???t ?????ng l?? trang home
    $rootScope.currentSubIndex = -1
    // Th??ng tin user
    $rootScope.User = {}
    //$rootScope.UserVip = false
    //Ki???m tra ????ng nh???p ch??a
    $rootScope.logged = false
    //Danh s??ch l???y playlist c???a t??i kho???n ????? th???c hi???n ch???c n??ng th??m song v??o playlist
    $rootScope.playlistsforAdd = []
    //Modal login
    let btnLogin = document.querySelector('#showlogin')

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

    $http({
        method: 'get',
        url: '/Login/CheckLogin'
    }).then(function (res) {
        //N???u ???? ????ng nh???p
        if (res.data.login == "1") {
            $rootScope.User = res.data
            $rootScope.logged = true
            //N???u thu???c tinh ng??y h???n > h??m nay th?? l?? t??i kho???n vip v?? ng?????c l???i
            //$rootScope.UserVip = ($rootScope.User.user.DueOn || $rootScope.User.user.DueOn > new Date()) ? true : false
            //Lo???i b??? giao di???n ????ng nh???p - ????ng k??
            document.querySelector('#modal-login-singup').remove()
            document.querySelector('.signin-singup').remove()

            //L???y danh s??ch playlist ????? th??m b??i h??t v??o playlist
            $http({
                method: 'get',
                url: '/MyPlaylist/GetPlaylistsUserBySong'
            }).then(function (res) {
                $rootScope.playlistsforAdd = res.data
            }, function (err) {
                alert('Adding song to playlist failed!')
            })
        //N???u ch??a ????ng nh???p
        } else {
            // Login - SignIn
            //let btnLogin = document.querySelector('#showlogin')
            let btnSignUp = document.querySelector('#showsignup')
            let modalLoginSignUp = document.querySelector('#modal-login-singup')
            let loginForm = document.querySelector('#loginForm')
            let SignUpForm = document.querySelector('#registerForm')
            let body = document.body
            let scrollTop
            let isLogin = true // C?? t??c d???ng ????? switch giao di???n ????ng nh???p ????ng k?? c???a s??? ki???n b??n d?????i

            //Hi???n giao di???n ????ng nh???p
            btnLogin.onclick = () => {
                modalLoginSignUp.style.display = 'block'
                loginForm.style.display = 'block'

                // ???n thanh cu???n v?? gi??? v??? tr??
                scrollTop = document.querySelector('html').scrollTop
                body.classList.add('no-scroll')
                body.style.top = -scrollTop + 'px'
                isLogin = true
            }
            //Hi???n giao di???n ????ng k??
            btnSignUp.onclick = () => {
                modalLoginSignUp.style.display = 'block'
                SignUpForm.style.display = 'block'

                // ???n thanh cu???n v?? gi??? v??? tr??
                scrollTop = document.querySelector('html').scrollTop
                body.classList.add('no-scroll')
                body.style.top = -scrollTop + 'px'
                isLogin = false
            }
            body.addEventListener('click', function (e) {
                // N???u click tr??ng th?? ???n modal, cho cu???n
                if (e.target.classList.contains('modal__body') || e.target.closest('.auth-form__controls-back')) {
                    document.body.classList.remove('no-scroll')
                    document.querySelector('html').scrollTop = scrollTop
                    body.style.top = '0px'

                    modalLoginSignUp.style.display = 'none'
                    SignUpForm.style.display = 'none'
                    loginForm.style.display = 'none'
                }
                //??o???n switch hi???n th??? ????ng nh???p v?? ????ng k?? ????y!
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

            // N???u ch??a ????ng nh???p m?? v??o c??c trang c???n quy???n c???a ng?????i d??ng nh???p nh???p th?? d???n v??? trang home
            var restrictedPage = $.inArray($location.path(), ['/my-playlist', '/nguoi-dung', '/da-thich', '/da-nghe']) != -1;
            if (restrictedPage) {
                $location.path('/')
                $location.search({})
            }
            // D??ng th??m c??i n??y v?? single page ko load, ko load th?? b???t s??? ki???n thay ?????i url ????? d???n v??? trang home n???u ch??a ????ng nh???p
            $rootScope.$on('$routeChangeStart', function (event, next, current) {
                var restrictedPage = $.inArray($location.path(), ['/my-playlist', '/nguoi-dung', '/da-thich', '/da-nghe']) != -1;
                if (restrictedPage) {
                    event.preventDefault()
                    $location.path('/')
                    $location.search({})
                }
            })
        }
    }, function (err) {
        alert('Failed to get Account!')
    })

    //Thay ?????i url th?? cu???n l??n ?????u
    $rootScope.$on('$routeChangeStart', function (event, next, current) {
        $window.scrollTo(0, 0);
    })

    //L???y danh s??ch colletion cho trang tuy???n t???p
    $rootScope.collections = []
    $http({
        method: 'get',
        url: '/Collection/GetCollections'
    }).then(function (res) {
        $rootScope.collections = res.data
    }, function (err) {
        alert("Failed to get collections!")
    })

    //N???u loading xong th?? ???n giao di???n load l??c m???i v??o trang ho???c reload trang
    $window.addEventListener('load', function () {
        let loading = document.querySelector('.loading')
        loading.classList.add('hidden')
        loading.addEventListener('animationend', function () {
            this.style.display = 'none'
        })
    })

    //L???y ????? repeat loading
    $rootScope.getTimes = function (n) {
        return new Array(n);
    }

    //repeat n l???n loading b??i h??t - playlist - album
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

    //Th??m v??o playlist tr??n giao di???n
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
            if ($rootScope.logged) {
                modal2.style.display = 'block'

                // ???n thanh cu???n v?? gi??? v??? tr??
                scrollTop2 = document.querySelector('html').scrollTop
                document.body.classList.add('no-scroll')
                document.body.style.top = -scrollTop2 + 'px'
            } else {
                btnLogin.click()
            }
        }
    })

    //click thanh 3 ch???m th?? hi???n ch???c n??ng 
    document.body.addEventListener('click', function (e) {
        //?????u ti??n khi click ta ???n h???t class focus khi click (focus l??m n???i giao di???n feature m???i item)
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
        if (e.target.closest('.show-rank')) {
            e.target.closest('.show-rank').parentElement.parentElement.classList.toggle('show')
        }
    })

    //L???y b??i h??t ????? th??m v??o playlist
    $rootScope.songIDforAdd
    $rootScope.getSongforAdd = function (song) {
        $rootScope.songIDforAdd = song.Song.SongID
    }

    //Th??m b??i h??t v??o playlist
    $rootScope.addSongtoPlaylist = function (songID, playlistID) {
        $http({
            method: 'post',
            url: '/MyPlaylist/AddSongtoPlaylist',
            datatype: 'json',
            data: { songID: songID, playlistID: playlistID }
        }).then(function (res) {
            if (!res.data) {
                $rootScope.showSnackbar('Th??m b??i h??t v??o playlist th??nh c??ng!')
            } else {
                $rootScope.showSnackbar('???? t???n t???i trong playlist n??y!')
            }
        }, function () {
            alert("Adding song to playlist failed!")
        })
    }

    $rootScope.LikeSong = function (s) {
        if ($rootScope.logged) {
            $http({
                method: 'post',
                url: '/Liked/LikeSong',
                datatype: 'json',
                data: { songID: s.Song.SongID }
            }).then(function (res) {
                if (!res.data) {
                    s.Liked = 1
                    $rootScope.showSnackbar('???? th??ch!')
                } else {
                    alert("Like the song failed!")
                }
            }, function () {
                alert("Like the song failed!")
            })
        } else {
            btnLogin.click()
        }
    }
    $rootScope.DislikeSong = function (s) {
        if ($rootScope.logged) {
            $http({
                method: 'post',
                url: '/Liked/DislikeSong',
                datatype: 'json',
                data: { songID: s.Song.SongID }
            }).then(function (res) {
                if (!res.data) {
                    s.Liked = 0
                    $rootScope.showSnackbar('B??? th??ch!')
                } else {
                    alert("Dislike the song failed!")
                }
            }, function () {
                alert("Dislike the song failed!")
            })
        } else {
            btnLogin.click()
        }
    }

    $rootScope.LikeAlbum = function (a) {
        if ($rootScope.logged) {
            $http({
                method: 'post',
                url: '/Liked/LikeAlbum',
                datatype: 'json',
                data: { albumID: a.AlbumID }
            }).then(function (res) {
                if (!res.data) {
                    a.Liked = 1
                    $rootScope.showSnackbar('???? th??ch!')
                } else {
                    alert("Like the album failed!")
                }
            }, function () {
                alert("Like the album failed!")
            })
        } else {
            btnLogin.click()
        }
    }
    $rootScope.DislikeAlbum = function (a) {
        if ($rootScope.logged) {
            $http({
                method: 'post',
                url: '/Liked/DislikeAlbum',
                datatype: 'json',
                data: { albumID: a.AlbumID }
            }).then(function (res) {
                if (!res.data) {
                    a.Liked = 0
                    $rootScope.showSnackbar('B??? th??ch!')
                } else {
                    alert("Dislike the album failed!")
                }
            }, function () {
                alert("Dislike the album failed!")
            })
        } else {
            btnLogin.click()
        }
    }
    $rootScope.LikePlaylist = function (obj, p, k) {
        if ($rootScope.logged) {
            $http({
                method: 'post',
                url: '/Liked/LikePlaylist',
                datatype: 'json',
                data: { playlistID: p , kind: k}
            }).then(function (res) {
                if (!res.data) {
                    obj.Liked = 1
                    $rootScope.showSnackbar('???? th??ch!')
                } else {
                    alert("Like the playlist failed!")
                }
            }, function () {
                alert("Like the playlist failed!")
            })
        } else {
            btnLogin.click()
        }
    }
    $rootScope.DislikePlaylist = function (obj, p, k) {
        if ($rootScope.logged) {
            $http({
                method: 'post',
                url: '/Liked/DislikePlaylist',
                datatype: 'json',
                data: { playlistID: p, kind: k }
            }).then(function (res) {
                if (!res.data) {
                    obj.Liked = 0
                    $rootScope.showSnackbar('B??? th??ch!')
                } else {
                    alert("Dislike the playlist failed!")
                }
            }, function () {
                alert("Dislike the playlist failed!")
            })
        } else {
            btnLogin.click()
        }
    }
})
