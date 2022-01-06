appMusic.controller('AlbumManaController', function ($scope, $rootScope, $http, $window, $filter, NgTableParams, Upload) {
    $rootScope.currentIndex = 1
    $rootScope.currentSubIndex = 2

    $scope.firstLetterGroupAlbumFn = function (item) {
        return item.SongName[0]
    }

    $scope.firstLetterGroupAlbumFn2 = function (item) {
        return item.ArtistName[0]
    }

    $scope.RemoveImage = function (file) {
        $scope.Album.Image = null
        $scope.SelectedFileImage = null
    }

    $scope.openFileImage = function () {
        $('#file-img').click();
    }

    //Upload ảnh
    $scope.UploadImage = function (file) {
        $scope.Album.Image = file.length > 0 ? file[0].name : null
        $scope.SelectedFileImage = file
    }

    $http({
        method: 'get',
        url: '/Administrator/AlbumMana/GetAlbumsForMana'
    }).then((res) => {
        $scope.albums = JSON.parse(res.data)
        $scope.tableParams = new NgTableParams({
            page: 1, // show first page
            count: 10, // count per page
        }, {
            filterDelay: 0,
            dataset: $scope.albums
        });
    }, (err) => {
        alert("Failed to get albums!")
    })

    $http({
        method: 'get',
        url: '/Administrator/AlbumMana/GetArtistSongForAlbumMana'
    }).then((res) => {
        $scope.artists = JSON.parse(res.data.artists)
        $scope.songs = JSON.parse(res.data.songs)
        console.log($scope.songs)
    }, (err) => {
        alert("Failed to get data!")
    })

    $scope.Album = {}
    $scope.addAlbum = function () {
        $scope.feature = 'Thêm album'
        $scope.Album = {}
        $scope.Album.AlbumID = $rootScope.create_UUID()
        let date = $filter('date')(new Date(), "MM/dd/yyyy")
        $('#datepicker').val(date)
        $scope.SelectedFileImage = undefined
    }

    $scope.editAlbum = function (p) {
        $scope.feature = 'Sửa album'
        $scope.Album = JSON.parse(JSON.stringify(p));
        let date = $filter('date')($scope.Album.ReleasedDate, "MM/dd/yyyy")
        $('#datepicker').val(date)
    }

    $scope.albumIDneedDelete
    $scope.deleteAlbum = function (s) {
        $scope.albumIDneedDelete = s.AlbumID
    }
    $scope.addeditAlbumSave = function () {
        $scope.Album.ReleasedDate = document.querySelector("#datepicker").value
        console.log(JSON.stringify($scope.Album))
        if ($scope.SelectedFileImage && $scope.SelectedFileImage.length > 0) {
            Upload.upload({
                url: '/Administrator/DashBoard/Upload',
                data: { files: $scope.SelectedFileImage, path: '~/assets/img/album/' }
            }).then((res) => {
                $scope.Album.Image = res.data[0]
            }, (err) => {
                alert("Upload failed!")
            })
        }
        if ($scope.feature == 'Thêm album') {
            $http({
                method: "post",
                url: '/Administrator/AlbumMana/AddAlbum',
                data: { jsonData: JSON.stringify($scope.Album) }
            }).then((res) => {
                if (!res.data) {
                    $scope.albums.unshift($scope.Album)
                    $scope.SelectedFileImage = undefined;
                    $scope.Album = {}
                    $scope.addAlbum()
                    $scope.tableParams.reload()
                    $rootScope.showSnackbar('Thêm album thành công!')
                } else {
                    $rootScope.showSnackbar('Thêm album thất bại!')
                }
            }, (err) => {
                alert("Insert failed!")
            })
        } else {
            $http({
                method: "post",
                url: '/Administrator/AlbumMana/EditAlbum',
                data: { jsonData: JSON.stringify($scope.Album) }
            }).then((res) => {
                let albumIndex = $scope.albums.findIndex(s => s.AlbumID == $scope.Album.AlbumID) //Lấy index thằng đang thao tác
                if (!res.data) {
                    $scope.albums[albumIndex] = $scope.Album
                    $scope.SelectedFileImage = undefined
                    $scope.tableParams.reload()
                    $rootScope.showSnackbar('Sửa album thành công!')
                } else {
                    $rootScope.showSnackbar('Sửa album thất bại!')
                }
            }, (err) => {
                alert("Edit failed!")
            })
        }
        $scope.agreetodeleteAlbum = function () {
            $http({
                method: 'post',
                url: '/Administrator/AlbumMana/DeleteAlbum',
                data: { AlbumID: $scope.albumIDneedDelete }
            }).then(function (res) {
                if (!res.data) {
                    let albumIndex = $scope.albums.findIndex(s => s.AlbumID == $scope.albumIDneedDelete)
                    console.log(albumIndex)
                    $scope.albums.splice(songIndex, 1)
                    $scope.tableParams.reload()
                    $scope.albumIDneedDelete = null
                    $rootScope.showSnackbar('Xóa album Thành công!')
                } else {
                    $rootScope.showSnackbar('Xóa album thất bại!')
                }
            }, function (err) {
                alert("Delete failed album!")
            })
        } 
    }

})
