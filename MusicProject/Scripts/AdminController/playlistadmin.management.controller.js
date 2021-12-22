appMusic.controller('PlaylistAdminManaController', function ($scope, $rootScope, $http, $window, $filter, NgTableParams, Upload) {
    $rootScope.currentIndex = 1
    $rootScope.currentSubIndex = 1

    $scope.firstLetterGroupPlaylistFn = function (item) {
        return item.Song.SongName[0];
    }

    $scope.playlists = []

    $http({
        method: 'get',
        url: '/Administrator/PlaylistAdminMana/GetPlaylistsForMana'
    }).then(function (response) {
        $scope.playlists = JSON.parse(response.data)
        //Table
        $scope.tableParams = new NgTableParams({
            page: 1, // show first page
            count: 10, // count per page
        }, {
            filterDelay: 0,
            dataset: $scope.playlists
        });
    }, function (error) {
        alert('Failed to get the playlists!')
    })

     //Lấy dữ liệu để thêm, sửa
    $http({
        method: 'get',
        url: '/Administrator/PlaylistAdminMana/GetSongsForManaPlaylistAdmin'
    }).then(function (response) {
        $scope.songs = JSON.parse(response.data)
    }, function (error) {
        alert('Failed to get the data!')
    })

    $scope.PlaylistAdmin = {}

    $scope.addPlaylist = function () {
        $scope.feature = 'Thêm playlist'
        $scope.PlaylistAdmin = {}
        $scope.PlaylistAdmin.PlaylistID = $rootScope.create_UUID()
        $scope.PlaylistAdmin.AccountName = "nam278z01@gmail.com"
        $scope.PlaylistAdmin.PersonName = 'Nguyễn Nam'
    }

    $scope.editPlaylist = function (p) {
        $scope.feature = 'Sửa thông tin playlist'
        $scope.PlaylistAdmin = JSON.parse(JSON.stringify(p));
        let date = $filter('date')($scope.PlaylistAdmin.DateCreated, "MM/dd/yyyy")
        $('#datepicker').val(date)
    }

    $scope.addeditSongSave = function () {
        $scope.Song.ReleaseDate = document.querySelector("#datepicker").value
        $scope.Song.Lyric = $('iframe').contents().find('.textarea').html();
        if ($scope.SelectedFileImage) {
            Upload.upload({
                url: '/Administrator/DashBoard/Upload',
                data: { files: $scope.SelectedFileImage, path: '~/assets/img/user/' }
            }).then((res) => {
                $scope.Song.Image = res.data[0]
            }, (err) => {
                alert("Upload failed!")
            })
        }
        if ($scope.SelectedFileMp3) {
            Upload.upload({
                url: '/Administrator/DashBoard/Upload',
                data: { files: $scope.SelectedFileMp3, path: '~/assets/mp3/' }
            }).then((res) => {
                $scope.Song.SongPath = res.data[0]
            }, (err) => {
                alert("Upload failed!")
            })
        }
        if ($scope.feature == 'Thêm bài hát') {
            $http({
                method: "post",
                url: '/Administrator/SongMana/AddSong',
                data: { jsonData: JSON.stringify($scope.Song) }
            }).then((res) => {
                if (res.data) {
                    $scope.SelectedFileMp3 = undefined
                    $scope.SelectedFileImage = undefined
                    alert("Insert success!")

                } else {
                    alert("Insert failed!")
                }
            }, (err) => {
                alert("Insert failed!")
            })
        }
        else {


        }
        console.log($scope.Song)
    }

    $scope.deleteSong = function (song) {
        $http({
            method: 'post',
            url: '/Administrator/SongMana/DeleteSong',
            data: song.SongID
        }).then(function (res) {
            if (res.data) {

            } else {
                alert("Delete failed song!")
            }
        }, function (err) {
            alert("Delete failed song!")
        })
    }
})