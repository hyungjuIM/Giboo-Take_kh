$(document).ready(function(){


// 로그인 유무 
const addReply = document.getElementById("popupButton");

addReply.addEventListener("click", function(){
    if(loginMemberNo === ""){
        alert("로그인 후 이용해주세요.");
    } else {
        // 서버로 이미 참여한지 확인하는 Ajax 요청을 보냅니다.
        jQuery.ajax({
          url: contextPath + "/event/checkAlreadyJoined",
          type: "POST",
          data: {
            "memberNo": loginMemberNo,
            "eventNo": eventNo
          },
          success: function(response) {
            if (response.alreadyJoined) {
              // 이미 참여한 경우 알림 메시지를 표시합니다.
              alert(response.message);
            } else {
              // 참여 가능한 경우에만 E_popup_wrap02를 표시합니다.
              jQuery(".E_popup_wrap02").css("display", "block");
              jQuery(".E_pop_mask2").css("display", "block");
            }
          },
          error: function(xhr, status, error) {
            console.log("Error:", error);
          }
        });
        
    }
});
})




// 즐겨찾기
const eFavBtn = document.getElementById("eFavBtn");

eFavBtn.addEventListener("click", function() {
     // 1) 로그인이 되어있나? -> 전역변수 loginMemberNo 이용
     if (loginMemberNo == "") { // 로그인 X
        alert("로그인 후 이용해주세요.");
    } else {
    $.ajax({
        url: contextPath + "/event/insertEventFav",
        data: {
            "memberNo": loginMemberNo,
            "eventNo": eventNo
        },
        type: "post",
        success: function(result) {
            if (result === "red") { // 색상 변경 성공
                alert("즐겨찾기에 등록되었습니다.");
                // mhBtnHe.classList.add("loggedIn"); // 버튼에 클래스 추가 (예: "loggedIn")
                eFavBtn.style.backgroundColor = "red"; // 색상 변경
                console.log("즐찾성공")
            } else { // 실패
                alert("이미 추가한 즐겨찾기 입니다.");
            }
        },
        error: function(req, status, error) {
            console.log("즐겨찾기 등록 실패");
            console.log(req.responseText);
        }
    });    
}
})


// 더보기 슬라이드
jQuery.noConflict();

jQuery(function($) {
  $('.elist_official').slick({
      slide: "div",
      infinite: true,
      slidesToShow: 4,
      slidesToScroll: 1,
      speed: 500,
      arrows: true,
      dots: false,
      autoplay: false,
      autoplaySpeed: 2000,
      pauseOnHover: true,
      vertical: false,
      prevArrow: $("#prev"),
      nextArrow: $("#next"),
      draggable: false,
      responsive: [
        {
          breakpoint: 960,
          settings: {
            slidesToShow: 4
          }
        },
        {
          breakpoint: 768,
          settings: {
            slidesToShow: 5
          }
        }
      ]
  });
});








// 목록보기
(function() {
  const eMoreBtnBox = document.getElementsByClassName("eMoreBtnBox");

  if (eMoreBtnBox.length > 0) { // 목록으로 버튼이 화면에 있을 때만 이벤트 추가
    eMoreBtnBox[0].addEventListener("click", function() { // 첫 번째 요소 선택
      const pathname = location.pathname; // 주소상에서 요청 경로 반환
      let url = pathname.substring(0, pathname.indexOf("/", 1));
      url += "/event/eventList";

      const params = new URL(location.href).searchParams;
      let cp;

      if (params.get("cp") != null) { // 쿼리스트링에 cp가 있을 경우
        cp = "cp=" + params.get("cp");
      } else {
        cp = "cp=1";
      }

      location.href = url;
    });
  }
})();



