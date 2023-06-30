// $(document).ready(function () {
//   // Ajax를 통해 서버에서 읽음 상태 정보를 가져옴
//   $.ajax({
//     url: "/Giboo/getReadStatus",
//     method: "GET",
//     dataType: "json",
//     success: function (data) {
//       const readStatus = data.readStatus;

//       // 가져온 읽음 상태 정보에 따라 CSS 적용
//       if (readStatus === "Y") {
//         $('.smallC').addClass('read');
//       } else {
//         $('.smallC').addClass('unread');
//       }
//     },
//     error: function () {
//       console.log("읽음 상태 정보 가져오기 실패");
//     }
//   });

//   // 알림 버튼 클릭 시 알림 팝업 토글
//   $('.tooltip[data-text="알림"]').on('click', function () {
//     $('.alert_container').toggleClass('show');
//   });


//   $('#alarm').click(function () {

//     $.ajax({
//       url: "/Giboo/notifications",
//       dataType: "json",
//       success: function (list) {
//         const alarmList = $("#alarmList");
//         alarmList.empty();
//         for (let item of list) {
//           const alertContainer = $("<div>").addClass("alert_myfavcard_contaner");
//           const alertTitleContainerA = $("<div>").addClass("alert_titleContainerA");
//           const smallCContainer = $("<div>").addClass("smallC_Container");
//           const smallC = $("<div>").addClass("smallC").attr("id", "readStatus");
//           smallCContainer.append(smallC);
//           alertTitleContainerA.append(smallCContainer);
//           const alertTitleContainer = $("<div>").addClass("alert_titleContainer");

//           const alarmContent = $("<div>").addClass("alarmContent");
//           const alarmDate = $("<div>").addClass("alarmDate").text("등록일자: " + item.alarmDate);


//           if (item.volunteerNo !== null && item.volunteerNo !== 0) {
//             const volunteerLink = $("<a>")
//               .attr("href", "/Giboo/volunteer/detail/" + item.volunteerNo)
//               .text(item.alarmContent);
//             alarmContent.append(volunteerLink);
//             volunteerLink.on('click', function () {
//               updateReadStatus(item.alarmNo);
//               smallC.addClass("read");
//             });
//           }

//           else if (item.eventNo !== null && item.eventNo !== 0) {
//             const eventLink = $("<a>")
//               .attr("href", "/Giboo/event/eventDetailMain/" + item.eventNo)
//               .text(item.alarmContent);
//             alarmContent.append(eventLink);
//             eventLink.on('click', function () {
//               updateReadStatus(item.alarmNo);
//               smallC.addClass("read");
//             });
//           }

//           else if (item.donationNo !== null && item.donationNo !== 0) {
//             const donationtLink = $("<a>")
//               .attr("href", "/Giboo/donation/detail/" + item.donationNo)
//               .text(item.alarmContent);
//             alarmContent.append(donationtLink);
//             donationtLink.on('click', function () {
//               updateReadStatus(item.alarmNo);
//               smallC.addClass("read");
//             });
//           }

//           else if (item.noticeNo !== null && item.noticeNo !== 0) {
//             const noticeLink = $("<a>")
//               .attr("href", "/Giboo/event/eventDetailMain/" + item.noticeNo)
//               .text(item.alarmContent);
//             alarmContent.append(noticeLink);
//             noticeLink.on('click', function () {
//               updateReadStatus(item.alarmNo);
//               smallC.addClass("read");
//             });
//           }

//           else if (item.reviewNo !== null && item.reviewNo !== 0) {
//             const reviewLink = $("<a>")
//               .attr("href", "/Giboo/event/eventDetailMain/" + item.reviewNo)
//               .text(item.alarmContent);
//             alarmContent.append(reviewLink);
//             reviewLink.on('click', function () {
//               updateReadStatus(item.alarmNo);
//               smallC.addClass("read");
//             });
//           }

//           else {
//             // 기타 경우 처리
//             alarmContent.text(item.alarmContent);
//           }
//           // if (item.readStatus === "Y") {
//           //   smallC.addClass("read");
//           // } else {
//           //   smallC.addClass("unread");
//           // }

//           alertContainer.append(smallCContainer);
//           alertTitleContainer.append(alarmContent);
//           alertTitleContainer.append(alarmDate);
//           alertTitleContainerA.append(alertTitleContainer);
//           alertContainer.append(alertTitleContainerA);
//           alarmList.append(alertContainer);
//         }

//         alarmList.css("overflow-y", "auto"); // 스크롤바 숨김
//         function updateReadStatus(alarmNo) {
//           $.ajax({
//             url: "/Giboo/updateReadStatus",
//             method: "POST",
//             data: JSON.stringify({ alarmNo: alarmNo, readStatus: "Y" }),
//             contentType: "application/json; charset=UTF-8",
//             success: function () {
//               console.log("readStatus 업데이트 완료");
//             },
//             error: function () {
//               console.log("readStatus 업데이트 중 오류가 발생했습니다.");
//             }
//           });
//         }
//       },
//       error: function () {
//         console.log("에러 발생");
//       },
//     });
//   })



//   $(document).ready(function () {
//     // Ajax를 통해 서버에서 읽음 상태 정보를 가져옴
//     $.ajax({
//     url: "/Giboo/getReadStatus",
//     method: "GET",
//     dataType: "json",
//     success: function (data) {
//     const readStatus = data.readStatus;
//         // 가져온 읽음 상태 정보에 따라 CSS 적용
//   if (readStatus === "Y") {
//     $('.smallC').addClass('read');
//   } else {
//     $('.smallC').addClass('unread');
//   }
// },
// error: function () {
//   console.log("읽음 상태 정보 가져오기 실패");
// }
// });

// 알림 버튼 클릭 시 알림 팝업 토글
$('.tooltip[data-text="알림"]').on('click', function () {
$('.alert_container').toggleClass('show');
});

$('#alarm').click(function () {
$.ajax({
url: "/Giboo/notifications",
dataType: "json",
async:false,
success: function (list) {
const alarmList = $("#alarmList");
alarmList.empty();
for (let item of list) {
const alertContainer = $("<div>").addClass("alert_myfavcard_contaner");
const alertTitleContainerA = $("<div>").addClass("alert_titleContainerA");
const smallCContainer = $("<div>").addClass("smallC_Container");
const smallC = $("<div>").addClass("smallC").attr("id", "readStatus");
smallCContainer.append(smallC);
alertTitleContainerA.append(smallCContainer);
const alertTitleContainer = $("<div>").addClass("alert_titleContainer");
//
//const alarmCategory = $("<div>").addClass("alarmCategory").text(item.category);
//        alertTitleContainer.append(alarmCategory);
//
const alarmContent = $("<div>").addClass("alarmContent");
const alarmDate = $("<div>").addClass("alarmDate").text("등록일자: " + item.alarmDate);

if (item.volunteerNo !== null && item.volunteerNo !== 0) {
  const volunteerLink = $("<a>")
    .attr("href", "/Giboo/volunteer/detail/" + item.volunteerNo)
    .text(item.alarmContent);
  alarmContent.append(volunteerLink);
  volunteerLink.on('click', function () {
    updateReadStatus(item.alarmNo);
    smallC.addClass("read");
  });
  const alarmCategory = $("<div>").addClass("alarmCategory").text("<봉사>");
  alertTitleContainer.append(alarmCategory);

} else if (item.eventNo !== null && item.eventNo !== 0) {
  const eventLink = $("<a>")
    .attr("href", "/Giboo/event/eventDetailMain/" + item.eventNo)
    .text(item.alarmContent);
  alarmContent.append(eventLink);
  eventLink.on('click', function () {
    updateReadStatus(item.alarmNo);
    smallC.addClass("read");
  });
  const alarmCategory = $("<div>").addClass("alarmCategory").text("<이벤트>");
  alertTitleContainer.append(alarmCategory);

} 
else if (item.donationNo !== null && item.donationNo !== 0) {
  const donationtLink = $("<a>")
    .attr("href", "/Giboo/donation/detail/" + item.donationNo)
    .text(item.alarmContent);
  alarmContent.append(donationtLink);
  donationtLink.on('click', function () {
    updateReadStatus(item.alarmNo);
    smallC.addClass("read");
  });

  const alarmCategory = $("<div>").addClass("alarmCategory").text("<기부>");
  alertTitleContainer.append(alarmCategory);

} else if (item.noticeNo !== null && item.noticeNo !== 0) {
  const noticeLink = $("<a>")
    .attr("href", "/Giboo/event/eventDetailMain/" + item.noticeNo)
    .text(item.alarmContent);
  alarmContent.append(noticeLink);
  noticeLink.on('click', function () {
    updateReadStatus(item.alarmNo);
    smallC.addClass("read");
  });
  const alarmCategory = $("<div>").addClass("alarmCategory").text("<공지사항>");
  alertTitleContainer.append(alarmCategory);

} else if (item.reviewNo !== null && item.reviewNo !== 0) {
  const reviewLink = $("<a>")
    .attr("href", "/Giboo/event/eventDetailMain/" + item.reviewNo)
    .text(item.alarmContent);
  alarmContent.append(reviewLink);
  reviewLink.on('click', function () {
    updateReadStatus(item.alarmNo);
    smallC.addClass("read");
  });
  const alarmCategory = $("<div>").addClass("alarmCategory").text("<리뷰>");
  alertTitleContainer.append(alarmCategory);


} else {
  // 기타 경우 처리
  alarmContent.text(item.alarmContent);
  if (readStatus === "Y") {
    $('.smallC').addClass('read');
  } else{
    $('.smallC').addClass('unread');
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
  const noNotificationText = $("<div>").addClass("noNotificationText").text("새로운 알람이 없습니다");
  alarmList.append(noNotificationText);
} else {
  alarmList.css("overflow-y", "auto");
}
3
//alarmList.css("overflow-y", "auto"); // 스크롤바 숨김

function updateReadStatus(alarmNo) {
$.ajax({
  url: "/Giboo/updateReadStatus",
  method: "POST",
  async:false,
  // cache: "false", // ajax 캐시 처리
  data: JSON.stringify({ alarmNo: alarmNo, readStatus: "Y" }),
  contentType: "application/json; charset=UTF-8",
  success: function (result) {
    console.log("readStatus 업데이트 완료"+result);
      
    
        $(window).on("beforeunload", function() {
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
error: function () {
console.log("에러 발생");
}
});
});
     