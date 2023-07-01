$(document).ready(function(){


// 로그인 유무 
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




// 즐겨찾기
const eFavBtn = document.getElementById("eFavBtn");

eFavBtn.addEventListener("click", function() {
     // 1) 로그인이 되어있나? -> 전역변수 loginMemberNo 이용
     if (loginMemberNo == "") { // 로그인 X
        alert("로그인 후 이용해주세요.");
    } else {
    $.ajax({
        url: contextPath + "/event/insertEventFav",
        data: {
            "memberNo": loginMemberNo,
            "eventNo": eventNo
        },
        type: "post",
        success: function(result) {
            if (result === "red") { // 색상 변경 성공
                alert("즐겨찾기에 등록되었습니다.");
                // mhBtnHe.classList.add("loggedIn"); // 버튼에 클래스 추가 (예: "loggedIn")
                eFavBtn.style.backgroundColor = "red"; // 색상 변경
                console.log("즐찾성공")
            } else { // 실패
                alert("이미 추가한 즐겨찾기 입니다.");
            }
        },
        error: function(req, status, error) {
            console.log("즐겨찾기 등록 실패");
            console.log(req.responseText);
        }
    });    
}
})
});