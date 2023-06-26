<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="pagination" value="${map.pagination}" />
<c:set var="mapList" value="${map.mapList}" />

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
        

    </head>
    <body>
        <header>
            <jsp:include page="/WEB-INF/views/main/header.jsp" />
        </header>

        <div class="map_wrap" id="map_wrap">
            <div id="map" style="width: 100%; height: 100vh; overflow: hidden;"></div>

            <c:if test="${!empty param.key}">
                <c:set var="sURL" value="&key=${param.key}&query=${param.query}" />
            </c:if>
            <div id="menu_wrap" class="bg_white">

                <!-- 검색하는 영역 -->
                <div class="option">
                    <jsp:include page="/WEB-INF/views/map/mapSearchBar.jsp" />
                </div>

                <!-- 내 위치 나오는 영역 -->
                <div class="myLoca">
                    <div class="myLoDe">
                        <a href="" class="myLoDetail">
                            <span>🖐️</span>
                            <span>강남구 역삼1동</span> 
                            <c:if test="${!empty param.key}">
                                <h3 style="margin-left:30px;"> "${param.query}" 검색 결과  </h3>
                            </c:if>
                        </a>
                    </div>
                </div>

                <!-- 내 위치 주변 봉사 가능한 곳 -->
                <div class="mmyloca">
                    <span>현재 위치 주변 봉사 가능한 곳</span>
                    <span></span>
                </div>


                <!-- 검색했을 때 & 내 주변 위치 나오는 기본 리스트 영역 -->
                <div class="mlistwrap">
                    <div class="mlistbox">
                        <div class="mlist">
                            <ul class="mlistUl">
                                <c:choose>
                                    <c:when test="&{empty mapList}">
                                        <span>목록이 존재하지 않습니다.</span>
                                    </c:when>
                                    <c:otherwise>        
                                        <c:forEach var="mapList" items="${mapList}">
                                            <li class="mlistLi">
                                                <a href="../map/mapHome/${mapList.volunteerNo}?cp=${pagination.currentPage}${sURL}">
                                                    <img src="${pageContext.request.contextPath}${mapList.volunteerAttachement}" alt="">
                                                    <div class="mlistDetail">
                                                        <!-- 카테고리와 즐겨찾기 숫자 나오는 영역 -->
                                                        <div class="mlistTi">
                                                            <div class="mlistCa">
                                                                <span>${mapList.parentCategoryName}</span>
                                                            </div>
                                                        </div>
                                                        <!-- 봉사센터 이름 영역 -->
                                                        <div class="mlistName">
                                                            <span>${mapList.agencyName}</span>
                                                        </div>
                                                        <!-- 봉사센터 주소 영역 -->
                                                        <div class="mlistAdd">
                                                            <span>${mapList.volunteerAddr}</span>
                                                        </div>
                                                        <!-- 봉사자 리뷰 & 봉사자 숫자 영역 -->
                                                        <div class="mlistDo">
                                                            <span>봉사자 리뷰</span>
                                                            <span class="mDe">${mapList.replyCount}</span>
                                                            <span>|</span>
                                                            <span>봉사자</span>
                                                            <span class="mDe">${mapList.volunteerCount}</span>
                                                        </div>
                                                    </div>
                                                </a>
                                                <div class="mbox"></div>
                                            </li>
                                        </c:forEach>                        
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="pagination-area">

                    <!-- 페이지네이션 a태그에 사용될 공통 주소를 저장한 변수 선언 -->
                    <c:set var="url" value="?cp="/>

                    <ul class="pagination">
                        <!-- 첫 페이지로 이동 -->
                        <li><a href="${url}1${sURL}">&lt;&lt;</a></li>

                        <!-- 이전 목록 마지막 번호로 이동 -->
                        <li><a href="${url}${pagination.prevPage}${sURL}">&lt;</a></li>

                        <!-- 범위가 정해진 일반 for문 사용 -->
                        <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                            <c:choose>
                                <c:when test="${i == pagination.currentPage}">
                                    <li><a class="current">${i}</a></li>
                                </c:when>

                                <c:otherwise>
                                    <li><a href="${url}${i}${sURL}">${i}</a></li>        
                                </c:otherwise>
                            </c:choose>

                        </c:forEach>
                        
                        <!-- 다음 목록 시작 번호로 이동 -->
                        <li><a href="${url}${pagination.nextPage}${sURL}">&gt;</a></li>

                        <!-- 끝 페이지로 이동 -->
                        <li><a href="${url}${pagination.maxPage}${sURL}">&gt;&gt;</a></li>

                    </ul>
                </div>
            </div>
        </div>










        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a57d546fefaefbc7ac5bde8a6eb90ec&libraries=services"></script>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <script src="${pageContext.request.contextPath}/resources/js/map/map.js"></script>

    </body>
</html>
