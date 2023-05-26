$(document).ready(function() {
    $('.alarmBtn').click(function() {
      $('.alarmPopup').fadeIn();
    });

    $(document).click(function(event) {
      if (!$(event.target).closest('.alarmPopup').length && !$(event.target).closest('.alarmBtn').length) {
        $('.alarmPopup').fadeOut();
      }
    });
  });