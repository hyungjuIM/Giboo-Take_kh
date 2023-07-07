<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>맵 리스트 홈</title>
    <script src="https://kit.fontawesome.com/a06d7ad725.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/map/mapHome.css">
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
    integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <script src="https://kit.fontawesome.com/50a1d35924.js" crossorigin="anonymous"></script>
</head>

<body>

    <header>
       <jsp:include page="/WEB-INF/views/main/header.jsp" />
    </header>

<div class="map_wrap">
    <div id="map" style="width: 100%; height: 100vh; overflow: hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
        </div>

        <div class="mhwrap">
            <div class="mhwrapBox">
            
                <div class="mhBox">
                    
                    <jsp:include page="/WEB-INF/views/map/mapHeader.jsp" />
                    
                        
                    <div class="mhLine"></div>
                    <div class="mhCaWrap">
                        <div class="mhCa">
                            <a href="${pageContext.request.contextPath}/map/mapHome/${mapDetailTop.volunteerNo}?cp=${pagination.currentPage}${sURL}" id="mapVoRe">홈</a>
                            <a href="${pageContext.request.contextPath}/map/mapVoRe/${mapDetailTop.volunteerNo}?cp=${pagination.currentPage}${sURL}" id="mapVoRe">리뷰</a>
                        </div>
                    </div>
                </div>

                <!-- 여기부터 지우고 만들면 됨 -->
                <div class="mhDe" id="contentArea">
                    <!-- 주소 -->
                    <div class="mhDeAdd">
                        <div class="mhDeAddIc">
                            <span>🚩</span>
                        </div>
                        <span>${mapDetailHome.volunteerAddr}</span>
                    </div>
                    <!-- 전화번호 -->
                    <div class="mhDeAdd">
                        <div class="mhDeAddIc">
                            <!-- <span>📞</span> -->
                            <span><i class="fa-solid fa-phone"></i></span>
                        </div>
                        <span>${mapDetailHome.memberTel}</span>
                    </div>
                    <!-- 링크 -->
                    <div class="mhDeAdd">
                        <div class="mhDeAddIc">
                            <span>🏠</span>
                        </div>    
                            <div>
                                <a href="${pageContext.request.contextPath}/volunteer/detail/${mapDetailTop.volunteerNo}?cp=${pagination.currentPage}${sURL}" class="elink_official">
                                    <span>
                                        봉사페이지 이동하기
                                    </span>
                                </a>
                            </div>
                    </div>
                    <!-- 설명 -->
                    <div class="mhDeAddCh">
                        <div class="mhDeAddIc">
                            <span>🗯️</span>
                        </div>
                        <div class="mhDeAdd_4">
                            <span>
                                ${mapDetailHome.volunteerContent}
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a57d546fefaefbc7ac5bde8a6eb90ec&libraries=services,clusterer,drawing"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/map/map.js"></script>
<script>

$.ajax({
    url: contextPath + "/map/getFavoriteColor/" + volunteerNo,
    data: {
        // "memberNo": loginMemberNo,
        "volunteerNo": volunteerNo
    },
    type: "get",
    success: function(result) {
        if (result === "red") {  // 정확한 일치(===)로 비교
            // mhBtnHe_1.classList.add("loggedIn"); // 버튼에 클래스 추가 (예: "loggedIn")
            mhBtnHea.style.backgroundColor = "red"; // 색상 변경
            console.log("성공");
        } else {
            console.log("실패");
        }
    },
    error: function(xhr, status, error) {  // 인수 이름을 req에서 xhr로 변경
        console.log("오류 메시지:", error);
        console.log("상태 코드:", status);
        console.log("응답 내용:", xhr.responseText);  // req.responseText에서 xhr.responseText로 변경
    }
});
</script>
</body>
</html>