appMusic.controller('CollectionController', function ($scope, $rootScope, $http, $routeParams, $location) {
    $rootScope.currentIndex = 3
    $rootScope.currentSubIndex = 5
    $scope.pickedCollections = []

    $scope.genres = $rootScope.collections.filter(collection => collection.KindofCollection == 1)
    $scope.moods = $rootScope.collections.filter(collection => collection.KindofCollection == 2)
    $scope.scenes = $rootScope.collections.filter(collection => collection.KindofCollection == 3)
    $scope.topics = $rootScope.collections.filter(collection => collection.KindofCollection == 4)

    $scope.pickedCollections = $rootScope.collections.filter(collection => collection.CollectionID == $routeParams.tl || collection.CollectionID == $routeParams.tt || collection.CollectionID == $routeParams.kc || collection.CollectionID == $routeParams.cd)
    if ($scope.pickedCollections.length > 0) {
        $scope.showpickedCollection = true;
    } else {
        $scope.showpickedCollection = false;
    }

    $scope.pickedCollection2 = function (col) {
        return $scope.pickedCollections.indexOf(col) != -1
    }

    $scope.pickedCollection = function (col, kindofCollection) {
        if (kindofCollection == 'tl') {
            $location.search("tl", col.CollectionID)
        } else if (kindofCollection == 'tt') {
            $location.search("tt", col.CollectionID)
        } else if (kindofCollection == 'kc') {
            $location.search("kc", col.CollectionID)
        } else {
            $location.search("cd", col.CollectionID)
        }
    }

    $scope.removeCollection = function (col) {
        if (col.KindofCollection == 1) {
            $location.search("tl", null)
        } else if (col.KindofCollection == 2) {
            $location.search("tt", null)
        } else if (col.KindofCollection == 3) {
            $location.search("kc", null)
        } else {
            $location.search("cd", null)
        }
    }

    let listCollection = document.querySelectorAll('.collection__pick-list-item')
    document.body.addEventListener('click', function (e) {
        if (e.target.closest('.collection__pick-list-item') == null) {
            listCollection.forEach(ele => {
                ele.classList.remove('show')
            })
        }
        if (e.target.closest('.collection__pick-item-show')) {
            e.target.closest('.collection__pick-item-show').nextElementSibling.classList.add('show')
        }
    })
})