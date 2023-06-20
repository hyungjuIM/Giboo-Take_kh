
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




$(document).ready(function() {
    $('.cs-inquryBtn a').on('click', function(e) {
        e.preventDefault(); // Prevents the default link behavior

        var category = $(this).text(); // Gets the category name from the link text

        // Makes an AJAX request to the server
        $.ajax({
            type: 'GET',
            url: '/category', // Change this to your service URL
            data: {
                category: category
            },
            dataType: JSON,
            success: function(response) {
                // Update the HTML page with the received response
                // You'll have to adjust this based on the structure of your response
                $('#Accordion_wrap').html(response);
            },
            error: function(xhr, status, error) {
                console.error('An error occurred: ' + error);
            }
        });
    });
});
