appMusic.controller('CollectionController', function ($scope, $rootScope, $http, $routeParams, $location) {
    $rootScope.currentIndex = 3
    $rootScope.currentSubIndex = 5
    $scope.pickedCollections = []
    $http({
        method: 'get',
        url: './assets/js/dataCollection.json'
    }).then(function (res) {
        $scope.collections = res.data
        $scope.genres = $scope.collections.filter(collection => collection.KindofCollection == 1)
        $scope.moods = $scope.collections.filter(collection => collection.KindofCollection == 2)
        $scope.scenes = $scope.collections.filter(collection => collection.KindofCollection == 3)
        $scope.topics = $scope.collections.filter(collection => collection.KindofCollection == 4)
        $scope.pickedCollections = $scope.collections.filter(collection => collection.CollectionID == $routeParams.tl || collection.CollectionID == $routeParams.tt || collection.CollectionID == $routeParams.kc || collection.CollectionID == $routeParams.cd)
        if ($scope.pickedCollections.length > 0) {
            $scope.showpickedCollection = true;
        } else {
            $scope.showpickedCollection = false;
        }
    }, function (err) {
        alert("Failed to get collections!")
    })

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
    }
    )
})