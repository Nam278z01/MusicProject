
appMusic.controller('SlideController', function ($scope) {
    let slideContain = document.querySelector('.home-main__slide')
    let slide = slideContain.querySelector('.home-main__slide-list')
    let slideItem = slide.querySelectorAll('.home-main__slide-item')
    let lengthSlideItem = slideItem.length
    slide.append(slideItem[0].cloneNode(true))
    slide.prepend(slideItem[lengthSlideItem - 1].cloneNode(true))
    let btnSlidePick = slideContain.querySelectorAll('.home-main__slide-pick-item')

    const app = {
        currentIdx: 1,
        walk: 0,
        startX: 0,
        isDown: false,
        isRun: false,
        time1: new Date,
        time2: new Date,
        // Xử lý sự kiện
        handleEvent() {
            const _this = this

            // Click để chuyển slide
            btnSlidePick.forEach((ele, idx) => {
                ele.onclick = function () {
                    if (!this.classList.contains('picked')) {
                        _this.currentIdx = idx + 1
                        _this.moveSlide(_this.currentIdx)
                    }
                }
            })

            // Tự động chạy slide sau 5s
            let mySetInterval = setInterval(() => {
                if (this.currentIdx == lengthSlideItem + 1) { //Bé transitionend ko chạy nên phải làm cái này ...
                    this.currentIdx = 1
                }
                _this.moveSlide(_this.currentIdx + 1)
            }, 3000)

            // Dừng slide khi mouseover lên toàn bộ silde
            'mouseover touchstart'.split(' ').forEach(ele => {
                slideContain.addEventListener(ele, () => {
                    clearInterval(mySetInterval)
                    mySetInterval = undefined
                })
            })

            // Kích hoạt auto chạy slide khi mouseleave lên toàn bộ silde
            'mouseleave touchend'.split(' ').forEach(ele => {
                slideContain.addEventListener(ele, () => {
                    if (mySetInterval == undefined) {
                        mySetInterval = setInterval(() => {
                            if (this.currentIdx == lengthSlideItem + 1) {
                                this.currentIdx = 1
                            }
                            _this.moveSlide(_this.currentIdx + 1)
                        }, 3000)
                    }
                })
            })

            // Kéo slide
            'mousedown touchstart'.split(' ').forEach(ele => {
                slide.addEventListener(ele, e => {
                    if (!_this.isRun) {
                        _this.isDown = true
                        _this.time1 = new Date()
                        _this.walk = 0
                        _this.startX = (e.clientX || e.changedTouches[0].clientX) - slide.offsetLeft
                        slide.classList.remove('animation')
                        slideItem.forEach(ele => {
                            ele.removeEventListener('click', preventEvent)
                        })
                    }
                    // slide.classList.remove('animation') Bật lên để bỏ độ trễ khi drag thì khi click transition đang chạy sẽ mất event transtionend (Đã xử lý bằng isRun)
                })
            })
            'mouseup touchend'.split(' ').forEach(ele => {
                slide.addEventListener(ele, () => {
                    _this.isDown = false
                    _this.time2 = new Date()
                    _this.moveSlideWhenDrag(_this.walk)
                    _this.moveSlide(_this.currentIdx)
                })
            })
            let preventEvent = function (e) {
                e.preventDefault()
            }
            'mousemove touchmove'.split(' ').forEach(ele => {
                slide.addEventListener(ele, e => {
                    if (!_this.isDown) {
                        return
                    } else {
                        e.preventDefault()
                        _this.walk = (_this.startX - ((e.clientX || e.changedTouches[0].clientX) - slide.offsetLeft)) / slide.offsetWidth * 100
                        slide.style.transform = 'translateX(' + (-(100 * _this.currentIdx + _this.walk)) + '%)'
                        slideItem.forEach(ele => {
                            ele.addEventListener('click', preventEvent)
                        })
                    }
                })
            })
            'mouseleave touchcancel'.split(' ').forEach(ele => {
                slide.addEventListener(ele, () => {
                    if (_this.isDown) {
                        time2 = new Date()
                        _this.moveSlideWhenDrag(_this.walk)
                        _this.moveSlide(_this.currentIdx)
                    }
                    _this.isDown = false
                })
            })

            //Loop slide (Hình như transitionend ko hoạt động khi click vào cửa sổ khác (ko trong cửa sổ nó đang chạy))
            slide.ontransitionend = () => {
                if (_this.currentIdx == lengthSlideItem + 1) {
                    _this.currentIdx = 1
                    slide.classList.remove('animation')
                    slide.style.transform = 'translateX(-' + 100 * _this.currentIdx + '%)'
                }
                if (_this.currentIdx == 0) {
                    _this.currentIdx = lengthSlideItem
                    slide.classList.remove('animation')
                    slide.style.transform = 'translateX(-' + 100 * _this.currentIdx + '%)'
                }
                _this.removeClassOfBtnSlide()
                _this.isRun = false
            }
        },
        moveSlideWhenDrag(distance) {
            if ((distance > 40 && this.currentIdx < lengthSlideItem + 1) || (distance > 1 && this.timeSpan(this.time1, this.time2) < 250)) {
                this.currentIdx++
                this.isRun = true
            }
            if ((distance < -40 && this.currentIdx > 0) || (distance < -1 && this.timeSpan(this.time1, this.time2) < 250)) {
                this.currentIdx--
                this.isRun = true
            }
        },
        moveSlide(num) {
            this.currentIdx = num
            slide.classList.add('animation')
            slide.style.transform = 'translateX(-' + 100 * this.currentIdx + '%)'
        },
        // xóa class piked ở nút chọn chuyển slide
        removeClassOfBtnSlide() {
            btnSlidePick.forEach(ele => {
                ele.classList.remove('picked')
            })
            btnSlidePick[this.currentIdx - 1].classList.add('picked')
        },
        timeSpan(time1, time2) {
            return time2.getTime() - time1.getTime()
        },
        start() {
            // Xử lý sự kiện
            this.handleEvent()
        }
    }

    app.start()
})

appMusic.controller('SlideClickController', function ($scope, $window, $interval) {
    function Slide(options) {
        let btnNext = options.selector.querySelector('.list-playlist__btn-next')
        let btnPrev = options.selector.querySelector('.list-playlist__btn-prev')
        let slide = options.selector.querySelector('.list-playlist__slide > .grid')

        let eleInViewOfThisSlide
        let oneJump
        
        let currentIdx = 0
        let countEleSlide = slide.children[0].childElementCount

        if (countEleSlide > 0) {
            let slideChildren = slide.querySelector('.list-playlist__item')

            //Responsive silde ó
            if ($window.innerWidth < 740) {
                eleInViewOfThisSlide = 2
                oneJump = slideChildren.offsetWidth + 8 //Chắc là + 16!
            } else if (window.innerWidth < 1113) {
                eleInViewOfThisSlide = 4
                oneJump = slideChildren.offsetWidth + 16
            } else if (window.innerWidth < 1800) {
                eleInViewOfThisSlide = 5
                oneJump = slideChildren.offsetWidth + 16
            } else {
                eleInViewOfThisSlide = 6
                oneJump = slideChildren.offsetWidth + 16
            }

            // Next slide
            btnNext.onclick = () => {
                if (currentIdx < countEleSlide - eleInViewOfThisSlide) {
                    if (countEleSlide - currentIdx < 2 * eleInViewOfThisSlide) {
                        moveSlide(countEleSlide - eleInViewOfThisSlide)
                    }
                    else {
                        moveSlide(currentIdx + eleInViewOfThisSlide)
                    }
                }
                if (currentIdx >= countEleSlide - eleInViewOfThisSlide) {
                    btnNext.classList.add('disabled')
                }
                btnPrev.classList.remove('disabled')
            }

            // Prev slide
            btnPrev.onclick = () => {
                if (currentIdx > 0) {
                    if (currentIdx < eleInViewOfThisSlide) {
                        moveSlide(0);
                    } else {
                        moveSlide(currentIdx - eleInViewOfThisSlide);
                    }
                }
                if (currentIdx <= 0) {
                    btnPrev.classList.add('disabled')
                }
                btnNext.classList.remove('disabled')
            }

            // Move slide
            function moveSlide(index) {
                slide.style.transform = `translateX(-${oneJump * index}px)`
                slide.style.transition = 'transform ' + options.duration + 'ms linear'
                currentIdx = index
            }

            // Responsive slide ó
            $window.addEventListener('resize', () => {
                if (window.innerWidth < 740) {
                    eleInViewOfThisSlide = 2
                    oneJump = slideChildren.offsetWidth + 8
                } else if (window.innerWidth < 1113) {
                    eleInViewOfThisSlide = 4
                    oneJump = slideChildren.offsetWidth + 16
                } else if (window.innerWidth < 1800) {
                    eleInViewOfThisSlide = 5
                    oneJump = slideChildren.offsetWidth + 16
                } else {
                    eleInViewOfThisSlide = 6
                    oneJump = slideChildren.offsetWidth + 16
                }
                if (countEleSlide - currentIdx - eleInViewOfThisSlide > 0)
                    btnNext.classList.remove('disabled')
                else {
                    if (currentIdx != 0)
                        btnPrev.classList.remove('disabled')
                }
                slide.style.transitionDuration = '0s'
                slide.style.transform = `translateX(-${oneJump * currentIdx}px)`
            })
            return true
        } else {
            alert("hehe")
            return false
        }
    }

    let slideOne = document.querySelector('#slide-one')
    let slideSecond = document.querySelector('#slide-second')
    let slideThird = document.querySelector('#slide-third')
    let slideTop = document.querySelector('#slide-top')

    Slide({
        selector: slideTop,
        duration: 300
    })

    // Phải xử lý kiểu này bởi vì nếu chưa kịp lấy data thì ko chuyển đc slide (ko biết có cách nào đỡ chuối hơn ko...)
    let myInterval = $interval(function () {
        let check = Slide({
            selector: slideOne,
            duration: 300
        })
        if (check) {
            $interval.cancel(myInterval)
        }
    }, 1000)

    let myInterval2 = $interval(function () {
        let check = Slide({
            selector: slideSecond,
            duration: 300
        })
        if (check) {
            $interval.cancel(myInterval2)
        }
    }, 1000)

    let myInterval3 = $interval(function () {
        let check = Slide({
            selector: slideThird,
            duration: 300
        })
        if (check) {
            $interval.cancel(myInterval3)
        }
    }, 1000)
})