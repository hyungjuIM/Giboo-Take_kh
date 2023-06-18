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
    
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
        integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    
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
                    <div class="edWrapBar">
                        <div class="edDoBar">
                            <progress value="80" max="100"></progress>
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
                        </div>
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
                                                    <img src="${pageContext.request.contextPath}${eventDetailMember.profileImg}" alt="">
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
                        <a href="">
                            <div class="edBtnDe">
                                <span>이벤트 함께하기</span>
                            </div>
                        </a>
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
    </body>
    </html>
