appMusic.controller('SongManaController', function ($scope, $rootScope, $http, $window) {
    //Lấy về danh sách bài hát phân trang
    $scope.songs = []
    $scope.totalCount = 0
    $scope.pageSize = 10
    $scope.maxSize = 5
    $scope.pageIndex = 1
    $scope.loadSongSuccessfull2 = false // Vẫn là phục vụ ẩn hiện loading item

    getResultsPage()
       
    $scope.pageChanged = function (newPage) {
        $scope.pageIndex = newPage
        getResultsPage()
    };

    function getResultsPage() {
        $http({
            method: 'get',
            url: '/SongMana/GetSongsForMana',
            params: { pageIndex: $scope.pageIndex, pageSize: $scope.pageSize }
        }).then(function (response) {
            $scope.songs = JSON.parse(response.data.songs)
            console.log($scope.songs)
            $scope.totalCount = response.data.totalCount
            $scope.loadSongSuccessfull2 = true
        }, function (error) {
            alert('Failed to get the songs!')
        })
    }

    $scope.Song = {}
    $scope.Artists = []
    $scope.Collections = []

    $scope.addSong = function () {
        $scope.Song = {}
        $scope.Artists = []
        $scope.Collections = []
        $scope.Song.SongID = $rootScope.create_UUID()
        $scope.Song.isVip = false
        $scope.Song.Nation = 1
    }

    $scope.addSongSave = function () {
        $scope.Song.ReleaseDate = document.querySelector("#releaseDate").value
        console.log($scope.Song)
    }

    $scope.deleteSong = function (song) {
        $http({
            method: 'post',
            url: '/SongMana/DeleteSong',
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

    if ($("#datepicker-popup2").length) {
        $('#datepicker-popup2').datepicker({
            enableOnReadonly: true,
            todayHighlight: true,
        });
        $("#datepicker-popup2").datepicker("setDate", "0");
    }

    function formatDate(date) {
        const day = date && date.getDate() || -1;
        const dayWithZero = day.toString().length > 1 ? day : '0' + day;
        const month = date && date.getMonth() + 1 || -1;
        const monthWithZero = month.toString().length > 1 ? month : '0' + month;
        const year = date && date.getFullYear() || -1;
        return `${monthWithZero}/${dayWithZero}/${year}`;
    }

    $scope.itemArray = [
        { id: 1, name: 'first' },
        { id: 2, name: 'second' },
        { id: 3, name: 'third' },
        { id: 4, name: 'fourth' },
        { id: 5, name: 'fifth' },
    ];

    $scope.selected = { value: $scope.itemArray[0] };
})