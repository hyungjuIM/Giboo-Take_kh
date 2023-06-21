// 알림 버튼 클릭 시 알림 팝업 토글
$('.tooltip[data-text="알림"]').on('click', function() {
  $('.alert_container').toggleClass('show');
});



$('#alarm').click(function(){
  $.ajax({
      url: "/Giboo/notifications",
      dataType: "json",
      success: function (list) {
          const alarmList = $("#alarmList");
          alarmList.empty();

          for (let item of list) {
              const alertContainer = $("<div>").addClass("alert_myfavcard_contaner");

              const alertTitleContainerA = $("<div>").addClass("alert_titleContainerA");

              const alertTitleContainer = $("<div>").addClass("alert_titleContainer");

              const alarmContent = $("<div>").addClass("alarmContent").text(item.alarmContent + "이(가) 등록되었습니다");

              const alarmDate = $("<div>").addClass("alarmDate").text("등록일자 : " + item.alarmDate); // 알람날짜

    

              alertTitleContainer.append(alarmContent);
              alertTitleContainer.append(alarmDate);
              
              alertTitleContainerA.append(alertTitleContainer);

              alertContainer.append(alertTitleContainerA);

              alarmList.append(alertContainer);
          }

          alarmList.css("overflow-y", "auto"); // 스크롤바 숨김
      },
      error: function () {
          console.log("에러 발생");
      },
  });
});