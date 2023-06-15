<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
            <div class="MsearchBar">
                <form onsubmit="searchPlaces(); return false;">
                    <input type="text" value="" id="keyword" placeholder="봉사, 기부 장소 검색">
                    <button type="submit" class="MsearchBtn">🔍</button>  
                </form>
            </div>
        </div>

        <div class="mhwrap">
            <div class="mhwrapBox">
                <div class="mhBox">
                    
                    <div data-include2="mapHeader" id="mapHeader"></div>
                    
                            

                    <div class="mhLine"></div>
                    <div class="mhCaWrap">
                        <div class="mhCa">
                            <a href="/html/map/mapHome.html">홈</a>
                            <a href="/html/map/mapSosick.html">소식</a>
                            <a href="/html/map/mapVoRe.html">리뷰</a>
                            <a href="">사진</a>
                        </div>
                    </div>
                </div>

                <!-- 여기부터 지우고 만들면 됨 -->
                <div class="mhDe">
                    <!-- 주소 -->
                    <div class="mhDeAdd">
                        <div class="mhDeAddIc">
                            <span>🚩</span>
                        </div>
                        <span>서울 강남구 도곡로 416</span>
                    </div>
                    <!-- 전화번호 -->
                    <div class="mhDeAdd">
                        <div class="mhDeAddIc">
                            <!-- <span>📞</span> -->
                            <span><i class="fa-solid fa-phone"></i></span>
                        </div>
                        <span>031-339-2121</span>
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
                                올해 점점 더 뜨거워진다고 하는데 여름을 조금이라도 건강하고 시원하게 보낼 수 있도록 시원함을 전달해 주세요! 
                                독거노인종합지원센터는 홀로 사는 어르신들에게 시원한 마음❤ 전달하려 전달 합니다.
                                올해 점점 더 뜨거워진다고 하는데 여름을 조금이라도 건강하고 시원하게 보낼 수 있도록 시원함을 전달해 주세요! 
                                독거노인종합지원센터는 홀로 사는 어르신들에게 시원한 마음❤ 전달하려 전달 합니다.
                            </span>
                            <!-- <button>더보기</button> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- <ul id="placesList"></ul>
        <div id="pagination"></div> -->
    </div>

     <!-- 지도타입 컨트롤 div 입니다 -->
     <div class="custom_typecontrol radius_border">
        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
    </div>
    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
    <div class="custom_zoomcontrol radius_border"> 
        <span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
        <span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
    </div>
</div>



     <!-- jQuery 라이브러리 추가 -->
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"
     integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>
        $(function () {
            var include1 = $('[data-include1="header"]');
            var include2 = $('[data-include2="mapHeader"]');
            jQuery.each(include1, function () {
                $(this).load('/html/01.header.html');
            });
            jQuery.each(include2, function () {
                $(this).load('/html/map/mapHeader.html');
            });
        });

    </script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=437e55438be69dd079f0ad5d9084099e&libraries=services"></script>
<script src="${pageContext.request.contextPath}/resources/js/map/map.js"></script>

</body>
</html>