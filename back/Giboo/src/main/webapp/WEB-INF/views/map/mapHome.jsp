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
                            <a href="/html/map/mapSosick.html">소식</a>
                            <a href="${pageContext.request.contextPath}/map/mapVoRe/${mapDetailTop.volunteerNo}?cp=${pagination.currentPage}${sURL}" id="mapVoRe">리뷰</a>
                            <a href="">사진</a>
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
                        <div class="mhDeAddLink">
                            <a href="">
                                <span>https://www.instagram.com/bongsaplace</span>
                            </a>
                            <div class="mhDeAddLink_2">
                                <a href="">
                                    <span>인스타그램</span>
                                </a>
                                <span>|</span>
                                <a href="">
                                    <span>블로그</span>
                                </a>
                            </div>
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



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a57d546fefaefbc7ac5bde8a6eb90ec&libraries=services"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/map/map.js"></script>

</body>
</html>