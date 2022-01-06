appMusic.controller('PlayMusicController', function ($scope, $rootScope, $timeout, $http) {
    // Chạy slide (background) ...
    let indexBackgroundImage = 0
    let backgroundImage = document.querySelectorAll('.background img')
    let mySetInterval
    $scope.open = false
    $scope.isFullScreen = function () {
        $scope.open = !$scope.open
        document.querySelector('.play-music').classList.toggle('show')
        if ($scope.open) {
            mySetInterval = setInterval(function () {
                indexBackgroundImage++
                if (indexBackgroundImage < 0) {
                    indexBackgroundImage = 9
                }
                if (indexBackgroundImage > 9) {
                    indexBackgroundImage = 0
                }
                console.log(indexBackgroundImage)
                backgroundImage.forEach(element => {
                    element.classList.remove('animation')
                    element.classList.remove('active')
                });
                backgroundImage[indexBackgroundImage].classList.add('animation')
                backgroundImage[indexBackgroundImage].classList.add('active')
            }, 15000)
            indexBackgroundImage = 0
            backgroundImage[0].classList.add('animation')
            backgroundImage[0].classList.add('active')
        } else {
            clearInterval(mySetInterval)
            indexBackgroundImage = 0
            backgroundImage.forEach(element => {
                element.classList.remove('animation')
                element.classList.remove('active')
            });
        }
    }

    // Mở queue
    let btnShowQueue = document.querySelector('.btn-show-queue')
    let Queue = document.querySelector('.play-music__waiting-list')

    btnShowQueue.onclick = function () {
        Queue.classList.toggle('show')
        this.classList.toggle('focus')
    }

    //Play Music
    const audio = document.querySelector("#audio");
    const playBtn = document.querySelector(".btn-toggle-play");
    const progress = document.querySelector("#progress");
    const prevBtn = document.querySelector(".btn-prev-music");
    const nextBtn = document.querySelector(".btn-next-music");
    const randomBtn = document.querySelector(".btn-random-music");
    const repeatBtn = document.querySelector(".btn-repeat-music");
    const volumeMusic = document.querySelector(".controls_volume");
    const switchVolumeBtn = document.querySelector(".btn-switch-volume");
    const ctrl_time_right = document.querySelector(".controls_time--right");
    const ctrl_time_left = document.querySelector(".controls_time--left");

    //Bài hát đang chạy
    $rootScope.songsofListPlay = []
    $rootScope.songsofQueue = sessionStorage.getItem('songsofQueue') ? JSON.parse(sessionStorage.getItem('songsofQueue')) : []
    $rootScope.songsofListened = []
    $scope.config = sessionStorage.getItem('playerConfig') ? JSON.parse(sessionStorage.getItem('playerConfig')) : {
        hidden: true,
        currentIndex: 0,
        isPlayingMusic: false,
        isRandomMusic: false,
        isRepeatMusic: 0,
        volume: 100,
        volumePrev: 100
    }
    $rootScope.songIsPlayed = $rootScope.songsofQueue[$scope.config.currentIndex]
    setConfig('isPlayingMusic', false)
    audio.volume = $scope.config.volume / 100

    //Chơi nhạc nha
    $rootScope.pickplayMusic = function (song) {
        if (!$rootScope.songIsPlayed || song.Song.SongID != $rootScope.songIsPlayed.Song.SongID) {
            $rootScope.songIsPlayed = song
            if ($rootScope.songsofQueue.length <= 1) {
                $rootScope.songsofQueue = []
                $rootScope.songsofQueue.push(song)
                setConfig('currentIndex', 0)
            } else {
                //let check = $rootScope.songsofQueue.findIndex(s => s.Song.SongID == song.Song.SongID)
                //if (check != -1) {
                //    $scope.currentIndex = check
                //} else {
                $rootScope.songsofQueue.push(song)
                setConfig('currentIndex', $rootScope.songsofQueue.length - 1)
                //}
            }
            $timeout(function () {
                audio.play()
            }, 0)
            sessionStorage.setItem('songsofQueue', JSON.stringify($rootScope.songsofQueue))
            //Hiện giao diện chơi nhạc nếu chưa hiện nha
            setConfig('hidden', false)
        }
    }
    //Thêm bài hát vô queue
    $rootScope.addSongtoQueue = function (song) {
        //let check = $rootScope.songsofQueue.findIndex(s => s.Song.SongID == song.Song.SongID)
        //if (check == -1) {
            $rootScope.songsofQueue.push(song)
        //}
        sessionStorage.setItem('songsofQueue', JSON.stringify($rootScope.songsofQueue))
        $rootScope.showSnackbar('Thêm bài hát vào danh sách chờ thành công!')
    }

    $scope.$watch('$root.songIsPlayed', function () {
        console.log($rootScope.songIsPlayed.Song.SongID)
        $timeout(function () {
            if ($rootScope.logged) {
                $http({
                    method: 'post',
                    url: '/Listened/SongListened',
                    datatype: 'json',
                    data: { songID: $rootScope.songIsPlayed.Song.SongID }
                }).then(function (res) {
                    if (!res.data) {
                        //$rootScope.showSnackbar('Đã nghe!')
                    } else {
                        alert("Listened the playlist failed!")
                    }
                }, function () {
                    alert("Listened the playlist failed!")
                })
            }
            $http({
                method: 'post',
                url: '/Listened/IncreaseViews',
                datatype: 'json',
                data: { songID: $rootScope.songIsPlayed.Song.SongID }
            }).then(function (res) {
                if (!res.data) {
                    //$rootScope.showSnackbar('Đã nghe nè!')
                } else {
                    alert("Like the playlist failed!")
                }
            }, function () {
                alert("Like the playlist failed!")
            })
        }, 0)
    })

    function handleEvents () {
        // Xử lý khi click play
        playBtn.onclick = function () {
            if ($scope.config.isPlayingMusic) {
                audio.pause();
            } else {
                audio.play();
            }
        }

        // Khi song được play
        audio.onplay = function () {
            $scope.$apply(function () {
                setConfig('isPlayingMusic', true)
            })
        }

        // Khi song bị pause
        audio.onpause = function () {
            $scope.$apply(function () {
                setConfig('isPlayingMusic', false)
            })
        }

        // Khi next song
        nextBtn.onclick = function () {
            if ($scope.config.isRandomMusic) {
                playRandomSong();
            } else {
                nextSong();
            }
            audio.play();
        };

        // Khi prev song
        prevBtn.onclick = function () {
            if ($scope.config.isRandomMusic) {
                playRandomSong();
            } else {
                prevSong();
            }
            audio.play();
        };

        // Khi tiến độ bài hát thay đổi
        let changingInput = true //Tại khi onchange nó vẫn chạy gây ra lỗi khó change input
        audio.ontimeupdate = function () {
            if (audio.duration && changingInput) {
                const progressPercent = Math.floor(
                    (audio.currentTime / audio.duration) * 100
                );
                progress.value = progressPercent;
                ctrl_time_left.innerText = timeConvert(audio.currentTime)
            }
        }

        //Khi load music xong
        audio.onloadeddata = function () {
            ctrl_time_right.innerText = timeConvert(audio.duration)
        }

        // Xử lý khi tua song
        progress.onchange = function (e) {
            const seekTime = (audio.duration / 100) * e.target.value;
            audio.currentTime = seekTime;
            changingInput = true
        }
        progress.oninput = function (e) {
            changingInput = false
        }

        // Xử lý bật / tắt random song
        randomBtn.onclick = function (e) {
            $scope.$apply(function () {
                setConfig('isRandomMusic', !$scope.config.isRandomMusic)
            })
        }

        // Xử lý lặp lại song
        repeatBtn.onclick = function (e) {
            $scope.$apply(function () {
                setConfig('isRepeatMusic', $scope.config.isRepeatMusic + 1)
                if ($scope.config.isRepeatMusic > 2) {
                    setConfig('isRepeatMusic', 0)
                }
            })
        };

        // Xử lý khi chạy hết bài hát
        audio.onended = function () {
            if ($scope.config.isRepeatMusic == 1) {
                audio.play();
            } else if ($scope.config.isRepeatMusic == 2) {
                nextBtn.click();
            }
        };

        //Thay đổi âm lượng audio
        volumeMusic.oninput = function (e) {
            audio.volume = e.target.value / 100;
            setConfig('volume', e.target.value)
        }
        //Bật tắt volume
        switchVolumeBtn.onclick = function () {
            $scope.$apply(function () {
                if ($scope.config.volume > 0) {
                    setConfig('volumePrev', $scope.config.volume)
                    audio.volume = 0
                    volumeValue = $scope.config.volume
                    setConfig('volume', 0)
                } else {
                    audio.volume = $scope.config.volumePrev / 100
                    setConfig('volume', $scope.config.volumePrev)
                }
            })
        }
    }

    function timeConvert(time) {
        var sec_num = time;
        var minutes = Math.floor(sec_num / 60);
        var seconds = sec_num - (minutes * 60);
        if (minutes < 10) {
            minutes = "0" + minutes;
        }
        minutes += "";
        if (seconds < 10) {
            seconds = "0" + seconds;
        }
        seconds += "";

        var time = minutes + ':' + seconds.substring(0, 2);
        return time
    }

    function nextSong() {
        $scope.$apply(function () {
            setConfig('currentIndex', $scope.config.currentIndex + 1)
            if ($scope.config.currentIndex >= $rootScope.songsofQueue.length) {
                setConfig('currentIndex', 0)
            }
            $rootScope.songIsPlayed = $rootScope.songsofQueue[$scope.config.currentIndex]
        })
    }

    function prevSong() {
        $scope.$apply(function () {
            setConfig('currentIndex', $scope.config.currentIndex - 1)
            if ($scope.config.currentIndex < 0) {
                setConfig('currentIndex', $rootScope.songsofQueue.length - 1)
            }
            $rootScope.songIsPlayed = $rootScope.songsofQueue[$scope.config.currentIndex]
        })
    }

    function playRandomSong() {
        let newIndex;
        do {
            newIndex = Math.floor(Math.random() * $rootScope.songsofQueue.length);
        } while (newIndex === $scope.config.currentIndex);
        $scope.$apply(function () {
            setConfig('currentIndex', newIndex)
            $rootScope.songIsPlayed = $rootScope.songsofQueue[$scope.config.currentIndex]
        })
    }

    function setConfig(key, value) {
        $scope.config[key] = value;
        sessionStorage.setItem('playerConfig', JSON.stringify($scope.config));
    }

    handleEvents()
})