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

animateNumber(".vol_count_person h3 span", 425);
animateNumber(".vol_count_money h3 span", 5248002);
