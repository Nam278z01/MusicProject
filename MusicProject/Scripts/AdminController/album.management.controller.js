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

})
