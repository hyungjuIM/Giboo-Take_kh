// $('.toggle').mouseenter(function(){
//     $(this).toggleClass('active')
// })

// $('.toggle').mouseleave(function(){
//     $(this).toggleClass('active')
// })

// $('.gnb a').mouseenter(function(){
//     $(this).toggleClass('active')
// })
$(document).ready(function() {
    let horizontalUnderline = $("#horizontal_underline");
    let horizontalMenus = $(".gnb a");
  
    horizontalMenus.mouseenter(function(e) {
      horizontalUnderline.addClass("active");
      horizontalUnderline.css("left", e.currentTarget.offsetLeft + "px");
      horizontalUnderline.css("width", e.currentTarget.offsetWidth + "px");
    });
  
    horizontalMenus.mouseleave(function() {
      horizontalUnderline.removeClass("active");
    });
  });
  