

function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function animateNumber(element, targetNumber) {
  var currentNumber = 0;
  var duration = 2000;

  $({ val: currentNumber }).animate({ val: targetNumber }, {
    duration: duration,
    step: function () {
      currentNumber = Math.floor(this.val);
      var num = numberWithCommas(currentNumber);
      $(element).text(num);
    }
  });
}

var isAnimating = false;

$(window).scroll(function () {
  if (!isAnimating && window.scrollY >= 621) {
    animateNumber(".vol_count_person h3 span", 425);
    animateNumber(".vol_count_money h3 span", 5248002);
    isAnimating = true;
  }
});


let mainText = document.getElementsByClassName("vol_box");
let isAnimationTriggered = false; // 스크롤 애니메이션이 이미 트리거되었는지 확인하기 위한 변수


window.addEventListener("scroll", function () {
  let value = window.scrollY;
  console.log("scrollY", value);

  // 스크롤 위치가 특정 값(1237)보다 크고, 스크롤 애니메이션이 아직 트리거되지 않았을 때
  if (value >= 1237 && !isAnimationTriggered) {
    for (let i = 0; i < mainText.length; i++) {
      let delay = i * 0.2;
      mainText[i].style.opacity = 0;
      mainText[i].style.animation = "slide 5s ease-in-out forwards";
      mainText[i].style.animationDelay = delay + "s";
    }
    isAnimationTriggered = true; // 스크롤 애니메이션 트리거 상태로 변경
  }
});

$(window).scroll(function () {
  if ($(window).scrollTop() >= 1237) {
    $(".vol_box").each(function (index) {
      var delay = index * 0.2;
      $(this).css("opacity", 0);
      $(this).css("animation", "slide 5s ease-in-out forwards");
      $(this).css("animation-delay", delay + "s");
    });

    isAnimationTriggered = true; // 스크롤 애니메이션 트리거 상태로 변경

  }
});




let curPos = 0; // 현재 보이는 이미지 인덱스 번호
let intervalId; // setInterval 함수의 반환값을 저장하기 위한 변수
const INTERVAL_DURATION = 3000; // 이미지가 자동으로 넘어가는 간격 (ms)

// 요소 선택
const nextBtn = $(".swiper_button_next");
const prevBtn = $(".swiper_button_prev");
const slides = $(".mainImg_slide");

function prev() {
  if (curPos > 0) {
    $("button").removeAttr("disabled");

    $(slides[curPos]).toggleClass("active");
    $(slides[curPos]).hide();
    curPos -= 1;
    $(slides[curPos]).toggleClass("active");
    $(slides[curPos]).fadeIn(800);
  } else {
    // 첫 번째 슬라이드일 경우 이전 버튼을 누르면 마지막 슬라이드로 이동
    $(slides[curPos]).toggleClass("active");
    $(slides[curPos]).hide();
    curPos = slides.length - 1;
    $(slides[curPos]).toggleClass("active");
    $(slides[curPos]).fadeIn(800);
  }

  if (curPos === 0) {
    $(".swiper_button_prev").attr("disabled", "true");
  }
}

function next() {
  if (curPos < slides.length - 1) {
    $("button").removeAttr("disabled");
    $(slides[curPos]).toggleClass("active");
    $(slides[curPos]).hide();
    curPos += 1;
    $(slides[curPos]).toggleClass("active");
    $(slides[curPos]).fadeIn(800);
  } else if (curPos === slides.length - 1) {
    // 마지막 슬라이드일 경우 다음 버튼을 누르면 두 번째 슬라이드로 이동
    $(slides[curPos]).toggleClass("active");
    $(slides[curPos]).hide();
    curPos = 1;
    $(slides[curPos]).toggleClass("active");
    $(slides[curPos]).fadeIn(800);
  }

  if (curPos === slides.length - 1) {
    $(".swiper_button_next").attr("disabled", "true");
  }
}

function startAutoSlide() {
  intervalId = setInterval(function () {
    if (curPos === slides.length - 1) {
      // 마지막 슬라이드일 경우 다음 버튼을 누르면 두 번째 슬라이드로 이동
      $(slides[curPos]).toggleClass("active");
      $(slides[curPos]).hide();
      curPos = 1;
      $(slides[curPos]).toggleClass("active");
      $(slides[curPos]).fadeIn(800);
    } else {
      next();
    }
  }, INTERVAL_DURATION);
}

function stopAutoSlide() {
  clearInterval(intervalId);
}

function init() {
  slides.hide();
  $(slides[curPos]).show();
  $(".swiper_button_prev").click(prev);
  $(".swiper_button_next").click(next);
  startAutoSlide(); // 자동 슬라이드 시작
}

$(document).ready(function () {
  init();
});

// 마우스가 이미지 위에 있을 때 자동 슬라이드 중지
$(".main_swiper").mouseover(stopAutoSlide);

// 마우스가 이미지 밖으로 나갈 때 자동 슬라이드 다시 시작
$(".main_swiper").mouseout(startAutoSlide);



var allSlides = document.querySelector('.allSlides'),
  slide = document.querySelectorAll('.allSlides li'),
  currentIdx = 0, //현재 인덱스 
  slideCount = slide.length,
  slideWidth = 350,
  slideMargin = 20,
  volPrevBtn = document.querySelector('.vol_prev'),
  volNextBtn = document.querySelector('.vol_next');

allSlides.style.width = (slideWidth + slideMargin) * slideCount - slideMargin + 'px'; // set the width of the ul

function moveSlide(num) {
  allSlides.style.left = -num * (slideWidth + slideMargin) + 'px';
  currentIdx = num;
}

volNextBtn.addEventListener('click', function () {
  if (currentIdx < slideCount - 3) {
    moveSlide(currentIdx + 1);
  } else {
    moveSlide(0);
  }
});

volPrevBtn.addEventListener('click', function () {
  if (currentIdx > 0) {
    moveSlide(currentIdx - 1);
  } else {
    // moveSlide(0);
  }

});


var doAllSlides = document.querySelector('.doAllSlides'),
  doSlide = document.querySelectorAll('.doAllSlides li'),
  doCurrentIdx = 0, //현재 인덱스 
  doSlideCount = doSlide.length,
  doSlideWidth = 750,
  doSlideMargin = 20,
  doVolPrevBtn = document.querySelector('.do_prev'),
  doVolNextBtn = document.querySelector('.do_next');

doAllSlides.style.width = (doSlideWidth + doSlideMargin) * doSlideCount - doSlideMargin + 'px'; // set the width of the ul

function doMoveSlide(num) {
  doAllSlides.style.left = -num * (doSlideWidth + doSlideMargin) + 'px';
  doCurrentIdx = num;
}

doVolNextBtn.addEventListener('click', function () {
  if (doCurrentIdx < doSlideCount -2) {
    doMoveSlide(doCurrentIdx + 1);
  } else {
    doMoveSlide(0);
  }
});

doVolPrevBtn.addEventListener('click', function () {
  if (doCurrentIdx > 0) {
    doMoveSlide(doCurrentIdx - 1);
  } else {
    // moveSlide(0);
  }

});

