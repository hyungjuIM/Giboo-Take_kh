<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/event/eventDetail.css">

</head>
<body>
        <div class="edInBarBox">
            <div class="edInTitle">
                <span>🥰</span>
                <span>${eventDetailTop.eventTitle}</span>
            </div>
            <div class="edInPhotoBar">
                <c:choose>
                    <c:when test="${empty eventStickerBar}">
                        <ul class="edInPhotoBarUl">
                            <li class="edInPhotoBarLi">
                                <span>존재하는 이벤트 사진이 없습니다.</span>
                            </li>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <ul class="edInPhotoBarUl">
                            <c:forEach var="eventStickerBar" items="${eventStickerBar}">
                                <li class="edInPhotoBarLi">
                                    <div class="edInPhotoImg">
                                        <img src="${pageContext.request.contextPath}${eventStickerBar.eventCertificationAttachment}" alt="">
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </div>
            <a href="">
                <div class="edBtnDe">
                    <span>이벤트 참여하기</span>
                </div>
            </a>
        </div>
    </div>
</body>
</html>