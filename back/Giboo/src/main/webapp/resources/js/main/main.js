// function numberWithCommas(x) {
//     return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
// }

// function animateNumber(element, targetNumber) {
//     var currentNumber = 0;
//     var duration = 2000;
    
//     $({ val: currentNumber }).animate({ val: targetNumber }, {
//         duration: duration,
//         step: function() {
//             currentNumber = Math.floor(this.val);
//             var num = numberWithCommas(currentNumber);
//             $(element).text(num);
//         }
//     });
// }

// animateNumber(".vol_count_person h3 span", 425);
// animateNumber(".vol_count_money h3 span", 5248002);

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
  
