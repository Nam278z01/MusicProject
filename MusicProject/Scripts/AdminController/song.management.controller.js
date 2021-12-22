appMusic.controller('SongManaController', function ($scope, $rootScope, $http, $window, $filter, NgTableParams, Upload) {
    $rootScope.currentIndex = 1
    $rootScope.currentSubIndex = 0

    $scope.openFileImage = function () {
        $('#file-img').click();
    }

    $scope.openFileImage2 = function () {
        $('#file-img2').click();
    }

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
        $scope.Song.Image = file.length > 0 ? file[0].name : null
        $scope.SelectedFileImage = file
    }
    $scope.RemoveImage = function (file) {
        $scope.Song.Image = null
        $scope.SelectedFileImage = null
    }
    //Upload mp3
    $scope.UploadMP3 = function (file) {
        $scope.Song.SongPath = file.length > 0 ? file[0].name : null
        $scope.SelectedFileMp3 = file
    }
    $scope.RemoveMP3 = function (file) {
        $scope.Song.SongPath  = null
        $scope.SelectedFileMp3 = null
    }

    //Lấy về danh sách bài hát phân trang
    $scope.songs = []

    $http({
        method: 'get',
        url: '/Administrator/SongMana/GetSongsForMana'
    }).then(function (response) {
        $scope.songs = JSON.parse(response.data)
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

    //Lấy dữ liệu để thêm, sửa
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

    $scope.addSong = function () {
        $scope.feature = 'Thêm bài hát'
        $scope.Song = {}
        $scope.Song.SongID = $rootScope.create_UUID()
        $scope.Song.Nation = 1
        $scope.Song.isVip = false
        let date = $filter('date')(new Date(), "MM/dd/yyyy")
        $('#datepicker').val(date)
        $('iframe').contents().find('.textarea').html('');
        $scope.SelectedFileMp3 = undefined
        $scope.SelectedFileImage = undefined
    }

    $scope.editSong = function (s) {
        $scope.feature = 'Sửa bài hát'
        $scope.Song = JSON.parse(JSON.stringify(s));
        $('iframe').contents().find('.textarea').html($scope.Song.Lyric);
        let date = $filter('date')($scope.Song.ReleaseDate, "MM/dd/yyyy")
        $('#datepicker').val(date)
        $scope.SelectedFileMp3 = undefined
        $scope.SelectedFileImage = undefined
    }

    $scope.songIDneedDelete
    $scope.deleteSong = function (s) {
        $scope.songIDneedDelete = s.SongID
    }

    $scope.addeditSongSave = function () {
        $scope.Song.ReleaseDate = document.querySelector("#datepicker").value
        $scope.Song.Lyric = $('iframe').contents().find('.textarea').html();
        if ($scope.SelectedFileImage && $scope.SelectedFileImage.length > 0) {
            Upload.upload({
                url: '/Administrator/DashBoard/Upload',
                data: { files: $scope.SelectedFileImage, path: '~/assets/img/song/' }
            }).then((res) => {
                $scope.Song.Image = res.data[0]
            }, (err) => {
                alert("Upload failed!")
            })
        }
        if ($scope.SelectedFileMp3 && $scope.SelectedFileMp3.length > 0) {
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
                if (!res.data) {
                    $scope.songs.unshift($scope.Song)
                    $scope.SelectedFileMp3 = undefined
                    $scope.SelectedFileImage = undefined
                    $scope.Song = {}
                    $scope.tableParams.reload()
                    $rootScope.showSnackbar('Thêm bài hát thành công!')
                } else {
                    $rootScope.showSnackbar('Thêm bài hát thất bại!')
                }
            }, (err) => {
                alert("Insert failed!")
            })
        }
        else {
            let songIndex = $scope.songs.findIndex(s => s.SongID == $scope.Song.SongID) //Lấy index thằng đang thao tác
            let songNewClone = JSON.parse(JSON.stringify($scope.Song)) //Clone nó lại lần nữa

            //Xác định xem collection nào cần thêm, sửa và xóa (0: Thêm / 1: Sửa/ 2: Xóa)
            let collectionneedEdit
            if ($scope.songs[songIndex].Collections && $scope.songs[songIndex].Collections.length > 0) { // Nếu thằng ban đầu (thằng gốc trong mảng) có ít nhất 1 phần tử
                collectionneedEdit = songNewClone.Collections.map((item) => { // map nó thằng clone (thằng mình nhập) nếu nó có tồn tại trong thằng gốc thì sửa, ko thì thêm
                    item.status = $scope.songs[songIndex].Collections.findIndex(c => c.CollectionID == item.CollectionID) == -1 ? 0 : 1
                    return item
                })
                $scope.songs[songIndex].Collections.forEach(item => {//Nếu thằng gốc trong mảng có phần tử mà thằng clone kia ko có thì xóa
                    if (collectionneedEdit.findIndex(c => c.CollectionID == item.CollectionID) == -1) {
                        item.status = 2
                        collectionneedEdit.push(item)
                    }
                })
            } else { // Nếu thằng gốc null...
                if (songNewClone.Collections && songNewClone.Collections.length > 0) {//Nếu thằng clone có collection thì cho về dạng thêm
                    collectionneedEdit = songNewClone.Collections.map((item) => {
                        item.status = 0
                        return item
                    })
                }
            }
            songNewClone.Collections = collectionneedEdit
            //Xác định xem artists nào cần thêm, sửa và xóa như collection
            let artistneedEdit
            if ($scope.songs[songIndex].Artists && $scope.songs[songIndex].Artists.length > 0) {
                artistneedEdit = songNewClone.Artists.map((item) => {
                    item.status = $scope.songs[songIndex].Artists.findIndex(a => a.ArtistID == item.ArtistID) == -1 ? 0 : 1
                    return item
                })
                $scope.songs[songIndex].Artists.forEach(item => {
                    if (artistneedEdit.findIndex(c => c.ArtistID == item.ArtistID) == -1) {
                        item.status = 2
                        artistneedEdit.push(item)
                    }
                })
            } else {
                if (songNewClone.Artists && songNewClone.Artists.length > 0) {
                    artistneedEdit = songNewClone.Artists.map((item) => {
                        item.status = 0
                        return item
                    })
                }
            }
            songNewClone.Artists = artistneedEdit

            $http({
                method: "post",
                url: '/Administrator/SongMana/EditSong',
                data: { jsonData: JSON.stringify(songNewClone) }
            }).then((res) => {
                if (!res.data) {
                    $scope.songs[songIndex] = $scope.Song
                    $scope.SelectedFileMp3 = undefined
                    $scope.SelectedFileImage = undefined
                    $scope.tableParams.reload()
                    $rootScope.showSnackbar('Sửa bài hát thành công!')
                } else {
                    $rootScope.showSnackbar('Sửa bài hát thất bại!')
                }
            }, (err) => {
                alert("Edit failed!")
            })
        }
    }

    $scope.agreetodeleteSong = function () {
        $http({
            method: 'post',
            url: '/Administrator/SongMana/DeleteSong',
            data: { SongID: $scope.songIDneedDelete }
        }).then(function (res) {
            if (res.data) {
                let songIndex = $scope.songs.findIndex(s => s.SongID == $scope.songIDneedDelete.SongID)
                $scope.songs.splice(songIndex, 1)
                $scope.tableParams.reload()
                $scope.songIDneedDelete = null
                $rootScope.showSnackbar('Xóa bài hát Thành công!')
            } else {
                $rootScope.showSnackbar('Xóa bài hát thất bại!')
            }
        }, function (err) {
            alert("Delete failed song!")
        })
    }
})