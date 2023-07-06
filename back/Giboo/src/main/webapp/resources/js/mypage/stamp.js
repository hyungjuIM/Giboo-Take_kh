// if (loginMemberNo === "") {
//     alert("로그인 후 이용해주세요.");
//   } else {
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
  
      },
      error: function(xhr, status, error) {
        // 스템프 조회 실패 시 동작
        console.log("Error:", error);
      }
    });
//   }
  