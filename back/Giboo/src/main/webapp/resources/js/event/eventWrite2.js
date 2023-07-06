// const imgInput = document.getElementById("imgInput");
// const imgInputPlaceholder = document.getElementById("imgInputPlaceholder");

// imgInput.addEventListener("change", () => {
//     imgInputPlaceholder.style.opacity = "0";
// });

// function noticeWriteValidate(){
//     const eventTitle = document.getElementsByName("eventTitle")[0];
//     const enrollDate = document.querySelector("[name='enrollDate']");
//     const enrollDate = document.querySelector("[name='enrollDate']");
//     const enrollDate = document.querySelector("[name='enrollDate']");
//     const enrollDate = document.querySelector("[name='enrollDate']");
//     const enrollDate = document.querySelector("[name='enrollDate']");
//     const enrollDate = document.querySelector("[name='enrollDate']");

//     if(eventTitle.value.trim().length == 0){
//         alert("제목을 입력해주세요!!!");
//         eventTitle.value = "";
//         eventTitle.focus();
//         return false;
//     }

//     if(enrollDate.value.trim().length == 0){
//         alert("내용을 입력해주세요!!!");
//         enrollDate.value = "";
//         enrollDate.focus();
//         return false;
//     }



//     return true;
// }

  // 목록보기
  (function() {
    const eMoreBtnBox = document.getElementsByClassName("list");
  
    if (eMoreBtnBox.length > 0) { // 목록으로 버튼이 화면에 있을 때만 이벤트 추가
      eMoreBtnBox[0].addEventListener("click", function() { // 첫 번째 요소 선택
        const pathname = location.pathname; // 주소상에서 요청 경로 반환
        let url = pathname.substring(0, pathname.indexOf("/", 1));
        url += "/event/eventList";
  
        const params = new URL(location.href).searchParams;
        let cp;
  
        if (params.get("cp") != null) { // 쿼리스트링에 cp가 있을 경우
          cp = "cp=" + params.get("cp");
        } else {
          cp = "cp=1";
        }
  
        location.href = url;
      });
    }
  })();
  