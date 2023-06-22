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

        const alarmContent = $("<div>").addClass("alarmContent");
        const alarmDate = $("<div>").addClass("alarmDate").text("등록일자: " + item.alarmDate);

        
      if  (item.volunteerNo !== null && item.volunteerNo !== 0) {
              const volunteerLink = $("<a>")
                    .attr("href", "/Giboo/volunteer/detail/" + item.volunteerNo )
                    .text(item.alarmContent);
          alarmContent.append(volunteerLink);
      }

      else if (item.eventNo !== null && item.eventNo !== 0) {
        const eventLink = $("<a>")
          .attr("href", "/Giboo/event/eventDetailMain/" + item.eventNo)
          .text(item.alarmContent);
        alarmContent.append(eventLink);
      } 

      else if (item.donationNo !== null && item.donationNo !== 0) {
        const donationtLink = $("<a>")
          .attr("href", "/Giboo/donation/detail/" + item.donationNo)
          .text(item.alarmContent);
        alarmContent.append(donationtLink);
      } 

      else if (item.noticeNo !== null && item.noticeNo !== 0) {
        const noticeLink = $("<a>")
          .attr("href", "/Giboo/event/eventDetailMain/" + item.noticeNo)
          .text(item.alarmContent);
        alarmContent.append(noticeLink);
      } 

      else if (item.reviewNo !== null && item.reviewNo !== 0) {
        const reviewLink = $("<a>")
          .attr("href", "/Giboo/event/eventDetailMain/" + item.reviewNo)
          .text(item.alarmContent);
        alarmContent.append(reviewLink);
      } 

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
