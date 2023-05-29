// 알림 버튼 클릭 시 알림 팝업 토글
$('.tooltip[data-text="알림"]').on('click', function() {
  $('.alarmPopup').toggleClass('show');
});