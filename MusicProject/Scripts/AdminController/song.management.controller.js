appMusic.controller('SongManaController', function ($scope, $rootScope, $http, $window, NgTableParams, Upload) {
    $rootScope.currentIndex = 1
    $rootScope.currentSubIndex = 0

    //Table phân dữ liệu theo Anphabet
    $scope.firstLetterGroupArtistFn = function (item) {
        return item.ArtistName[0];
    }
    $scope.firstLetterGroupAlbumFn = function (item) {
        return item.AlbumName[0];
    }
    $scope.firstLetterGroupColFn = function (item) {
        return item.CollectionName[0];
    }

    //Upload ảnh
    $scope.UploadImage = function (file) {
        $scope.Song.Image = file.name
        $scope.SelectedFileImage = file
    }
    //Upload mp3
    $scope.UploadMP3 = function (file) {
        $scope.Song.SongPath = file.name
        $scope.SelectedFileMp3 = file
    }

    //Lấy về danh sách bài hát phân trang
    $scope.songs = []

    $http({
        method: 'get',
        url: '/Administrator/SongMana/GetSongsForMana'
    }).then(function (response) {
        $scope.songs = JSON.parse(response.data)
        console.log($scope.songs)
        //Table
        $scope.tableParams = new NgTableParams({
            page: 1, // show first page
            count: 10, // count per page
        }, {
            filterDelay: 0,
            dataset: $scope.songs
        });
    }, function (error) {
        alert('Failed to get the songs!')
    })

    $http({
        method: 'get',
        url: '/Administrator/SongMana/GetAlbumsGenresArtistsForManaSong'
    }).then(function (response) {
        $scope.albums = JSON.parse(response.data.ablums)
        $scope.collections = JSON.parse(response.data.genres)
        $scope.artists = JSON.parse(response.data.artists)
    }, function (error) {
        alert('Failed to get the data!')
    })

    $scope.Song = {}
    $scope.Song.Artists = []
    $scope.Song.Collections = []

    $scope.addSong = function () {
        $scope.feature = 'Thêm bài hát'
        $scope.Song = {}
        $scope.Song.SongID = $rootScope.create_UUID()
        $scope.Song.Nation = 1
        $scope.Song.isVip = false
        $('iframe').contents().find('.textarea').html('');
    }

    $scope.editSong = function (s) {
        $scope.feature = 'Sửa bài hát'
        $scope.Song = JSON.parse(JSON.stringify(s));
        $('iframe').contents().find('.textarea').html($scope.Song.Lyric);
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
            //$http({
            //    method: "post",
            //    url: '/Administrator/SongMana/AddSong',
            //    data: $scope.Song
            //}).then((res) => {
            //    if (res.data) {
            //        $scope.SelectedFileMp3 = undefined
            //        $scope.SelectedFileImage = undefined

            //    } else {
            //        alert("Insert failed!")
            //    }
            //}, (err) => {
            //    alert("Insert failed!")
            //})
            console.log($scope.Song)
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