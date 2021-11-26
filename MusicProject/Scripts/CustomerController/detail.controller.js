appMusic.controller('SongDetailsController', function ($scope, $rootScope, $http, $routeParams) {
    $rootScope.currentIndex = -1
    $rootScope.currentSubIndex = -1
    $http({
        method: 'get',
        url: '/Detail/GetSong',
        params: { songID: $routeParams.song }
    }).then(function (response) {
        $scope.song = response.data
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