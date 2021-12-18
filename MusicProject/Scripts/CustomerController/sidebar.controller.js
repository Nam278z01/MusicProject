appMusic.controller('SidebarController', function ($scope, $rootScope, $window, $timeout) {
    //Như tab controls ấy
    $scope.changePage = function (index) {
        $rootScope.currentIndex = index
        $rootScope.currentSubIndex = -1
    }
    $scope.isActive = function (index) {
        return index == $rootScope.currentIndex
    }
    $scope.changeSubPage = function (index) {
        $rootScope.currentSubIndex = index
    }
    $scope.isSubActive = function (index) {
        return index == $rootScope.currentSubIndex
    }

    //Thu - Mở Sub Tab
    $window.onload = function () {
        let navParent = document.querySelectorAll('div.sidebar__navigation-link')
        navParent.forEach((item) => {
            let listSubLink = item.nextElementSibling
            let SubLink = listSubLink.querySelectorAll('.sidebar__navigation-subitem')
            let active_height = SubLink[0].clientHeight * SubLink.length;
            item.onclick = function () {
                listSubLink.style.height = active_height + 'px'
                this.classList.toggle('show')
                $timeout(function () {
                    listSubLink.style.height = item.classList.contains('show') ? active_height + 'px' : 0
                }, 0)
            }
        })
    }
})