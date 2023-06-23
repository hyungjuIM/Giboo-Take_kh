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

              const alarmContent = $("<a>").addClass("alarmContent").text(item.alarmContent);

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


$(document).on('click', '#alarmContent', function() {
  const item = $(this).data('item');

  if (item.volunteerNo !== null && item.volunteerNo !== 0) {
      window.location.href = "/Giboo/volunteer/detail/" + item.volunteerNo;
  } else if (item.eventNo !== null && item.eventNo !== 0) {
      window.location.href = "/Giboo/event/eventDetailMain/" + item.eventNo;
  } else if (item.donationNo !== null && item.donationNo !== 0) {
      window.location.href = "/Giboo/donation/detail/" + item.donationNo;
  } else if (item.noticeNo !== null && item.noticeNo !== 0) {
      window.location.href = "/Giboo/event/eventDetailMain/" + item.noticeNo;
  } else if (item.reviewNo !== null && item.reviewNo !== 0) {
      window.location.href = "/Giboo/event/eventDetailMain/" + item.reviewNo;
  }
});








// $('#alarmContent').click(function(){
//   $.ajax({
//     url: "/Giboo/notifications",
//     dataType: "json",
//     success: function (list) {
     

//       for (let item of list) {
//         const alertContainer = $("<div>").addClass("alert_myfavcard_contaner");
//         const alertTitleContainerA = $("<div>").addClass("alert_titleContainerA");
        
//         // 작은 동그라미를 추가하는 부분
//         const smallCContainer = $("<div>").addClass("smallC_Container");
//         const smallC = $("<div>").addClass("smallC");
//         smallCContainer.append(smallC);
//         alertTitleContainerA.append(smallCContainer);
        
//         const alertTitleContainer = $("<div>").addClass("alert_titleContainer");

//         const alarmContent = $("<div>").addClass("alarmContent");
//         const alarmDate = $("<div>").addClass("alarmDate").text("등록일자: " + item.alarmDate);

        
//       if  (item.volunteerNo !== null && item.volunteerNo !== 0) {
//               const volunteerLink = $("<a>")
//                     .attr("href", "/Giboo/volunteer/detail/" + item.volunteerNo )
//                     .text(item.alarmContent);
//           alarmContent.append(volunteerLink);
//       }

//       else if (item.eventNo !== null && item.eventNo !== 0) {
//         const eventLink = $("<a>")
//           .attr("href", "/Giboo/event/eventDetailMain/" + item.eventNo)
//           .text(item.alarmContent);
//         alarmContent.append(eventLink);
//       } 

//       else if (item.donationNo !== null && item.donationNo !== 0) {
//         const donationtLink = $("<a>")
//           .attr("href", "/Giboo/donation/detail/" + item.donationNo)
//           .text(item.alarmContent);
//         alarmContent.append(donationtLink);
//       } 

//       else if (item.noticeNo !== null && item.noticeNo !== 0) {
//         const noticeLink = $("<a>")
//           .attr("href", "/Giboo/event/eventDetailMain/" + item.noticeNo)
//           .text(item.alarmContent);
//         alarmContent.append(noticeLink);
//       } 

//       else if (item.reviewNo !== null && item.reviewNo !== 0) {
//         const reviewLink = $("<a>")
//           .attr("href", "/Giboo/event/eventDetailMain/" + item.reviewNo)
//           .text(item.alarmContent);
//         alarmContent.append(reviewLink);
//       } 

//       alertTitleContainer.append(alarmContent);
//       alertTitleContainer.append(alarmDate);
//       alertTitleContainerA.append(alertTitleContainer);
//       alertContainer.append(alertTitleContainerA);
//       alarmList.append(alertContainer);
//       }

//       alarmList.css("overflow-y", "auto"); // 스크롤바 숨김
//     },
//     error: function () {
//       console.log("에러 발생");
//     },
//   });
// });






// // 작은동그라미 클릭 이벤트 핸들러
// $(document).on("click", "#readStatus", function() {
// 	const alarmNo = $(this).closest(".alert_myfavcard_contaner").data("alarmNo");
// 	updateAlarmStatus(alarmNo);
// });

// // 알림 읽음 상태 업데이트 함수
// function updateAlarmStatus(alarmNo) {
// 	$.ajax({
// 		url: "/Giboo/updateAlarmStatus",
// 		method: "POST",
// 		data: {
// 			alarmNo: alarmNo,
// 		},
// 		success: function(response) {
// 			console.log(response);
// 			// 성공한 경우 작은 동그라미를 변경합니다.
// 			const smallC = $(".alert_myfavcard_contaner[data-alarmNo='" + alarmNo + "']").find("#readStatus");
// 			smallC.css("background", "white");
// 			smallC.css("border-color", "red");

// 			// 해당 alert_titleContainer 부분의 글자색을 연하게 변경합니다.
// 			const alertTitleContainer = $(".alert_myfavcard_contaner[data-alarmNo='" + alarmNo + "']")
// 				.find(".alert_titleContainer");
// 			alertTitleContainer.css("color", "blue");
// 		},
// 		error: function(jqXHR, textStatus, errorThrown) {
// 			console.log(jqXHR.responseText);
// 			console.log(textStatus);
// 			console.log(errorThrown);
// 		},
// 	});
// }