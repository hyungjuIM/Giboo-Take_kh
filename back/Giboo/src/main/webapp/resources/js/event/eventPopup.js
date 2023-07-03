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

    // $("#popupButton").click(function () {

    //     $(".E_popup_wrap02").css("display", "block");

    //     $(".E_pop_mask2").css("display", "block");

    // });

    document.getElementById("E_popup1").addEventListener("click", function(event) {
        event.preventDefault();
        document.querySelector(".E_popup_wrap02").style.display = "none";
        document.querySelector(".E_pop_mask2").style.display = "none";
        
        document.querySelector(".E_popup_wrap01").style.display = "block";
        document.querySelector(".E_pop_mask1").style.display = "block";
      });
      
      document.getElementById("popup_submit1").addEventListener("click", function(event) {
        event.preventDefault();
        document.querySelector(".E_popup_wrap01").style.display = "none";
        document.querySelector(".E_pop_mask1").style.display = "none";
      });
      
      document.getElementById("popup_close1").addEventListener("click", function(event) {
        event.preventDefault();
        document.querySelector(".E_popup_wrap02").style.display = "block";
        document.querySelector(".E_pop_mask2").style.display = "block";
        
        document.querySelector(".E_popup_wrap01").style.display = "none";
        document.querySelector(".E_pop_mask1").style.display = "none";
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



function writeValidate(event) {
    const fileInput = document.getElementById("E_imgInput");

    if (fileInput.files.length === 0) {
        alert("사진을 등록해주세요!");
        event.preventDefault(); // 폼 제출을 막습니다.
        return false;
    }
    // 폼 제출이 성공한 경우 팝업을 표시합니다.
    // setTimeout(showPopup, 500); // 0.5초 (500ms) 후에 showPopup 함수 호출
    showPopup();
    return true;
}

function showPopup() {
    const popupWrap = document.querySelector(".E_popup_wrap03");
    const popMask = document.querySelector(".E_pop_mask3");


    // 팝업과 마스크를 보여줍니다.
    popupWrap.style.display = "block";
    popMask.style.display = "block";
}


