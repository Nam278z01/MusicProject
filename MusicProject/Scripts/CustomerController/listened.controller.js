appMusic.controller('SongListenedController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.currentIndex = 7
    $rootScope.title = "Bài hát đã nghe | My music"
})

appMusic.controller('PlaylistListenedController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.currentIndex = 7
    $rootScope.title = "Playlist đã nghe | My music"
})

appMusic.controller('AlbumListenedController', function ($scope, $rootScope, $location, $routeParams, $http) {
    $rootScope.currentIndex = 7
    $rootScope.title = "Album đã nghe | My music"
})

