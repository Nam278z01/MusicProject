var appMusic = angular.module("AppMusic", ['angularUtils.directives.dirPagination', 'ngRoute']);

appMusic.filter("jsDate", function () {
    return function (x) {
        return new Date(parseInt(x.substr(6)));
    };
});

appMusic.controller('HomeController', function ($scope, $rootScope, $location, $routeParams, $http) {

    //$http({
    //    method: 'get',
    //    url: './View.json'
    //}).then(function (response) {
    //    $scope.view = response.data
    //}, function (error) {
    //    alert('Failed to get the view!')
    //})
})
appMusic.controller('MusicController', function ($scope, $rootScope, $location, $routeParams, $http) {
    // albums
    //$http({
    //    method: 'get',
    //    url: './album.json'
    //}).then(function (response) {
    //    $scope.albums = response.data
    //}, function (error) {
    //    alert('Failed to get the album!')
    //})

    //songs
    //$http({
    //    method: 'get',
    //    url: './song.json'
    //}).then(function (response) {
    //    $scope.songs = response.data
    //}, function (error) {
    //    alert('Failed to get the songs!')
    //})
    //playlist
    //$http({
    //    method: 'get',
    //    url: './playlist_admin.json'
    //}).then(function (response) {
    //    $scope.playlists_admin = response.data
    //}, function (error) {
    //    alert('Failed to get the playlists!')
    //})
    //Artists
    //$http({
    //    method: 'get',
    //    url: './Artist.json'
    //}).then(function (response) {
    //    $scope.Artists = response.data
    //}, function (error) {
    //    alert('Failed to get the Artist!')
    //})
    //Thể Loại
    //$http({
    //    method: 'get',
    //    url: './Collection.json'
    //}).then(function (response) {
    //    $scope.collections = response.data
    //}, function (error) {
    //    alert('Failed to get the Collection!')
    //})



})
appMusic.controller('UserController', function ($scope, $rootScope, $location, $routeParams, $http) {
    //Admin
    //$http({
    //    method: 'get',
    //    url: './Admin.json'
    //}).then(function (response) {
    //    $scope.admins = response.data
    //}, function (error) {
    //    alert('Failed to get the Admin!')
    //})
    //Account Admin
    //$http({
    //    method: 'get',
    //    url: './Account_Admin.json'
    //}).then(function (response) {
    //    $scope.account_admin = response.data
    //}, function (error) {
    //    alert('Failed to get theAccount Admin!')
    //})
    //User
    //$http({
    //    method: 'get',
    //    url: './User.json'
    //}).then(function (response) {
    //    $scope.users = response.data
    //}, function (error) {
    //    alert('Failed to get the User!')
    //})
    //Account User
    //$http({
    //    method: 'get',
    //    url: './Account_User.json'
    //}).then(function (response) {
    //    $scope.account_user = response.data
    //}, function (error) {
    //    alert('Failed to get the User!')
    //})
})
appMusic.controller('ServiceController', function ($scope, $rootScope, $location, $routeParams, $http) {
    //Goivip
    //$http({
    //    method: 'get',
    //    url: './ServiceVip.json'
    //}).then(function (response) {
    //    $scope.servicevips = response.data
    //}, function (error) {
    //    alert('Failed to get the ServiceVip!')
    //})
    //LichSu
    //$http({
    //    method: 'get',
    //    url: './History.json'
    //}).then(function (response) {
    //    $scope.historys = response.data
    //}, function (error) {
    //    alert('Failed to get the history!')
    //})
})
appMusic.config(function ($routeProvider, $locationProvider) {
    $routeProvider
        .when("/", {
            templateUrl: "../../Areas/Admin/Views/Albums/Index.cshtml",
            controller: "AlbumsController"
        })
        //.when("/View", {
        //    templateUrl: "View.html",
        //    controller: "HomeController"
        //})
        .when("/nhac/bai-hat", {
            templateUrl: "../../Areas/Admin/Views/Songs/Index.cshtml",
            controller: "SongsController"
        })
        .when("/nhac/album", {
            templateUrl: "../../Areas/Admin/Views/Albums/Index.cshtml",
            controller: "AlbumsController"
        })

        .when("/nhac/playlist-admin", {
            templateUrl: "../../Areas/Admin/Views/PlaylistAdmins/Index.cshtml",
            controller: "PlaylistAdminsController"
        })

        .when("/nhac/nghe-si", {
            templateUrl: "../../Areas/Admin/Views/Artists/Index.cshtml",
            controller: "ArtistsController"
        })
        .when("/nhac/the-loai", {
            templateUrl: "../../Areas/Admin/Views/Collections/Index.cshtml",
            controller: "CollectionsController"
        })
        //.when("/doi-tuong/nguoi-quan-tri", {
        //    templateUrl: "U_QTV.html",
        //    controller: "UserController"
        //})
        //.when("/doi-tuong/AccQTV", {
        //    templateUrl: "U_AccQTV.html",
        //    controller: "UserController"
        //})
        //.when("/doi-tuong/nguoi-dung", {
        //    templateUrl: "U_user.html",
        //    controller: "UserController"
        //})
        //.when("/doi-tuong/AccND", {
        //    templateUrl: "U_AccUser.html",
        //    controller: "UserController"
        //})
        //.when("/dich-vu/goi-vip", {
        //    templateUrl: "S_goivip.html",
        //    controller: "ServiceController"
        //})
        //.when("/dich-vu/lich-su-giao-dich", {
        //    templateUrl: "S_lichsu.html",
        //    controller: "ServiceController"
        //})
        .otherwise({
            redirect: '/'
        })
     $locationProvider.html5Mode(true)
     $locationProvider.hashPrefix('!')
});
