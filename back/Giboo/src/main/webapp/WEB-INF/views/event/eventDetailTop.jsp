<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>이벤트 디테일 사진</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/event/eventDetail.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/event/eventPopup.css">
    
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
        integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- jQuery 라이브러리 추가(CDN) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/50a1d35924.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
    </head>
    <body>
    
        <main>
            <div class="edWrapBox">
                <div class="edWrap">
                    <img src="${pageContext.request.contextPath}${eventDetailTop.attachment}" alt="">
                </div>
                <div class="edWrapDetail">
                    <div class=edWrapPeriod>
                        <div class="edWrapPeriodSpan">
                            <span>${eventDetailTop.result}</span>
                            <span>일 남음</span>
                        </div>
                    </div>
                    <div class="edWrapTitle">
                        <span>${eventDetailTop.eventTitle}</span>
                    </div>
                    <%-- ====================================== --%>
                    <div class="progressArea">
                        <div class="progressInfo">
                            <span class="progressPercentage">${eventDetailTop.percent}%</span>
                                <span class="goal">
                                    목표
                                    <span class="goal" id="goalValue">${eventDetailTop.targetPeople}</span>명
                            </span>
                        </div>

                        <div class="progressBar">
                            <div class="progressBarValue" style="width: ${eventDetailTop.percent}%"></div>
                        </div>

                        <div class="progressStatus">
                            <span>
                                <img src="${pageContext.request.contextPath}/resources/images/comment-regular.svg">
                                <span id="volunteerCount">${eventDetailTop.eventPersonCount}</span>명 참여중</span>
                            <span>
                                <img src="${pageContext.request.contextPath}/resources/images/heart-regular.svg">
                                <span id="recommendedCount">102</span>명 추천</span>
                        </div>
                    </div>

                    <%-- ====================================== --%>
                    
                    
                    <div class="edWrapBar">
                        <%--  <div class="edDoBar">
                            <progress value="${eventDetailTop.eventPersonCount}" max="${eventDetailTop.targetPeople}"></progress>
                        </div>
                        <div class="edWrapBar_2">
                            <div class="edVolDo">
                                <span>❤️</span>
                                <span>${eventDetailTop.eventPersonCount}</span>
                                <span>명 참여중</span>
                            </div>
                            <div class="edVolDo">
                                <span>${eventDetailTop.targetPeople}</span>
                                <span>명 목표</span>
                            </div>
                        </div>  --%>
                        
                    </div>
                    <div class="edDoTo">
                        <div class="edDoTitle">
                            <span>함께하고 있어요 😋</span>
                        </div>
                        <div class="edDoPerson">
                            <c:choose>
                                <c:when test="${empty eventDetailMember}">
                                    <ul class="edDoPersonUl">
                                        <li class="edDoPersonLi">
                                            <span>참여자가 없습니다.</span>
                                        </li>
                                    </ul>
                                </c:when>
                                <c:otherwise>
                                    <ul class="edDoPersonUl">
                                        <c:forEach var="eventDetailMember" items="${eventDetailMember}">
                                            <li class="edDoPersonLi">
                                                <div class="edDoPerImg">                        
                                                    <c:if test="${empty eventDetailMember.profileImg}">
                                                        <span>🥰</span>
                                                    </c:if>
                                                    <c:if test="${!empty eventDetailMember.profileImg}">
                                                        <img src="${pageContext.request.contextPath}${eventDetailMember.profileImg}" alt="">
                                                    </c:if>
                                                </div>
                                                <div class="edPersonName">
                                                    <span>${eventDetailMember.memberNick}</span>
                                                    <span>님</span>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="edBtn">
                        <div class="edBtnDe">
                            <button id="popupButton">이벤트 함께하기</button>                        
                        </div>
                        <div class="edStamp">
                            <div class="edStampPopup">
                                <div class="edStampPopDe">
                                    <span>참여하고 스템프 받아요!</span>
                                </div>
                            </div>
                            <a href="">
                                <div class="edStampBtn">
                                    <span>🥰</span>
                                </div>
                            </a>
                        </div>
                    </div> 
                </div>
            </div>
    </main>     





    <script>
        // 댓글 관련 JS 코드에 필요한 값을 전역 변수로 선언

        // jsp 파일 : html, css, js, el, jstl 사용 가능
        // js  파일 : js

        // 코드 해석 순서  :   EL == JSTL > HTML > JS

        // ** JS 코드에서 EL/JSTL을 작성하게 된다면 반드시 ""를 양쪽에 추가 **

        // 최상위 주소
        const contextPath = "${pageContext.request.contextPath}";
        
        // 게시글 번호
        const boardNo = "${detail.boardNo}"; // "500"

        // 로그인한 회원 번호
        const loginMemberNo = "${loginMember.memberNo}";
        // -> 로그인 O  : "10";
        // -> 로그인 X  : "";  (빈문자열)

    </script>
    
<script src="${pageContext.request.contextPath}/resources/js/event/event.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/event/eventPopup.js"></script>
    </body>
    </html>
