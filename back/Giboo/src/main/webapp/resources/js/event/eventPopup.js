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

