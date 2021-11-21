appMusic.controller('SongListenedController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.currentIndex = 7
    $rootScope.title = "Bài hát đã nghe"
})

appMusic.controller('PlaylistListenedController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.currentIndex = 7
    $rootScope.title = "Playlist đã nghe"
})

appMusic.controller('AlbumListenedController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.currentIndex = 7
    $rootScope.title = "Album đã nghe"
})