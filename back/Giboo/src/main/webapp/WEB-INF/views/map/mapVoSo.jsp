<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>맵 리스트 봉사자 리뷰</title>
    <script src="https://kit.fontawesome.com/a06d7ad725.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/map/mapVoSo.css">

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
                    
                    <jsp:include page="/WEB-INF/views/map/mapHeader.jsp" />

                    <div class="mhLine"></div>
                    <div class="mhCaWrap">
                        <div class="mhCa">
                            <a href="${pageContext.request.contextPath}/map/mapHome/${mapDetailTop.volunteerNo}?cp=${pagination.currentPage}${sURL}" id="mapVoRe">홈</a>
                            <a href="/html/map/mapSosick.html">소식</a>
                            <a href="${pageContext.request.contextPath}/map/mapVoRe/${mapDetailTop.volunteerNo}?cp=${pagination.currentPage}${sURL}" id="mapVoRe">리뷰</a>
                            <a href="/html/map/mapPic.html">사진</a>
                        </div>
                    </div>
                </div>

                
                <!-- 여기부터 지우고 만들면 됨 -->
                <div class="mvWrap">
                    <div class="mvWrapBox">
                        <div class="mvBtn">
                            <div class="mvBtnWrap">
                                <div class="mvBtnRe">
                                    <a href="${pageContext.request.contextPath}/map/mapVoRe/${mapDetailTop.volunteerNo}?cp=${pagination.currentPage}${sURL}" class="mvBtnspan">
                                        <span class="mvBtnspan_1"><i class="fa-regular fa-comments"></i></span>
                                        <span class="mvBtnspan_1">봉사자 리뷰</span>
                                    </a>
                                </div>
                                <div class="mvBtnSo">
                                    <a href="${pageContext.request.contextPath}/map/mapVoSo/${mapDetailTop.volunteerNo}?cp=${pagination.currentPage}${sURL}" class="mvBtnspan_b">
                                        <span><i class="fa-regular fa-heart"></i></span>
                                        <span mvBtnspan_2>봉사자 소식</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="mvReNo">
                            <div class="mvRe">
                                <span>소식</span>
                                <span>22</span>
                            </div>
                        </div>

                        <div class="mvReWrap">
                            <div class="mvReBox">
                                <c:choose>
                                    <c:when test="${empty mapDetailReviewStory}">
                                        <span> 없습니다.</span>
                                </c:when>
                                <c:otherwise>
                                        <ul class="mvReUl">
                                            <c:forEach var="mapDetailReviewStory" items="${mapDetailReviewStory}">
                                                <li class="mvReLi">
                                                    <a href="">
                                                        <div class="mvReliBox">
                                                            <div class="mvRelili">
                                                                <div class="mvReliliDe">
                                                                    <div class="mvReliDe">
                                                                        <div class="mvReDeTi">
                                                                            <div class="mvReImg">
                                                                                <img src="${pageContext.request.contextPath}${mapDetailReviewStory.agencyAttachment}" alt="">
                                                                            </div>
                                                                            <span>
                                                                                ${mapDetailReviewStory.agencyName}
                                                                            </span>
                                                                        </div>
                                                                        <div class="mvReDate">
                                                                            <div class="mvReDateDe">
                                                                                <span>${mapDetailReviewStory.enrollDate}</span>
                                                                                <span>${mapDetailReviewStory.enrollDay}</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="mvsWrap">
                                                                        <div class="mreTi">
                                                                            <span>
                                                                                ${mapDetailReviewStory.reviewTitle}                                                                            </span>
                                                                        </div>
                                                                        <div class="mreDe">
                                                                            <span>
                                                                                ${mapDetailReviewStory.reviewContent}  
                                                                            </span>
                                                                            <div class="mreImg">
                                                                                <img src="${pageContext.request.contextPath}${mapDetailReviewStory.reviewAttachement}" alt="">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>  
                                                    </a>     
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </c:otherwise>
                                </c:choose>
                            </div>
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
            jQuery.each(include1, function () {
                $(this).load('/html/01.header.html');
            });
        });

    </script>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a57d546fefaefbc7ac5bde8a6eb90ec&libraries=services"></script>
<script src="${pageContext.request.contextPath}/resources/js/map/map.js"></script>
</body>
</html>