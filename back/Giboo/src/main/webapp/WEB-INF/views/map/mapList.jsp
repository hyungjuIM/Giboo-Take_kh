<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8">
        <title>맵 기본리스트</title>
    
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/map/map.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/map/mapPopup.css">

 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
        integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://kit.fontawesome.com/50a1d35924.js" crossorigin="anonymous"></script>
        
        <!-- jQuery 라이브러리 추가(CDN) -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    
    </head>
    <body>
        <header>
            <jsp:include page="/WEB-INF/views/main/header.jsp" />
        </header>
    
    <div class="map_wrap">
        <div id="map" style="width: 100%; height: 100vh; overflow: hidden;"></div>
    
        <div id="menu_wrap" class="bg_white">
    
            <!-- 검색하는 영역 -->
            <div class="option">
                <div class="MsearchBar">
                    <form onsubmit="searchPlaces(); return false;">
                        <input type="text" value="" id="keyword" placeholder="봉사, 기부 장소 검색">
                        <button type="submit" class="MsearchBtn">🔍</button>  
                    </form>
                </div>
            </div>
    
            <!-- 내 위치 나오는 영역 -->
            <div class="myLoca">
                <div class="myLoDe">
                    <a href="" class="myLoDetail">
                        <span>🖐️</span>
                        <span>강남구 역삼1동</span> 
                    </a>
                    <button>위치수정</button>
                </div>
            </div>
    
            <!-- 내 위치 주변 봉사 가능한 곳 -->
            <div class="mmyloca">
                <span>현재 위치 주변 봉사 가능한 곳</span>
            </div>
    
            <!-- <ul id="placesList"></ul>
            <div id="pagination"></div> -->
    
            <!-- 검색했을 때 & 내 주변 위치 나오는 기본 리스트 영역 -->
            <div class="mlistwrap">
                <div class="mlistbox">
                    <div class="mlist">
                        <ul class="mlistUl">
                            <li class="mlistLi">
                                <a href="">
                                    <img src="${pageContext.request.contextPath}/resources/images/doCenter.jpg" alt="">
                                    <div class="mlistDetail">
                                        <!-- 카테고리와 즐겨찾기 숫자 나오는 영역 -->
                                        <div class="mlistTi">
                                            <div class="mlistCa">
                                                <span>장애인</span>
                                            </div>
                                            <div class="mlistHe">
                                                <span>14</span>
                                                <span><i class="fa-regular fa-heart"></i></span>
                                            </div>
                                        </div>
                                        <!-- 봉사센터 이름 영역 -->
                                        <div class="mlistName">
                                            <span>서울시림장애인행복플러스센터</span>
                                        </div>
                                        <!-- 봉사센터 주소 영역 -->
                                        <div class="mlistAdd">
                                            <span>서울 강남구 도곡로 416</span>
                                        </div>
                                        <!-- 봉사자 리뷰 & 봉사자 숫자 영역 -->
                                        <div class="mlistDo">
                                            <span>봉사자 리뷰</span>
                                            <span class="mDe">135</span>
                                            <span>|</span>
                                            <span>봉사자</span>
                                            <span class="mDe">432</span>
                                        </div>
                                    </div>
                                </a>
                                <!-- 봉사자 리뷰 리스트 영역 -->
                                <!-- <div class="mlistRe">
                                    <div class="mrePro"> -->
                                        <!-- 리뷰 슬라이드 버튼 -->
                                        <!-- <div class="mslideBtn">
                                            <div>
                                                <span>❤️</span>
                                            </div>
                                            <div>
                                                <span>😋</span>
                                            </div>
                                        </div> -->
                                        <!-- <ul class="mreProUl">
                                            <li class="mreProLi">
                                                <div class="mreProBox">
                                                    <a href="" class="mactive">
                                                        <div class="mreProli">
                                                            <div class="mproDe">
                                                                <img src="/images/news_1486098867_610387_m_1.jpg" alt="">
                                                                <span>지구용사썬가드</span>
                                                            </div>
                                                            <div class="mreDe">
                                                                <span>
                                                                    정말 뜻깊은 시간이었습니다. 추천해용!!!
                                                                    정말 뜻깊은 시간이었습니다. 추천해용!!!
                                                                    정말 뜻깊은 시간이었습니다. 추천해용!!!
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </li>
                                            <li class="mreProLi">
                                                <div class="mreProBox">
                                                    <a href="" class="mactive">
                                                        <div class="mreProli">
                                                            <div class="mproDe">
                                                                <img src="/images/news_1486098867_610387_m_1.jpg" alt="">
                                                                <span>야야얍!!</span>
                                                            </div>
                                                            <div class="mreDe">
                                                                <span>정말 뜻깊은 시간이었습니다. 추천해용!!!
                                                                    정말 뜻깊은 시간이었습니다. 추천해용!!!
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </li>
                                            <li class="mreProLi">
                                                <div class="mreProBox">
                                                    <a href="" class="mactive">
                                                        <div class="mreProli">
                                                            <div class="mproDe">
                                                                <img src="${pageContext.request.contextPath}/images/news_1486098867_610387_m_1.jpg" alt="">
                                                                <span>아아아~~~</span>
                                                            </div>
                                                            <div class="mreDe">
                                                                <span>정말 뜻깊은 시간이었습니다. 추천해용!!!
                                                                    정말 뜻깊은 시간이었습니다. 추천해용!!!
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </li>
                                            <li class="mreProLi">
                                                <div class="mreProBox">
                                                    <a href="" class="mactive">
                                                        <div class="mreProli">
                                                            <div class="mproDe">
                                                                <img src="/images/news_1486098867_610387_m_1.jpg" alt="">
                                                                <span>라라라라라랄라랄</span>
                                                            </div>
                                                            <div class="mreDe">
                                                                <span>정말 뜻깊은 시간이었습니다. 추천해용!!!
                                                                    정말 뜻깊은 시간이었습니다. 추천해용!!!
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </li>
                                        </ul> -->
                                    <!-- </div>
                                </div> -->
                                <div class="mbox"></div>
                            </li>
                            
                            <li class="mlistLi">
                                <a href="">
                                    <img src="${pageContext.request.contextPath}/resources/images/doCenter.jpg" alt="">
                                    <div class="mlistDetail">
                                        <!-- 카테고리와 즐겨찾기 숫자 나오는 영역 -->
                                        <div class="mlistTi">
                                            <div class="mlistCa">
                                                <span>장애인</span>
                                            </div>
                                            <div class="mlistHe">
                                                <span>14</span>
                                                <span><i class="fa-regular fa-heart"></i></span>
                                            </div>
                                        </div>
                                        <!-- 봉사센터 이름 영역 -->
                                        <div class="mlistName">
                                            <span>서울시림장애인행복플러스센터</span>
                                        </div>
                                        <!-- 봉사센터 주소 영역 -->
                                        <div class="mlistAdd">
                                            <span>서울 강남구 도곡로 416</span>
                                        </div>
                                        <!-- 봉사자 리뷰 & 봉사자 숫자 영역 -->
                                        <div class="mlistDo">
                                            <span>봉사자 리뷰</span>
                                            <span class="mDe">135</span>
                                            <span>|</span>
                                            <span>봉사자</span>
                                            <span class="mDe">432</span>
                                        </div>
                                    </div>
                                </a>
                                <div class="mbox"></div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
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
    
    
    
    <!-- 푸터 영역 -->
    <header>
        <jsp:include page="/WEB-INF/views/main/footer.jsp" />
    </header>
    
    
    
    
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a57d546fefaefbc7ac5bde8a6eb90ec&libraries=services"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/js/map/map.js"></script>

    </body>
    </html>