﻿appMusic.controller('SongDetailsController', function ($scope, $rootScope, $http, $routeParams) {
    $rootScope.currentIndex = -1
    $rootScope.currentSubIndex = -1
    $http({
        method: 'get',
        url: '/Detail/GetSong',
        params: { songID: $routeParams.song }
    }).then(function (response) {
        $scope.song = response.data.song
        $scope.songs = response.data.songs
        //start: Title
        $rootScope.title = $scope.song.Song.SongName + " | "
        var length = $scope.song.Artists.length
        for (var i = 0; i < length; i++) {
            $rootScope.title += $scope.song.Artists[i].ArtistName
            if (i != length - 1) {
                $rootScope.title += ", "
            }
        }
        $rootScope.title += " | MyMusic"
        //end: Title
    }, function (error) {
        alert('Failed to get the song!')
    })

    $scope.isShorten = true
    $scope.titleShorten = "Xem thêm"
    $scope.seeMore = function () {
        $scope.isShorten = !$scope.isShorten
        if ($scope.isShorten) {
            $scope.titleShorten = "Xem thêm"

        } else {
            $scope.titleShorten = "Thu gọn"
        }
    }
    function copyTextToClipboard(text) {
        var textArea = document.createElement("textarea");
        textArea.style.position = 'fixed';
        textArea.style.top = 0;
        textArea.style.left = 0;

        textArea.style.width = '2em';
        textArea.style.height = '2em';

        textArea.style.padding = 0;

        textArea.style.border = 'none';
        textArea.style.outline = 'none';
        textArea.style.boxShadow = 'none';

        textArea.style.background = 'transparent';


        textArea.value = text;

        document.body.appendChild(textArea);
        textArea.focus();
        textArea.select();

        document.body.removeChild(textArea);
    }

    var copyBtn = document.querySelector('.btn-copy')

    copyBtn.addEventListener('click', function (event) {
        let text = document.querySelector('.song-detail__lyric-script').textContent
        copyTextToClipboard(text);
    });
})

appMusic.controller('PlaylistADetailsController', function ($scope, $rootScope, $http, $routeParams) {
    $rootScope.currentIndex = -1
    $rootScope.currentSubIndex = -1
    $http({
        method: 'get',
        url: '/Detail/GetPlaylistAdminwithSongs',
        params: { playlistID: $routeParams.id }
    }).then(function (response) {
        $scope.playlist = response.data.playlist
        $scope.playlists = response.data.playlists
        $rootScope.title = "Playlist | " + $scope.playlist.PlaylistAdmin.PlaylistName + " | MyMusic"
    }, function (error) {
        alert('Failed to get the playlist!')
    })
})

appMusic.controller('PlaylistUDetailsController', function ($scope, $rootScope, $http, $routeParams, $location) {
    $rootScope.currentIndex = -1
    $rootScope.currentSubIndex = -1
    $http({
        method: 'get',
        url: '/Detail/GetPlaylistUserwithSongs',
        params: { playlistID: $routeParams.id }
    }).then(function (response) {
        if (response.data.access) {
            $scope.playlist = response.data.playlist
            $rootScope.title = "Playlist | " + $scope.playlist.PlaylistUser.PlaylistName + " | MyMusic"
        } else {
            $location.path('/')
        }
    }, function (error) {
        alert('Failed to get the playlist!')
    })
})