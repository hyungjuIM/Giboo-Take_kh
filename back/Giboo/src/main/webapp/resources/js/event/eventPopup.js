// 파일 선택 시 실행될 함수
function handleImagePreview() {
    // 선택된 파일 가져오기
    var file = document.getElementById('E_imgInput').files[0];

    // FileReader 객체 생성
    var reader = new FileReader();

    // 파일 읽기가 완료되었을 때 실행되는 이벤트 핸들러
    reader.onload = function(e) {
        // 미리보기 이미지 엘리먼트에 선택된 이미지 표시
        document.getElementById('preview-image').src = e.target.result;
    }

    // 파일 읽기 실행
    reader.readAsDataURL(file);
}


// // 팝업1
// $(document).ready(function () {

//     $("#E_popup1").click(function () {

//         $(".E_popup_wrap01").css("display", "block");

//         $(".E_pop_mask1").css("display", "block");

//         $(".E_popup_wrap02").css("display", "none");

//         $(".E_pop_mask2").css("display", "none");
//     });

//     $("#popup_close1").click(function () {

//         $(".E_popup_wrap01").css("display", "none");

//         $(".E_pop_mask1").css("display", "none");
//     });

//     $("#popup_submit1").click(function () {

//         $(".E_popup_wrap01").css("display", "none");

//         $(".E_pop_mask1").css("display", "none");

//         $(".E_popup_wrap02").css("display", "block");

//         $(".E_pop_mask2").css("display", "block");
//     });

// }); 

//팝업2
$(document).ready(function () {

    // $("#popupButton").click(function () {

    //     $(".E_popup_wrap02").css("display", "block");

    //     $(".E_pop_mask2").css("display", "block");

    // });

    $("#E_popup1").click(function (event) {
        event.preventDefault(); // 폼 제출 방지
        $(".E_popup_wrap02").css("display", "none");
        $(".E_pop_mask2").css("display", "none");

    });

}); 



//팝업3
// $(document).ready(function () {

//     $("#E_popup3").click(function () {

//         $(".E_popup_wrap03").css("display", "block");

//         $(".E_pop_mask3").css("display", "block");

//     });

//     $(".E_popup_cont09").click(function () {

//         $(".E_popup_wrap03").css("display", "none");

//         $(".E_pop_mask3").css("display", "none");

//     });

// }); 







//동일한 이벤트 참여자 중복검사(ajax)


// const participationB = document.getElementById("participationB");

// participationB.addEventListener("click", function(){
    
//     $.ajax({

//     url: "/eventDupCheck",
//     data: { "memberNo": loginMemberNo,
//             "eventNo": eventNo },
//     type: "GET",

//     success: function (result) {

//         if (result == 0) {// 해당 이벤트참여자No, 이벤트No  중복 X
//             alert("이벤트 참여가능함");
//              console.log("참여가능");
            

//         } else {// 해당 이벤트참여자No, 이벤트No  중복 o

//             alert("해당 이벤트 참여했음");
//             console.log("참여불가능");

//         }
//     },
//     error: function () { //비동기 통신 에러
//         console.log("에러 발생");
//     }
// });

// })





//동일한 이벤트 참여자 중복검사 (ajax)
// const loginMemberNo = document.getElementById("");
// const eventNo = document.getElementById("");

// addReply.addEventListener("click", function(event){
//     if(loginMemberNo === ""){
        
//     } else {
        
//     }
// });




// $.ajax({

//     url: "participationDupCheck",
//     data: { "memberNo": loginMemberNo,
//             "eventNo": eventNo },
//     type: "GET",

//     success: function (result) {

//         if (result == 0) {// 해당 이벤트참여자No, 이벤트No  중복 X

            

//         } else {// 해당 이벤트참여자No, 이벤트No  중복 o

//             alert("해당 이벤트 참여했음");

//         }
//     },
//     error: function () { //비동기 통신 에러
//         console.log("에러 발생");
//     }
// });



// 즐겨찾기
const eFavBtn = document.getElementById("eFavBtn");

eFavBtn.addEventListener("click", function(event) {

     // 1) 로그인이 되어있나? -> 전역변수 loginMemberNo 이용
     if (loginMemberNo == "") { // 로그인 X
        alert("로그인 후 이용해주세요.");
        event.preventDefault();

    } else { $.ajax({
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
    
    event.preventDefault(); // 이벤트 전파 중지
}
})


const popupButton = document.getElementById("popupButton");
popupButton.addEventListener("click", function(event) {

    $.ajax({
        url: contextPath + "/eventDetailMain/{eventNo}",
        data: {
            "memberNo1": loginMemberNo,
            "eventNo": eventNo
        },
        type: "post",
        success: function(result) {
            if (result === "participation") { 
                alert("이벤트 참여를 위해 인증사진 등록이 필요합니다");
            } else { // 실패
                alert("이미 추가한 즐겨찾기 입니다.");
            }
        },
        error: function(req, status, error) {
            console.log("이벤트 참여 인증 등록 실패");
            console.log(req.responseText);
        }
    });
})
