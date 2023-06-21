
$(".que").click(function() {
    var answerElement = $(this).next(".anw");

    if (answerElement.is(":visible")) {
        answerElement.slideUp(300); // 아코디언 닫힘
    } else {
        answerElement.css("display", "flex"); // 아코디언 열림, display를 flex로 변경
        answerElement.stop().show(0); // 아코디언 열림, show() 메서드 사용
    }

    $(this).toggleClass('on').siblings().removeClass('on');
    $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
});





