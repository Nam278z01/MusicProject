appMusic.controller('CollectionController', function ($scope, $rootScope, $http, $routeParams, $location, $window, $interval) {
    $rootScope.title = 'Tuyển tập playlist hot | My music'
    //Sidebar tab hoạt động là trang nghe gì hôm nay
    $rootScope.currentIndex = 3
    //Sidebar tab con (của khám phá & nghe gì hôm nay) hoạt động là trang tuyển tập
    $rootScope.currentSubIndex = 5

    // Cần interval vì thỉnh thoảng lấy data hơi lâu làm cho trang tuyển tập ko hiển thị collection và phải chạy lại trang mới hiển thị
    let myInterval = $interval(getSuccessCol, 1000)

    $scope.pickedCollections = []
    getSuccessCol()
    function getSuccessCol() {
        //Nếu đã lấy được collection thì tách collection ra làm 4 loại khác nhau
        if ($rootScope.collections.length != 0) {
            $scope.genres = $rootScope.collections.filter(collection => collection.KindofCollection == 1)
            $scope.moods = $rootScope.collections.filter(collection => collection.KindofCollection == 2)
            $scope.scenes = $rootScope.collections.filter(collection => collection.KindofCollection == 3)
            $scope.topics = $rootScope.collections.filter(collection => collection.KindofCollection == 4)

            //Lấy về danh sách colletion được chọn (khi được chọn collectin ID hiển thị trên url)
            $scope.pickedCollections = $rootScope.collections.filter(collection => collection.CollectionID == $routeParams.tl || collection.CollectionID == $routeParams.tt || collection.CollectionID == $routeParams.kc || collection.CollectionID == $routeParams.cd)
            //Lấy xong thi hủy interval đi thôiiii
            $interval.cancel(myInterval)
        }
    }

    // Ẩn và hiển thị title ("tất cả tuyển tập" / "đã chọn" ấy)
    if ($scope.pickedCollections.length > 0) {
        $scope.showpickedCollection = true;
    } else {
        $scope.showpickedCollection = false;
    }

    // Hiển thị màu nhận biết cho list collection đã chọn, ngược lại thì ko hiển thị màu
    $scope.pickedCollection2 = function (col) {
        return $scope.pickedCollections.indexOf(col) != -1
    }
    
    // Thay đổi colletion khi click lên url
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

    // Loại bỏ collection khi click "x" trên mỗi colletion đã chọn
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

    // Lấy về list playlist tùy colletion đã chọn
    $scope.playlists = []
    $scope.totalCount = 0
    $scope.pageSize = 24
    $scope.maxSize = 5
    $scope.pageIndex = $routeParams.page || 1
    // Dùng để tắt giao diện loading các item
    $scope.loadSongSuccessfull = false

    getResultsPage($scope.pageIndex)

    $scope.pageChanged = function (newPage) {
        $location.search("page", newPage)
    };

    function getResultsPage(index) {
        $scope.pageIndex = index
        $http({
            method: 'get',
            url: '/Collection/GetPlaylistsByCollectionsPage',
            params: { pageIndex: $scope.pageIndex, pageSize: $scope.pageSize, genre: $routeParams.tl, mood: $routeParams.tt, scene: $routeParams.kc, topic: $routeParams.cd }
        }).then(function (response) {
            $scope.playlistAdmins = response.data.playlistAdmins
            $scope.totalCount = response.data.totalCount
            $scope.loadSongSuccessfull = true
        }, function (error) {
            alert('Failed to get the playlists!')
        })
    }

    // Ẩn hiện modal "Xem thêm ..." của collection
    let listCollection = document.querySelectorAll('.collection__pick-list-item')
    document.body.addEventListener('click', function (e) {
        // Nếu click ngoài cái modal xem thêm ấy thì ẩn nó đi
        if (e.target.closest('.collection__pick-list-item') == null) {
            listCollection.forEach(ele => {
                ele.classList.remove('show')
            })
        }
        // Nếu click đúng nút "Xem thêm ..." thì hiện modal lên
        if (e.target.closest('.collection__pick-item-show')) {
            e.target.closest('.collection__pick-item-show').nextElementSibling.classList.toggle('show')
        }
    })
})