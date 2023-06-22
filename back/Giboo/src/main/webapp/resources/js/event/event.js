// 버튼 클릭 이벤트 핸들러
document.getElementById("popupButton").addEventListener("click", function() {
    var eventNo = ${eventNo}; // eventNo 값 가져오기
    var cp = ${cp}; // cp 값 가져오기
    
    // var url = "/eventPopup/" + eventNo + "?cp=" + cp;
    var url = "${eventPopupUrl}";

    window.location.href = url; // 페이지 이동
});