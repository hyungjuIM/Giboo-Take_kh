<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>맵 리스트 봉사자 리뷰</title>
    <script src="https://kit.fontawesome.com/a06d7ad725.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/map/mapVoRe.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/map/mapHome.css">

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
                                <span>리뷰</span>
                                <span>${mapDetailTop.replyCount}</span>
                            </div>
                        </div>

                        <div class="mvReWrap">
                            <div class="mvReBox">
                                <c:choose>
                                    <c:when test="${empty mapDetailReviewReply}">
                                                <span> 없습니다.</span>
                                    </c:when>
                                    <c:otherwise>
                                        <ul class="mvReUl">
                                            <c:forEach var="mapDetailReviewReply" items="${mapDetailReviewReply}">
                                                <li class="mvReLi">
                                                    <div class="mvReliBox">
                                                        <div class="mvRelili">
                                                            <div class="mvReliliDe">
                                                                <div class="mvReliDe">
                                                                    <img src="${pageContext.request.contextPath}${mapDetailReviewReply.profileImg}" alt="">
                                                                    <span>${mapDetailReviewReply.memberNick}</span>
                                                                </div>
                                                                <div class="mreDe">
                                                                        <span>
                                                                            ${mapDetailReviewReply.replyContent}
                                                                        </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mvReDate">
                                                            <div class="mvReDateDe">
                                                                <span>${mapDetailReviewReply.enrollDate}</span>
                                                                <span>${mapDetailReviewReply.enrollDay}</span>
                                                            </div>
                                                        </div>
                                                    </div>       
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
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a57d546fefaefbc7ac5bde8a6eb90ec&libraries=services"></script>
<script src="/JS/map.js"></script>
</body>
</html>