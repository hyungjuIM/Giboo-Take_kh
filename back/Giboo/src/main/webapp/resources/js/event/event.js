// 버튼 클릭 이벤트 핸들러
// document.getElementById("popupButton").addEventListener("click", function() {
//     var eventNo = ${eventNo}; // eventNo 값 가져오기
//     var cp = ${cp}; // cp 값 가져오기
    
//     // var url = "/eventPopup/" + eventNo + "?cp=" + cp;
//     var url = "${eventPopupUrl}";

//     window.location.href = url; // 페이지 이동
// });

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

