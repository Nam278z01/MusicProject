appMusic.controller('PlaylistAdminManaController', function ($scope, $rootScope, $http, $window, $filter, NgTableParams, Upload) {
    $rootScope.currentIndex = 1
    $rootScope.currentSubIndex = 1

    $scope.isPublics = [{ id: "", title: "" }, { id: false, title: "Ẩn đi" }, { id: true, title: "Công khai" }];

    $scope.firstLetterGroupPlaylistFn = function (item) {
        return item.SongName[0];
    }

    $scope.firstLetterGroupPlaylistFn2 = function (item) {
        let name
        if (item.KindofCollection == 1) {
            name = 'Thể loại'
        } else if (item.KindofCollection == 2) {
            name = 'Tâm trạng'
        } else if (item.KindofCollection == 3) {
            name = 'Khung cảnh'
        } else {
            name = 'Chủ đề'
        }
        return name;
    }

    $scope.RemoveImage = function (file) {
        $scope.Playlist.Image = null
        $scope.SelectedFileImage = null
    }

    $scope.openFileImage = function () {
        $('#file-img').click();
    }

    //Upload ảnh
    $scope.UploadImage = function (file) {
        $scope.Playlist.Image = file.length > 0 ? file[0].name : null
        $scope.SelectedFileImage = file
    }
    $scope.RemoveImage = function () {
        $scope.Playlist.Image = null
        $scope.SelectedFileImage = null
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
        url: '/Administrator/PlaylistAdminMana/GetCollectionsSongsForManaPlaylistAdmin'
    }).then(function (response) {
        $scope.songs = JSON.parse(response.data.songs)
        $scope.collections = JSON.parse(response.data.collections)
    }, function (error) {
        alert('Failed to get the data!')
    })

    $scope.Playlist = {}

    $scope.addPlaylist = function () {
        $scope.feature = 'Thêm playlist'
        $scope.Playlist = {}
        $scope.Playlist.PlaylistID = $rootScope.create_UUID()
        $scope.Playlist.AccountName = $rootScope.admin.AccountName
        $scope.Playlist.PersonName = $rootScope.admin.PersonName
        let date = $filter('date')(new Date(), "MM/dd/yyyy")
        $('#datepicker').val(date)
        $scope.Playlist.isPublic = false
        $scope.SelectedFileImage = undefined
    }

    $scope.editPlaylist = function (p) {
        $scope.feature = 'Sửa playlist'
        $scope.Playlist = JSON.parse(JSON.stringify(p));
        let date = $filter('date')($scope.Playlist.DateCreated, "MM/dd/yyyy")
        $('#datepicker').val(date)
    }

    $scope.playlistIDneedDelete
    $scope.deletePlaylist = function (s) {
        $scope.playlistIDneedDelete = s.PlaylistID
    }

    $scope.addeditPlaylistSave = function () {
        $scope.Playlist.DateCreated = document.querySelector("#datepicker").value
        if ($scope.SelectedFileImage && $scope.SelectedFileImage.length > 0) {
            Upload.upload({
                url: '/Administrator/DashBoard/Upload',
                data: { files: $scope.SelectedFileImage, path: '~/assets/img/playlist/admin/' }
            }).then((res) => {
                $scope.Playlist.Image = res.data[0]
            }, (err) => {
                alert("Upload failed!")
            })
        }
        if ($scope.feature == 'Thêm playlist') {
            let playlistNewClone = JSON.parse(JSON.stringify($scope.Playlist))
            let songneedEdit
            if (playlistNewClone.Songs && playlistNewClone.Songs.length > 0) {
                songneedEdit = playlistNewClone.Songs.map((item) => {
                    item.DateAdded = $filter('date')(new Date(), "MM/dd/yyyy")
                    return item
                })
            }
            playlistNewClone.Songs = songneedEdit
            console.log(JSON.stringify(playlistNewClone))

            $http({
                method: "post",
                url: '/Administrator/PlaylistAdminMana/AddPlaylistAdmin',
                data: { jsonData: JSON.stringify(playlistNewClone) }
            }).then((res) => {
                if (!res.data) {
                    $scope.playlists.unshift($scope.Playlist)
                    $scope.SelectedFileImage = undefined
                    $scope.Playlist = {}
                    $scope.addPlaylist()
                    $scope.tableParams.reload()
                    $rootScope.showSnackbar('Thêm playlist thành công!')
                } else {
                    $rootScope.showSnackbar('Thêm playlist thất bại!')
                }
            }, (err) => {
                alert("Insert failed!")
            })
        }
        else {
            let playlistIndex = $scope.playlists.findIndex(s => s.PlaylistID == $scope.Playlist.PlaylistID) //Lấy index thằng đang thao tác
            let playlistNewClone = JSON.parse(JSON.stringify($scope.Playlist)) //Clone nó lại lần nữa

            //Xác định xem collection nào cần thêm, sửa và xóa (0: Thêm / 1: Sửa/ 2: Xóa)
            let collectionneedEdit
            if ($scope.playlists[playlistIndex].Collections && $scope.playlists[playlistIndex].Collections.length > 0) { // Nếu thằng ban đầu (thằng gốc trong mảng) có ít nhất 1 phần tử
                collectionneedEdit = playlistNewClone.Collections.map((item) => { // map nó thằng clone (thằng mình nhập) nếu nó có tồn tại trong thằng gốc thì sửa, ko thì thêm
                    item.status = $scope.playlists[playlistIndex].Collections.findIndex(c => c.CollectionID == item.CollectionID) == -1 ? 0 : 1
                    return item
                })
                $scope.playlists[playlistIndex].Collections.forEach(item => {//Nếu thằng gốc trong mảng có phần tử mà thằng clone kia ko có thì xóa
                    if (collectionneedEdit.findIndex(c => c.CollectionID == item.CollectionID) == -1) {
                        item.status = 2
                        collectionneedEdit.push(item)
                    }
                })
            } else { // Nếu thằng gốc null...
                if (playlistNewClone.Collections && playlistNewClone.Collections.length > 0) {//Nếu thằng clone có collection thì cho về dạng thêm
                    collectionneedEdit = playlistNewClone.Collections.map((item) => {
                        item.status = 0
                        return item
                    })
                }
            }
            playlistNewClone.Collections = collectionneedEdit
            //Xác định xem song nào cần thêm, sửa và xóa như collection
            let songneedEdit
            if ($scope.playlists[playlistIndex].Songs && $scope.playlists[playlistIndex].Songs.length > 0) {
                songneedEdit = playlistNewClone.Songs.map((item) => {
                    item.DateAdded = $filter('date')(new Date(), "MM/dd/yyyy")
                    item.status = $scope.playlists[playlistIndex].Songs.findIndex(a => a.Songs == item.Songs) == -1 ? 0 : 1
                    return item
                })
                $scope.playlists[playlistIndex].Songs.forEach(item => {
                    if (songneedEdit.findIndex(c => c.Songs == item.Songs) == -1) {
                        item.DateAdded = $filter('date')(new Date(), "MM/dd/yyyy")
                        item.status = 2
                        songneedEdit.push(item)
                    }
                })
            } else {
                if (playlistNewClone.Songs && playlistNewClone.Songs.length > 0) {
                    songneedEdit = playlistNewClone.Songs.map((item) => {
                        item.DateAdded = $filter('date')(new Date(), "MM/dd/yyyy")
                        item.status = 0
                        return item
                    })
                }
            }
            playlistNewClone.Songs = songneedEdit
            console.log(playlistNewClone)

            $http({
                method: "post",
                url: '/Administrator/PlaylistAdminMana/EditPlaylistAdmin',
                data: { jsonData: JSON.stringify(playlistNewClone) }
            }).then((res) => {
                if (!res.data) {
                    $scope.playlists[playlistIndex] = $scope.Playlist
                    $scope.SelectedFileImage = undefined
                    $scope.tableParams.reload()
                    $rootScope.showSnackbar('Sửa playlist thành công!')
                } else {
                    $rootScope.showSnackbar('Sửa playlist thất bại!')
                }
            }, (err) => {
                alert("Edit failed!")
            })
        }
    }
    $scope.agreetodeletePlaylist = function () {
        $http({
            method: 'post',
            url: '/Administrator/PlaylistAdminMana/DeletePlaylistAdmin',
            data: { PlaylistID: $scope.playlistIDneedDelete }
        }).then(function (res) {
            if (!res.data) {
                let playlistIndex = $scope.playlists.findIndex(s => s.PlaylistID == $scope.playlistIDneedDelete)
                $scope.playlists.splice(playlistIndex, 1)
                $scope.tableParams.reload()
                $scope.playlistIDneedDelete = null
                $rootScope.showSnackbar('Xóa playlist Thành công!')
            } else {
                $rootScope.showSnackbar('Xóa playlist thất bại!')
            }
        }, function (err) {
            alert("Delete failed playlist!")
        })
    }
})