
function getContextPath() {
  var hostIndex = location.href.indexOf( location.host ) + location.host.length;
  return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}

// 알림 버튼 클릭 시 알림 팝업 토글
jQuery('.tooltip[data-text="알림"]').on('click', function () {
  jQuery('.alert_container').toggleClass('show');
});

jQuery('#alarm').click(function () {
  jQuery.ajax({
    url: "/notifications",
    dataType: "json",
    async:false,
    success: function (list) {
      const alarmList = jQuery("#alarmList");
      alarmList.empty();
      for (let item of list) {
        const alertContainer = jQuery("<div>").addClass("alert_myfavcard_contaner");
        const alertTitleContainerA = jQuery("<div>").addClass("alert_titleContainerA");
        const smallCContainer = jQuery("<div>").addClass("smallC_Container");
        const smallC = jQuery("<div>").addClass("smallC").attr("id", "readStatus");
        smallCContainer.append(smallC);
        alertTitleContainerA.append(smallCContainer);
        const alertTitleContainer = jQuery("<div>").addClass("alert_titleContainer");
//
//const alarmCategory = jQuery("<div>").addClass("alarmCategory").text(item.category);
//        alertTitleContainer.append(alarmCategory);
//
        const alarmContent = jQuery("<div>").addClass("alarmContent");
        const alarmDate = jQuery("<div>").addClass("alarmDate").text("등록일자: " + item.alarmDate);

        if (item.volunteerNo !== null && item.volunteerNo !== 0) {
          const volunteerLink = jQuery("<a>").attr("href", "/volunteer/detail/" + item.volunteerNo).text(item.alarmContent);
          alarmContent.append(volunteerLink);
          volunteerLink.on('click', function () {
          updateReadStatus(item.alarmNo);
          smallC.addClass("read");
        });
  const alarmCategory = jQuery("<div>").addClass("alarmCategory").text("<봉사>");
  alertTitleContainer.append(alarmCategory);

} else if (item.eventNo !== null && item.eventNo !== 0) {
  const eventLink = jQuery("<a>")
    .attr("href", "/event/eventDetailMain/" + item.eventNo)
    .text(item.alarmContent);
  alarmContent.append(eventLink);
  eventLink.on('click', function () {
    updateReadStatus(item.alarmNo);
    smallC.addClass("read");
  });
  const alarmCategory = jQuery("<div>").addClass("alarmCategory").text("<이벤트>");
  alertTitleContainer.append(alarmCategory);

} 
else if (item.donationNo !== null && item.donationNo !== 0) {
  const donationtLink = jQuery("<a>")
    .attr("href", "/donation/detail/" + item.donationNo)
    .text(item.alarmContent);
  alarmContent.append(donationtLink);
  donationtLink.on('click', function () {
    updateReadStatus(item.alarmNo);
    smallC.addClass("read");
  });

  const alarmCategory = jQuery("<div>").addClass("alarmCategory").text("<기부>");
  alertTitleContainer.append(alarmCategory);

} else if (item.noticeNo !== null && item.noticeNo !== 0) {
  const noticeLink = jQuery("<a>")
    .attr("href", "/notice/noticeDetail/" + item.noticeNo)
    .text(item.alarmContent);
  alarmContent.append(noticeLink);
  noticeLink.on('click', function () {
    updateReadStatus(item.alarmNo);
    smallC.addClass("read");
  });
  const alarmCategory = jQuery("<div>").addClass("alarmCategory").text("<공지사항>");
  alertTitleContainer.append(alarmCategory);

} else if (item.reviewNo !== null && item.reviewNo !== 0) {
  const reviewLink = jQuery("<a>")
    .attr("href", "/event/eventDetailMain/" + item.reviewNo)
    .text(item.alarmContent);
  alarmContent.append(reviewLink);
  reviewLink.on('click', function () {
    updateReadStatus(item.alarmNo);
    smallC.addClass("read");
  });
  const alarmCategory = jQuery("<div>").addClass("alarmCategory").text("<리뷰>");
  alertTitleContainer.append(alarmCategory);


} else {
  // 기타 경우 처리
  alarmContent.text(item.alarmContent);
  if (readStatus === "Y") {
    jQuery('.smallC').addClass('read');
  } else{
    jQuery('.smallC').addClass('unread');
  }
}
alertContainer.append(smallCContainer);   
//
//alertTitleContainer.append(alarmCategory);
//    
alertTitleContainer.append(alarmContent);
alertTitleContainer.append(alarmDate);
alertTitleContainerA.append(alertTitleContainer);
alertContainer.append(alertTitleContainerA);
alarmList.append(alertContainer);
}

if (list.length === 0) {
  const noNotificationText = jQuery("<div>").addClass("noNotificationText").text("새로운 알람이 없습니다");
  alarmList.append(noNotificationText);
} else {
  alarmList.css("overflow-y", "auto");
}
3
//alarmList.css("overflow-y", "auto"); // 스크롤바 숨김

function updateReadStatus(alarmNo) {
jQuery.ajax({
  url: "/updateReadStatus",
  method: "POST",
  async:false,
  // cache: "false", // ajax 캐시 처리
  data: JSON.stringify({ alarmNo: alarmNo, readStatus: "Y" }),
  contentType: "application/json; charset=UTF-8",
  success: function (result) {
    console.log("readStatus 업데이트 완료"+result);
      
    
        jQuery(window).on("beforeunload", function() {
          updateReadStatus();
          console.log("페이지이동")
        });
  },
  error: function () {
    console.log("readStatus 업데이트 중 오류가 발생했습니다.");
  }
});
}

},
error: function (req, status, error) {
console.log("에러 발생");
  console.log(error);

}
});
});