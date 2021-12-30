appMusic.controller('ArtistController', function ($scope, $rootScope, $http, $window) {
    $http({
        method: 'get',
        url: '/Artist/GetArtist'
    }).then(function (d) {
        $scope.Artists = d.data
    }, function (error) {
        alert('Failed to get the Artist!')
    })
});
appMusic.controller('ArtistMaNaController', function ($scope, $rootScope, $http, $window, $filter, NgTableParams, Upload) {
    $scope.artists = []
    $http.get('/Administrator/ArtistMana/GetArtistsForMana'
    ).then(function (d) {
        $scope.artists = JSON.parse(d.data)
    }, function (error) {
        alert('Failed to get the artists!')
    })
    $rootScope.maxSize = 4; // limit number for pagination display number. 
    $rootScope.totalCount = 0; // total number of items in all pages. initialize as a zero 
    $rootScope.pageIndex = 1; // current page number. first page is 1
    $rootScope.pageSize = 10; // maximum number of items per page. 
    $rootScope.searchName = "";
   
    //Lấy sản phẩm hiển thị lên giao diện
    $scope.GetArtists = function (index) {
        $http.get('/Administrator/ArtistMana/GetArtistsPage',
            {
                params: {
                    pageIndex: index,
                    pageSize: $rootScope.pageSize, ArtistName: $rootScope.searchName
                }
            }).then(function (d) {
                alert("alo");
                $scope.artists = JSON.parse(d.data.Artists);
                $rootScope.totalCount = d.data.totalCount

            }, function (error) { alert('Failed'); });
    }
    $scope.GetArtists($scope.pageIndex);


    $scope.UploadFiles = function (file) {
        $scope.SelectedFiles = file;
        if ($scope.SelectedFiles && $scope.SelectedFiles.length) {
            Upload.upload({
                url: '/Administrator/ArtistMana/Upload',
                data: { alid: $scope.artist.ArtistID, files: $scope.SelectedFiles }
            }).then(function (d) {
                $scope.artist.Image = d.data[0];
                $scope.artist.ImageBig = d.data[1];
            }, function (error) { alert('lỗi'); });
        }
    }
    $scope.DeleteArtist = function (a) {
        $http({
            method: "Post",
            url: '/Administrator/ArtistMana/DeleteArtist',
            params: { id: a.ArtistID }
        }).then(function Success(d) {
            var vt = $scope.artists.indexOf(a);
            $scope.artists.splice(vt, 1);
            alert("Xóa thành công")
        }, function error(e) {
            alert("Xóa lỗi");
        });
    }
    $scope.addArtist = function () {
       
        $scope.artist = null;
    }
    $scope.editArtist = function (a) {
        $scope.artist =a;
    }
    $scope.SaveAdd = function (files) {
        $http({
            method: 'Post',
            url: '/Administrator/ArtistMana/AddArtist',
            datatype: 'Json',
            data: JSON.stringify($scope.artist)
        }).then(function (d) {
            if (d.data == "") {
                $scope.artists.push($scope.artist);
                $scope.artist = null;
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
            url: '/Administrator/ArtistMana/EditArtist',
            datatype: 'Json',
            data: $scope.artist
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
//    var AdminApp = angular.module("AdminApp", ['angularUtils.directives.dirPagination']);
//    appMusic.controller('ArtistMaNaController', function ($scope, $rootScope, $http, $window) {
//        $http({
//            method: 'get',
//            url: '/Administrator/ArtistMana/GetArtistsForMana'
//        }).then(function (d) {
//            alert("alo");
//            $scope.Listartists = JSON.parse(d.data);
//            console.log($scope.Listartists)
//        }, function (error) {
//            alert('Failed to get the Artist Mana!')
//        })
//        $rootScope.maxSize = 3; // limit number for pagination display number. 
//        $rootScope.totalCount = 0; // total number of items in all pages. initialize as a zero 
//        $rootScope.pageIndex = 1; // current page number. first page is 1
//        $rootScope.pageSize = 8; // maximum number of items per page. 
//        $rootScope.searchName = "";
//        $scope.GetArtists = function (index) {
//            $http.get('/Administrator/ArtistMana/ GetArtistsPage',
//                {
//                    params: {
//                        pageIndex: index,
//                        pageSize: $rootScope.pageSize, artistName: $rootScope.searchName
//                    }
//                }).then(function (d) {
//                    $scope.Listartists = JSON.parse(d.data);
//                    $rootScope.totalCount = d.data.totalCount

//                }, function (error) { alert('Failed'); });
//        }
//        $scope.GetArtists($scope.pageIndex);
//    })
//});