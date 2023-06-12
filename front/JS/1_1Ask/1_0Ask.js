
$(document).ready(function () {
    $(".ask_close").click(function () {
        $(".AWrap").css("display", "none");
        $(".QnABtn-icon").css("display", "block");

    });
}); 

$(document).ready(function () {
    $(".QnABtn-icon").click(function () {
        $(".AWrap").css("display", "block");
        $(".QnABtn-icon").css("display", "none");

    });
}); 