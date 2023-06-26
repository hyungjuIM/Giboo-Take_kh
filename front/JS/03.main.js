

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function animateNumber(element, targetNumber) {
    var currentNumber = 0;
    var duration = 2000;

    $({ val: currentNumber }).animate({ val: targetNumber }, {
        duration: duration,
        step: function() {
            currentNumber = Math.floor(this.val);
            var num = numberWithCommas(currentNumber);
            $(element).text(num);
        }
    });
}

var isAnimating = false;

$(window).scroll(function() {
    if (!isAnimating && window.scrollY >= 621) {
        animateNumber(".vol_count_person h3 span", 425);
        animateNumber(".vol_count_money h3 span", 5248002);
        isAnimating = true;
    }
});


let mainText = document.getElementsByClassName("vol_box");

window.addEventListener("scroll", function(){
    let value = window.scrollY;
    console.log("scrollY", value);
})


$(window).scroll(function() {
    if ($(window).scrollTop() >= 1237) {
      $(".vol_box").each(function(index) {
        var delay = index * 0.2;
        $(this).css("opacity", 0);
        $(this).css("animation", "slide 5s ease-in-out forwards");
        $(this).css("animation-delay", delay + "s");
      });
    }
  });
  

// let curPos = 0; //현재 보 있는 이지 인덱스 번
// let position = 0; // 현재 .mainImg_wrapper의 위치값
// let IMG_WIDTH = 1280; //한번 움직일 때 이동해야할 거리

// //요소 선택
// const nextBtn = document.querySelector(".swiper_button_next")
// const prevBtn = document.querySelector(".swiper_button_prev")
// const imgs = document.querySelector(".mainImg_wrapper")

// function prev(){
//     if(curPos > 0){
//         nextBtn.removeAttribute("disabled")
//         position += IMG_WIDTH

//         imgs.style.transform = 'translateX(${position}px)'
//         curPos -= 1;
//     }
//     if(curPos == 0){
//         prevBtn.setAttribute("disabled", 'true')
//     }
// }

// function next(){
//     if(curPos < 2){
//         prevBtn.removeAttribute("disabled")
//         position -= IMG_WIDTH

//         imgs.style.transform = 'translateX(${position}px)'
//         curPos += 1;
//     }

//     if(curPos == 2){
//         nextBtn.setAttribute("disabled", 'true')
//     }
// }

// function init(){
//     prevBtn.setAttribute("disabled", 'true')
//     prevBtn.addEventListener("click", prev)
//     nextBtn.addEventListener("click", next)
// }

// init();

let curPos=0;//현재 보이는 이미지 인덱스 번호


function prev(){
    if(curPos > 0){
        $("button").removeAttr("disabled")

        $($(".mainImg_slide")[curPos]).toggleClass("active")
        $($(".step")[curPos]).toggleClass("active-step")
        $(".mainImg_slide").hide();
        curPos -= 1;
        $($(".mainImg_slide")[curPos]).toggleClass("active")
        $($(".step")[curPos]).toggleClass("active-step")
        $(".active").fadeIn(800);

    }

    if(curPos == 0){
        $(".swiper_button_prev")[0].setAttribute("disabled", 'true')
    }
}

function next(){
    if(curPos < 3){
        $("button").removeAttr("disabled")
        $($(".mainImg_slide")[curPos]).toggleClass("active")
        $($(".step")[curPos]).toggleClass("active-step")
        $(".mainImg_slide").hide();
        curPos += 1;
        $($(".mainImg_slide")[curPos]).toggleClass("active")
        $($(".step")[curPos]).toggleClass("active-step")
        $(".active").fadeIn(800);

    }

    if(curPos == 3){
        $(".swiper_button_next")[0].setAttribute("disabled", 'true')
    }
}




function init(){
    $(".mainImg_slide").hide()
    $(".active").show()
    $(".swiper_button_prev").click(prev)
    $(".swiper_button_next").click(next)

}
$(document).ready(function(){
    init();
});


setInterval(fnSlide, 2000);
function fnSlide(){
    $(".mainImg_wrapper").animate({"margin-left": "-100px"}), 1200, function(){
        $(".mainImg_wrapper").css({"margin-left": "-8px"})
    }
}

