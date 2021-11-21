appMusic.controller('PlayMusicController', function ($scope, $rootScope) {
    let indexBackgroundImage = 0
    let backgroundImage = document.querySelectorAll('.background img')
    let mySetInterval
    $scope.open = false
    $scope.isFullScreen = function () {
        $scope.open = !$scope.open
        document.querySelector('.play-music').classList.toggle('show')
        if ($scope.open) {
            mySetInterval = setInterval(function () {
                indexBackgroundImage++
                if (indexBackgroundImage < 0) {
                    indexBackgroundImage = 9
                }
                if (indexBackgroundImage > 9) {
                    indexBackgroundImage = 0
                }
                console.log(indexBackgroundImage)
                backgroundImage.forEach(element => {
                    element.classList.remove('animation')
                    element.classList.remove('active')
                });
                backgroundImage[indexBackgroundImage].classList.add('animation')
                backgroundImage[indexBackgroundImage].classList.add('active')
            }, 10000)
            indexBackgroundImage = 0
            backgroundImage[0].classList.add('animation')
            backgroundImage[0].classList.add('active')
        } else {
            clearInterval(mySetInterval)
            indexBackgroundImage = 0
            backgroundImage.forEach(element => {
                element.classList.remove('animation')
                element.classList.remove('active')
            });
        }
    }
})