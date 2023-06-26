<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이벤트 디테일 참여보드 사진</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/event/eventDetailBoard_photo.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
    integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

    <script src="https://kit.fontawesome.com/50a1d35924.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
</head>
<body>

    <header>
        <jsp:include page="/WEB-INF/views/main/header.jsp" />
    </header>


<main>
    <div class="edWrap">
        <jsp:include page="/WEB-INF/views/event/eventDetailTop.jsp" />
        
        <div class="edDetail">
            <div class="edDetailLeft">
                <div class="edCategory" id="edCategory">
                    <div class="edCategoryWidth">
                            <div class="edEventintro">
                                <a href="${pageContext.request.contextPath}/event/eventDetailMain/${eventDetailTop.eventNo}?cp=${pagination.currentPage}${sURL}">
                                    <span>이벤트 소개</span>
                                </a>
                            </div>
                            <div class="edEventintro">
                                <a href="">
                                    <span>인증 방법</span>
                                </a>
                            </div>
                            <div class="edEventintro">
                                <a href="${pageContext.request.contextPath}/event/eventDetailBoardPhoto/${eventDetailTop.eventNo}?cp=${pagination.currentPage}${sURL}">
                                    <span>참여보드</span>
                                </a>
                            </div>
                    </div>
                </div>
                <div class="edDetailWrap">
                    <div class="edDetailWrite">
                        <div class="ebpWrap">
                            <div class="ebpTitle">
                                <span>🥰</span>
                                <span>${eventDetailTop.eventTitle}</span>
                                <span>${eventDetailTop.eventPersonCount}</span>
                            </div>
                            <div class="ebpPhotoWrap">
                                <c:choose>
                                    <c:when test="${empty eventDetailBoardPhoto}">
                                        <span>존재하는 참여보드가 없습니다.</span>
                                    </c:when>
                                    <c:otherwise>
                                        <ul class="ebpPhotoWrapUl">
                                            <c:forEach var="eventDetailBoardPhoto" items="${eventDetailBoardPhoto}">
                                                <li class="ebpPhotoWrapLi">
                                                    <div class="ebpPhotoBox">
                                                        <div class="ebpPhotoImg">
                                                            <img src="${pageContext.request.contextPath}${eventDetailBoardPhoto.eventCertificationAttachment}" alt="">
                                                        </div>
                                                        <div class="ebpPhotoPro">
                                                            <span>${eventDetailBoardPhoto.memberNick}</span>
                                                            <div class="ebpPhotoProTime">
                                                                <span>${eventDetailBoardPhoto.time_Difference}</span>
                                                                <span>일 전</span>
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
            <div class="edDetailRight">
                <div class="edInBar">
                    <jsp:include page="/WEB-INF/views/event/eventStickerBar.jsp" />
                </div>
            </div>
        </div>
    </div>
</main>


<script>
    // 페이지 로드 시 스크롤 이동
    window.onload = function() {
        var element = document.getElementById("edCategory");
        if (element) {
            element.scrollIntoView();
        }
    };
</script>
</body>
</html>