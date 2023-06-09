// 팝업1
$(document).ready(function () {

    $("#E_popup1").click(function () {

        $(".E_popup_wrap01").css("display", "block");

        $(".E_pop_mask1").css("display", "block");

    });

    $("#popup_close1").click(function () {

        $(".E_popup_wrap01").css("display", "none");

        $(".E_pop_mask1").css("display", "none");

    });

}); 

//팝업2
$(document).ready(function () {

    $("#E_popup2").click(function () {

        $(".E_popup_wrap02").css("display", "block");

        $(".E_pop_mask2").css("display", "block");

    });

    $("#popup_close2").click(function () {

        $(".E_popup_wrap02").css("display", "none");

        $(".E_pop_mask2").css("display", "none");

    });

}); 



//팝업3
$(document).ready(function () {

    $("#E_popup3").click(function () {

        $(".E_popup_wrap03").css("display", "block");

        $(".E_pop_mask3").css("display", "block");

    });

    $(".E_popup_cont09").click(function () {

        $(".E_popup_wrap03").css("display", "none");

        $(".E_pop_mask3").css("display", "none");

    });

}); 


const imgInput = document.getElementById("E_imgInput");
const imgInputPlaceholder = document.getElementById("E_imgInputPlaceholder");

E_imgInput.addEventListener("change", () => {
    E_imgInputPlaceholder.style.opacity = "0";
});







