// 알림 버튼 클릭 시 알림 팝업 토글
$('.tooltip[data-text="알림"]').on('click', function() {
  $('.alert_container').toggleClass('show');
});


//ajax
function selectAll(){ // 회원 전체 조회 함수
  // ajax코드
  $.ajax({
    url: "alarm/selectAll",
    dataType: "json",
    success: function (list) {
      const alarmList = document.getElementById("alarmList");
      alarmList.innerHTML = "";

      for (let item of list) {
        const alertContainer = document.createElement("div");
        alertContainer.className = "alert_myfavcard_contaner";

        // 알림 카드 내용 생성 (알림 카테고리, 이모티콘, 점선 등...)

        const alertMainContainer = document.createElement("div");
        alertMainContainer.className = "alert_Maincontainer";

        const alertTitleContainerA = document.createElement("div");
        alertTitleContainerA.className = "alert_titleContainerA";

        const alertTitleContainer = document.createElement("div");
        alertTitleContainer.className = "alert_titleContainer";

        const alarmContent = document.createElement("div");
        alarmContent.className = "alarmContent";
        const link = document.createElement("a");
        link.href = "#";
        link.textContent = item.alarmContent; // 알림 제목
        alarmContent.appendChild(link);

        const alarmDate = document.createElement("div");
        alarmDate.className = "alarmDate";
        alarmDate.textContent = item.alarmDate; // 알림 기관

        const achieveAlert = document.createElement("div");
        achieveAlert.className = "memberNo";
        achieveAlert.textContent = item.achieveAlert; // 알림 카테고리

        alertTitleContainer.appendChild(alarmContent);
        alertTitleContainer.appendChild(alarmDate);
        alertTitleContainer.appendChild(achieveAlert);

        alertTitleContainerA.appendChild(alertTitleContainer);
        alertMainContainer.appendChild(alertTitleContainerA);

        alertContainer.appendChild(alertMainContainer);

        alarmList.appendChild(alertContainer);
      }
    },
    error: function () {
      console.log("에러 발생");
    },
  });
}

(function () {
  selectAll();
  window.setInterval(selectAll, 2000);
})();



