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
  
  
  // 로그인 유무 
  const edBtnDe = document.getElementById("edBtnDe");
  
  edBtnDe.addEventListener("click", function(){
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
  
  
  // jQuery(document).ready(function($) {
    $(".edStampBtn").on("click", function() {
      if (loginMemberNo === "") {
        alert("로그인 후 이용해주세요.");
      } else {
        // 서버로 스템프 조회하는 Ajax 요청을 보냅니다.
        jQuery.ajax({
          url: contextPath + "/event/getStamps",
          // type: "GET",
          data: {
              // "memberNo": loginMemberNo
            },
            dataType : "JSON", // JSON 형태의 문자열 응답 데이터를 JS 객체로 자동 변환
          success: function(stamps) {
            // 팝업을 표시합니다.
            // 스템프 조회 성공 시 동작
            // stamps 변수에 스템프 데이터가 포함됩니다.
            // 원하는 동작을 수행하세요.
            console.log(stamps);
  
            // 팝업 내에서 스템프를 표시하는 코드를 작성하세요.
            // 예시: 스템프 목록을 동적으로 생성하여 팝업에 표시
            var stampList = stamps;
            var stampContainer = jQuery(".stampUl");
  
// 스탬프 이미지를 동적으로 추가하는 코드
stampContainer.empty();

stampList.forEach(function(stamp) {
  var stampItem = jQuery("<li>").addClass("stampLi"); // 새로운 li 요소 생성
  var stampDiv = jQuery("<div>").addClass("stampDiv"); // 새로운 div 요소 생성

  // 스템프 이미지를 표시하는 img 태그를 생성하여 추가합니다.
  var stampImg = jQuery("<img>").attr("src", contextPath + stamp.stampAttachment).addClass("stampImg");
  stampDiv.append(stampImg); // 스템프 이미지를 div 요소에 추가합니다.

  stampItem.append(stampDiv); // div 요소를 li 요소에 추가합니다.
  stampContainer.append(stampItem); // li 요소를 ul 요소에 추가합니다.
});


  
            // 스템프 개수를 업데이트합니다.
            var stampCountValue = jQuery(".stampCount div").eq(1);
            stampCountValue.text(stampList.length);
  
            jQuery(".stampWrap").css("display", "block");
            jQuery(".E_pop_mask1").css("display", "block");

            jQuery(".E_pop_mask1").on("click", function() {
              jQuery(".stampWrap").css("display", "none");
              jQuery(".E_pop_mask1").css("display", "none");
              });
          },
          error: function(xhr, status, error) {
            // 스템프 조회 실패 시 동작
            console.log("Error:", error);
          }
        });
      }
    });
  // });
      
  


    // // 종료된 이벤트는 참여 못하게
    // $(document).ready(function() {
    //   // 버튼 클릭 이벤트 처리
    //   $('#popupButton').click(function() {
    //     // 데이터 가져오기
    //     $.ajax({
    //       url: contextPath + '/event/getEventData', 
    //       method: 'GET',
    //       dataType: 'json',
    //       data:{
    //         "eventNo": eventNo
    //       },
    //       success: function(response) {
  
    //         if (response.getEventData) {
    //           // 이미 참여한 경우 알림 메시지를 표시합니다.
    //           alert(response.message);
    //         } else {
    //           // 참여 가능한 경우에만 E_popup_wrap02를 표시합니다.
    //           jQuery(".E_popup_wrap02").css("display", "block");
    //           jQuery(".E_pop_mask2").css("display", "block");
    //         }
    //       },
    //       error: function(xhr, status, error) {
    //         console.error('데이터를 가져오는 중 오류가 발생했습니다:', error);
    //       }
    //     });
    //   });
    // });
  
  
  
  // 즐겨찾기
  // const eFavBtn = document.getElementById("eFavBtn");
  
  // eFavBtn.addEventListener("click", function() {
  //      // 1) 로그인이 되어있나? -> 전역변수 loginMemberNo 이용
  //      if (loginMemberNo == "") { // 로그인 X
  //         alert("로그인 후 이용해주세요.");
  //     } else {
  //     $.ajax({
  //         url: contextPath + "/event/insertEventFav",
  //         data: {
  //             "memberNo": loginMemberNo,
  //             "eventNo": eventNo
  //         },
  //         type: "post",
  //         success: function(result) {
  //             if (result === "red") { // 색상 변경 성공
  //                 alert("즐겨찾기에 등록되었습니다.");
  //                 // mhBtnHe.classList.add("loggedIn"); // 버튼에 클래스 추가 (예: "loggedIn")
  //                 eFavBtn.style.backgroundColor = "red"; // 색상 변경
  //                 console.log("즐찾성공")
  //             } else { // 실패
  //                 alert("이미 추가한 즐겨찾기 입니다.");
  //             }
  //         },
  //         error: function(req, status, error) {
  //             console.log("즐겨찾기 등록 실패");
  //             console.log(req.responseText);
  //         }
  //     });    
  // }
  // })
  
  
  


  
  
  
  
  
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
  


// 프로필 이미지 슬라이드
// jQuery.noConflict();
  
// jQuery(function($) {
//   $('.edDoPersonUl').slick({
//       slide: "div",
//       infinite: true,
//       slidesToShow: 3,
//       slidesToScroll: 1,
//       speed: 500,
//       arrows: true,
//       dots: false,
//       autoplay: false,
//       autoplaySpeed: 2000,
//       pauseOnHover: true,
//       vertical: false,
//       prevArrow: $("#prev1"),
//       nextArrow: $("#next1"),
//       draggable: false,
//       responsive: [
//         {
//           breakpoint: 960,
//           settings: {
//             slidesToShow: 4
//           }
//         },
//         {
//           breakpoint: 768,
//           settings: {
//             slidesToShow: 5
//           }
//         }
//       ]
//   });
// });

//프로필 이미지 슬라이드

new Swiper('.first', {

  slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
  spaceBetween : 20, // 슬라이드간 간격
  slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

  // 그룹수가 맞지 않을 경우 빈칸으로 메우기
  // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
  loopFillGroupWithBlank : true,
 // loopAdditionalSlides : 1,
  loop : true, // 무한 반복

  // pagination : { // 페이징
  //    el : '.swiper-pagination',
  //    clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
  // },
  navigation : { // 네비게이션
     nextEl : '.swiper-button-next1', // 다음 버튼 클래스명
     prevEl : '.swiper-button-prev1', // 이번 버튼 클래스명
  },
});

// new Swiper('.second', {

//   slidesPerView : 2, // 동시에 보여줄 슬라이드 갯수
//   spaceBetween : 10, // 슬라이드간 간격
//   slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

//   // 그룹수가 맞지 않을 경우 빈칸으로 메우기
//   // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
//   loopFillGroupWithBlank : true,
//  // loopAdditionalSlides : 1,
//   loop : true, // 무한 반복

//   // pagination : { // 페이징
//   //    el : '.swiper-pagination',
//   //    clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
//   // },
//   navigation : { // 네비게이션
//      nextEl : '.swiper-button-next2', // 다음 버튼 클래스명
//      prevEl : '.swiper-button-prev2', // 이번 버튼 클래스명
//   },
// });


  
  
  
  
  
  
  
  // 목록보기
  (function() {
    const eMoreBtnBox = document.getElementsByClassName("eMoreBtnBox");
  
    if (eMoreBtnBox.length > 0) { // 목록으로 버튼이 화면에 있을 때만 이벤트 추가
      eMoreBtnBox[0].addEventListener("click", function() { // 첫 번째 요소 선택
        const pathname = location.pathname; // 주소상에서 요청 경로 반환
        let url = pathname.substring(0, pathname.indexOf("/", 1));
        url += "/eventList";
  
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
  
  
 
  
  
  });

