appMusic.controller('RankController', function ($scope, $rootScope, $routeParams, $location, $http) {
    //Sidebar tab hoạt động là khám phá
    $rootScope.currentIndex = 4
    $rootScope.title = 'Bảng xếp hạng | My playlist'

    // Tab controls hết nha nha
    $scope.isActiveNav = function (name) {
        if ($routeParams.k == name) {
            return true
        } else {
            return false
        }
    }
    $scope.isNationNav = function (n) {
        if ($routeParams.n == n) {
            return true
        } else {
            return false
        }
    }
    $scope.changeNationNav = function (n) {
        $location.search('n', n)
    }

    let numberofWk = getWeekNumber(new Date)
    $scope.limitupofWeek = numberofWk[1]
    $scope.numbetOfWeek = $routeParams.tuan || $scope.limitupofWeek - 1

    let firstAlast = getFirstALastTime(numberofWk[0], $scope.numbetOfWeek)
    $scope.firstTime = new Date(firstAlast[0])
    $scope.lastTime = new Date(firstAlast[1])

    //Tăng giảm thứ tự tuần
    $scope.weekDecrease = function () {
        if ($scope.numbetOfWeek > 1) {
            $location.search("tuan", $scope.numbetOfWeek - 1)
        }
    }
    $scope.weekIncrease = function () {
        if ($scope.numbetOfWeek < $scope.limitupofWeek) {
            $location.search("tuan", $scope.numbetOfWeek + 1)
        }
    }

    //Lấy top Tuần
    if (!$routeParams.k) {
        getRankSongofWeek()
    }

    function getRankSongofWeek() {
        $http({
            method: 'get',
            url: 'Rank/GetRankSongsofWeek',
            params: { nation: $routeParams.n, week: $scope.numbetOfWeek }
        }).then(function (res) {
            $scope.songsBXHofWeek = JSON.parse(res.data)
            console.log($scope.songsBXHofWeek)
            console.log($scope.songsBXHofWeek[0].RankDetail.MaxACount.Max)
            $scope.songBXHTop1 = $scope.songsBXHofWeek[0]
        }, function (err) {
            alert('Failed to get songs!')
        })
    }

    function getWeekNumber(d) {
        // Copy date so don't modify original
        d = new Date(Date.UTC(d.getFullYear(), d.getMonth(), d.getDate()));
        // Set to nearest Thursday: current date + 4 - current day number
        // Make Sunday's day number 7
        d.setUTCDate(d.getUTCDate() + 4 - (d.getUTCDay() || 7));
        // Get first day of year
        var yearStart = new Date(Date.UTC(d.getUTCFullYear(), 0, 1));
        // Calculate full weeks to nearest Thursday
        var weekNo = Math.ceil((((d - yearStart) / 86400000) + 1) / 7);
        // Return array of year and week number
        return [d.getUTCFullYear(), weekNo];
    }

    function getFirstALastTime(year, week) {
        // first date of year
        let firstDateOfYear = new Date(year, 0, 1);
        // get the day of first date in the year
        let firstDayOfYear = firstDateOfYear.getDay();

        let timeofOneDay = 60 * 60 * 24 * 1000;
        let timeofOneWeek = 60 * 60 * 24 * 7 * 1000;
        // last day of the week, 6 days later
        let timeof6Day = 60 * 60 * 24 * 6 * 1000;

        // if week start from Monday
        let timeOfFirstDay = firstDateOfYear.getTime() - (timeofOneDay * (firstDayOfYear - 1)) + timeofOneWeek * (week - 1);
        let timeOfLastDay = timeOfFirstDay + timeof6Day;
        return [timeOfFirstDay, timeOfLastDay]
    }
})
