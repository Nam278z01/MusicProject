﻿appMusic.controller('RankController', function ($scope, $rootScope, $routeParams, $location, $http, $filter) {
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

    $scope.activeNav = function (index) {
        $scope.isActiveNav = index
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

    let numberofWk = getWeekNumber(addDays(new Date, -7))
    $scope.yearCurrent = $routeParams.nam || numberofWk[0]
    $scope.numberOfWeek = $routeParams.tuan || numberofWk[1]
    console.log(numberofWk)
    console.log($scope.numberOfWeek)

    let firstAlast = getFirstALastTime($scope.yearCurrent, $scope.numberOfWeek, 1)
    $scope.firstTime = new Date(firstAlast[0])
    $scope.lastTime = new Date(firstAlast[1])
    $scope.activeIncrease = addDays($scope.firstTime, 7) < new Date ? true : false
    //Tăng giảm thứ tự tuần
    $scope.weekDecrease = function () {
        $scope.firstTime = addDays($scope.firstTime, -7)
        let numberofWkNew = getWeekNumber($scope.firstTime)
        $scope.yearCurrent = numberofWkNew[0]
        $scope.numberOfWeek = numberofWkNew[1]

        $location.search({ "tuan": $scope.numberOfWeek, 'nam': $scope.yearCurrent, 'n': $routeParams.n })
    }
    $scope.weekIncrease = function () {
        if ($scope.activeIncrease) {
            $scope.firstTime = addDays($scope.firstTime, 7)
            let numberofWkNew = getWeekNumber($scope.firstTime)
            $scope.yearCurrent = numberofWkNew[0]
            $scope.numberOfWeek = numberofWkNew[1]

            $location.search({ "tuan": $scope.numberOfWeek, 'nam': $scope.yearCurrent, 'n': $routeParams.n })
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
            params: { nation: $routeParams.n, week: $scope.numberOfWeek, year: $scope.yearCurrent,quanity:20 }
        }).then(function (res) {
            console.log(res.data)
            $scope.songsBXHofWeek = JSON.parse(res.data)
            console.log($scope.songsBXHofWeek)
            console.log($scope.songsBXHofWeek[0].RankDetail.MaxACount.Max)
            $scope.songBXHTop1 = $scope.songsBXHofWeek[0]
        }, function (err) {
            alert('Failed to get songs!')
        })
    }

    console.log($scope.numberOfWeek)
    $scope.dateCurrent = $routeParams.day || new Date
    $scope.activeIncreaseDay = $scope.dateCurrent <= new Date ? true : false
    //Tăng giảm thứ tự ngày
    $scope.dayDecrease = function () { 
        $scope.dateCurrent = addDays($scope.dateCurrent, -1)
        //$scope.yearCurrent = numberofWkNew[0]
        //$scope.numberOfWeek = numberofWkNew[1]

        $location.search({ "day": $scope.dateCurrent, 'n': $routeParams.n, 'k': $routeParams.k })
    }
    $scope.dayIncrease = function () {
        if ($scope.activeIncreaseDay) {
            $scope.dateCurrent = addDays($scope.dateCurrent, 1)
            //let numberofWkNew = getWeekNumber($scope.firstTime)
            //$scope.yearCurrent = numberofWkNew[0]
            //$scope.numberOfWeek = numberofWkNew[1]
            /*  $location.search({ "tuan": $scope.numberOfWeek, 'nam': $scope.yearCurrent, 'n': $routeParams.n })*/
            $location.search({ "day": $scope.dateCurrent, 'n': $routeParams.n, 'k': $routeParams.k})
        }
    }
    console.log($scope.dateCurrent)
    //Lấy top Ngày
    if ($routeParams.k) {
        getRankSongofDay()
    }
    function getRankSongofDay() {
        $http({
            method: 'get',
            url: '/Rank/GetRankSongsofDay',
            params: { nation: $routeParams.n, day: $scope.dateCurrent }
        }).then(function (res) {
            $scope.songsBXHofday= JSON.parse(res.data)
            console.log($scope.songsBXHofday)
            console.log($scope.songsBXHofday[0].RankDetail.MaxACount.Max)
            $scope.songBXHTop1 = $scope.songsBXHofday[0]
        }, function (err) {
            alert('Failed to get songs by day!')
        })
    }

    //add Day
    function addDays(date, days) {
        const copy = new Date(Number(date))
        copy.setDate(date.getDate() + days)
        return copy
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

    function getFirstALastTime(year, week, weekDay = 0) {
        const getZeroBasedIsoWeekDay = date => (date.getDay() + 6) % 7;
        const getIsoWeekDay = date => getZeroBasedIsoWeekDay(date) + 1;
        const zeroBasedWeek = week - 1;
        const zeroBasedWeekDay = weekDay - 1;
        let days = (zeroBasedWeek * 7) + zeroBasedWeekDay;
        // Dates start at 2017-01-01 and not 2017-01-00
        days += 1;

        const firstDayOfYear = new Date(year, 0, 1);
        const firstIsoWeekDay = getIsoWeekDay(firstDayOfYear);
        const zeroBasedFirstIsoWeekDay = getZeroBasedIsoWeekDay(firstDayOfYear);

        // If year begins with W52 or W53
        if (firstIsoWeekDay > 4) {
            days += 8 - firstIsoWeekDay;
            // Else begins with W01
        } else {
            days -= zeroBasedFirstIsoWeekDay;
        }

        return [new Date(year, 0, days), addDays(new Date(year, 0, days), 6)]
    }
  
})


