const addReply = document.getElementById("popupButton");

addReply.addEventListener("click", function(event){
    if(loginMemberNo === ""){
        alert("로그인 후 이용해주세요.");
        event.preventDefault();
    } else {
        $(".E_popup_wrap02").css("display", "block");
        $(".E_pop_mask2").css("display", "block");
    }
});