appMusic.controller('ArtistController', function ($scope, $rootScope, $http, $window) {
    $http({
        method: 'get',
        url: '/Artist/GetArtist'
    }).then(function (response) {
        $scope.Artists = response.data
    }, function (error) {
        alert('Failed to get the Artist!')
    })
})