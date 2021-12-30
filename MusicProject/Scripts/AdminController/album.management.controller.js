/// <reference path="../dirpagination.js" />
/// <reference path="../angular.min.js" />


appMusic.controller('AlbumManaController', function ($scope, $rootScope, $http, $window, $filter, NgTableParams, Upload) {
    $http.get('/Administrator/AlbumMana/GetAlbumsForMana').then(function (d) {
        $rootScope.albums = JSON.parse(d.data)
    }, function (error) {
        alert('Failed to get the albums!')
    })
    $scope.UploadFiles = function (file) {
        $scope.SelectedFiles = file;
        if ($scope.SelectedFiles && $scope.SelectedFiles.length) {
            Upload.upload({
                url: '/Administrator/AlbumMana/Upload',
                data: { alid: $scope.alb.AlbumID, files: $scope.SelectedFiles }
            }).then(function (d) {
                $scope.alb.Image = d.data[0];
            }, function (error) { alert('lỗi'); });
        }
    }//end upload fil
    $scope.addAlbum = function () {
        //$scope.alb.ReleasedDate = document.querySelector("#datepicker").value
       // $scope.alb.ReleaseDate = document.querySelector("#datepicker").value
        $scope.alb = null;
       
        //let date = $filter('date')(new Date(), "MM/dd/yyyy")
        //$('#datepicker').val(date)
        //if ($scope.SelectedFileImage) {
        //    Upload.upload({
        //        url: '/Administrator/DashBoard/Upload',
        //        data: { files: $scope.SelectedFileImage, path: '~/assets/img/album/' }
        //    }).then((res) => {
        //        $scope.alb.Image = res.data[0]
        //    }, (err) => {
        //        alert("Upload failed!")
        //    })
        //}
    }
    $scope.Delete = function (al) {
        $http({
            method: "Post",
            url: "/Administrator/AlbumMana/DeleteAlbum",
            params: { albumid: al.AlbumID }
        }).then(function Success(d) {
            var vt = $scope.albums.indexOf(al);
            $scope.albums.splice(vt, 1);
            alert("Xóa album thành công");
        }, function error(e) {
            alert("Xóa album lỗi");
        });
    } 
    $scope.EditAlbum = function (al) {
        $scope.alb = al;
        //let date = $filter('date')($scope.alb.ReleasedDate, "MM/dd/yyyy")
        //$('#datepicker').val(date)
        //if ($scope.SelectedFileImage) {
        //    Upload.upload({
        //        url: '/Administrator/DashBoard/Upload',
        //        data: { files: $scope.SelectedFileImage, path: '~/assets/img/album/' }
        //    }).then((res) => {
        //        $scope.al.Image = res.data[0]
        //    }, (err) => {
        //        alert("Upload failed!")
        //    })
        //}
    }
    $scope.SaveAdd = function (files) {
        $http({
            method: 'Post',
            url: '/Administrator/AlbumMana/AddAlbum',
            datatype: 'Json',
            data: JSON.stringify($scope.alb)
        }).then(function (d) {
            if (d.data == "") {
                $scope.albums.push($scope.alb);
                $scope.alb = null;
                $scope.UploadFiles(files)
                alert("Data Submitted....!");
            }
            else {
                alert(d.data);
            }
        }, function () {
            alert("Save new records Error");
        });
    }
    $scope.SaveEdit = function () {
        $http({
            method: 'Post',
            url: '/Administrator/AlbumMana/EditAlbum',
            datatype: 'Json',
            data: $scope.alb
        }).then(function (d) {
            if (d.data == "") {
                alert("Data Editted....!")
            }
            else {
                alert(d.data);
            }
        }, function () {
            alert("Edit records Error");
        });
    }
});
appMusic.controller('AlbumManaController', function ($scope, $rootScope, $http, $window, $filter, NgTableParams, Upload) {
    $rootScope.currentIndex = 1
    $rootScope.currentSubIndex = 2
    $scope.firstLetterGroupPlaylistFn = function (item) {
        return item.SongName[0];
    }
    $scope.firstLetterGroupAlbumFn2 = function (item) {
        return item.ArtistName[0];
    }
    $scope.Album = {};
    $scope.Album.Artist = {};
   
   
    $scope.RemoveImage = function (file) {
        $scope.Album.Image = null
        $scope.SelectedFileImage = null
    }

    $scope.openFileImage = function () {
        $('#file-img').click();
    }
    $scope.addAlbum = function () {
        $scope.feature = 'Thêm Album'
        $scope.Album = {}
        $scope.Album.AlbumID = $rootScope.create_UUID()
        let date = $filter('date')(new Date(), "MM/dd/yyyy")
        $('#datepicker').val(date)
    }
    $scope.albumIDneedDelete
    $scope.deleteAlbum = function (s) {
        $scope.albumIDneedDelete = s.AlbumID
    }
    $scope.editAlbum = function (p) {
        $scope.feature = 'Sửa Album'
        $scope.Album = JSON.parse(JSON.stringify(p));
        let date = $filter('date')($scope.Album.ReleasedDate, "MM/dd/yyyy")
        $('#datepicker').val(date)
    }
    $scope.albumIDneedDelete
    $scope.deleteAlbum = function (s) {
        $scope.albumIDneedDelete = s.AlbumID
    }

    //Upload ảnh
    $scope.UploadImage = function (file) {
        $scope.Album.Image = file.length > 0 ? file[0].name : null
        $scope.SelectedFileImage = file
    }


    $http({
        method: 'get',
        url: '/Administrator/AlbumMana/GetAlbumsForMana_N'
    }).then((res)=> {
        $scope.albums = JSON.parse(res.data)
        //Table
        $scope.tableParams = new NgTableParams({
            page: 1, // show first page
            count: 10, // count per page
        }, {
            filterDelay: 0,
            dataset: $scope.albums
        });
        console.log($scope.albums)
    }, (err) => {
        alert("Failed to get albums")
    })
    $http({
        method: 'get',
        url: '/Administrator/AlbumMana/GetArtistSongForAlbumMana'
    }).then((res) => {
        $scope.artists = JSON.parse(res.data.artist)
        $scope.songs = JSON.parse(res.data.song)
        console.log($scope.artists, $scope.songs)
    }, (err) => {
        alert("Failed to get data!")
    })

});
