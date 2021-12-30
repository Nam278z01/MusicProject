appMusic.controller('AlbumManaController', function ($scope, $rootScope, $http, $window, $filter, NgTableParams, Upload) {

    $rootScope.currentIndex = 1
    $rootScope.currentSubIndex = 2

    $scope.firstLetterGroupAlbumFn = function (item) {
        return item.SongName[0]
    }
    $scope.firstLetterGroupAlbumFn2 = function (item) {
        return item.ArtistName[0]
    }
    $http({
        method: 'get',
        url: '/Administrator/AlbumMana/GetAlbumForMana'
    }).then(function (response) {
        $scope.albums = JSON.parse(response.data)
        //Table
        $scope.tableParams = new NgTableParams({
            page: 1, // show first page
            count: 10, // count per page
        }, {
            filterDelay: 0,
            dataset: $scope.albums
        });
    }, function (error) {
        alert('Failed to get the albums!')
    })

    $http({
        method: 'get',
        url: '/Administrator/AlbumMana/GetArtistSongForAlbumMana'
    }).then((res) => {
        $scope.artists = JSON.parse(res.data.artists)
        $scope.songs = JSON.parse(res.data.songs)
    }, (err) => {
        alert("Failed to get data!")
    })
    $rootScope.Album = {}
    $rootScope.Album.Artist = {};


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
    $scope.RemoveImage = function () {
        $scope.Album.Image = null
        $scope.SelectedFileImage = null
    }

    $scope.addAlbum = function () {
        $scope.feature = 'Thêm Album'
        $scope.Album = {}
        $scope.Album.AlbumID = $rootScope.create_UUID()
        let date = $filter('date')(new Date(), "MM/dd/yyyy")
        $('#datepicker').val(date)
        $scope.Album.isPublic = false
        $scope.SelectedFileImage = undefined
    }

    $scope.editAlbum = function (p) {
        $scope.feature = 'Sửa playlist'
        $scope.Album = JSON.parse(JSON.stringify(p));
        let date = $filter('date')($scope.Playlist.DateCreated, "MM/dd/yyyy")
        $('#datepicker').val(date)
    }

    $scope.AlbumIDneedDelete
    $scope.deletePlaylist = function (s) {
        $scope.AlbumIDneedDelete = s.PlaylistID
    }
})