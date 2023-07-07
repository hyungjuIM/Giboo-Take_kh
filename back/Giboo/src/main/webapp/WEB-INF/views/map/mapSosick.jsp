<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>hunny</title>
    <script src="https://kit.fontawesome.com/a06d7ad725.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/map/mapSosick.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
    integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

    <header>
        <div data-include1="header" id="header"></div>
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
                            <a href="/html/map/mapPic.html">사진</a>
                        </div>
                    </div>
                </div>

                
                <!-- 여기부터 지우고 만들면 됨 -->
                <div class="msWrap">
                    <div class="msWrapBox">
                        <ul>
                            <li>
                                <div class="msWrapSo">
                                    <div class="msBoxSo">
                                        <div class="msAlarmBtn">
                                            <span>알림</span>
                                        </div>
                                        <div class="msAlarmDe">
                                            <span>서울시립장애인서 알립니다.</span>
                                        </div>
                                    </div>
                                    <span class="msAlarmSpan">
                                        4월 20일 장애인의 날을 맞아 올해도 복지관에서 소소하게 즐기는 '스마일데이' 이벤트를 열었습니다. 
                                        계절이 '봄'인 만큼, 봄맞이 나들이와 꽃구경을 떠올리며 복지관 안에서도 봄을 느끼고, 
                                        함께 어울릴 수 있는 내용으로 준비했습니다. 그래서 이번 행사의 주제는 ‘함께하는 봄맞이, 스마일데이’입니다.
                                    </span>
                                </div>
                            </li>
                            <li>
                                <div class="msWrapSo">
                                    <div class="msBoxSo">
                                        <div class="msAlarmBtn">
                                            <span>임시휴업</span>
                                        </div>
                                        <div class="msAlarmDe">
                                            <span>서울시립장애인행복플러스센터울시립장애인행복플러스센터서 알립니다.</span>
                                        </div>
                                    </div>
                                    <span class="msAlarmSpan">
                                        4월 20일 장애인의 날을 맞아 올해도 복지관에서 소소하게 즐기는 '스마일데이' 이벤트를 열었습니다. 
                                        계절이 '봄'인 만큼, 봄맞이 나들이와 꽃구경을 떠올리며 복지관 안에서도 봄을 느끼고, 
                                        함께 어울릴 수 있는 내용으로 준비했습니다. 그래서 이번 행사의 주제는 ‘함께하는 봄맞이, 스마일데이’입니다.
                                        4월 20일 장애인의 날을 맞아 올해도 복지관에서 소소하게 즐기는 '스마일데이' 이벤트를 열었습니다. 
                                        계절이 '봄'인 만큼, 봄맞이 나들이와 꽃구경을 떠올리며 복지관 안에서도 봄을 느끼고, 
                                        함께 어울릴 수 있는 내용으로 준비했습니다. 그래서 이번 행사의 주제는 ‘함께하는 봄맞이, 스마일데이’입니다.
                                    </span>
                                </div>
                            </li>
                            <li>
                                <div class="msWrapSo">
                                    <div class="msBoxSo">
                                        <div class="msAlarmBtn">
                                            <span>알림</span>
                                        </div>
                                        <div class="msAlarmDe">
                                            <span>서울시립장애인행복플러스센터서 알립니다.</span>
                                        </div>
                                    </div>
                                    <span class="msAlarmSpan">
                                        4월 20일 장애인의 날을 맞아 올해도 복지관에서 소소하게 즐기는 '스마일데이' 이벤트를 열었습니다. 
                                        계절이 '봄'인 만큼, 봄맞이 나들이와 꽃구경을 떠올리며 복지관 안에서도 봄을 느끼고, 
                                        함께 어울릴 수 있는 내용으로 준비했습니다. 그래서 이번 행사의 주제는 ‘함께하는 봄맞이, 스마일데이’입니다.
                                    </span>
                                </div>
                            </li>
                        </ul>
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


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a57d546fefaefbc7ac5bde8a6eb90ec&libraries=services"></script>
<script src="/JS/map.js"></script>
</body>
</html>