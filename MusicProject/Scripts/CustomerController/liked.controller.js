appMusic.controller('SongLikedController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.currentIndex = 6
    $rootScope.title = "Bài hát đã thích"
})

appMusic.controller('PlaylistLikedController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.currentIndex = 6
    $rootScope.title = "Playlist đã thích"
})

appMusic.controller('AlbumLikedController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.currentIndex = 6
    $rootScope.title = "Album đã thích"
})
