<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>donationStory</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/donation/donationStory.css">
</head>
<body>
<header>
    <jsp:include page="/WEB-INF/views/main/header.jsp" />
</header>

<div class="mainCategoryArea">
    <div class="mainCategoryInner">
        <a href="${pageContext.request.contextPath}/donation/home" class="mainCategoryItem " id="home">기부 진행중</a>
        <a href="${pageContext.request.contextPath}/donation/storyList" class="mainCategoryItem mainCategoryChecked" id="story">기부이야기</a>
    </div>
</div>

<section class="mainContainer">
    <div class="mainContent">
        <div class="storyTitle">${story.donationStoryTitle}</div>

        <div class="categoryArea">
            <span class="type">기부</span>
            <img src="${pageContext.request.contextPath}/resources/images/minus-solid.svg">
            <span class="category">동물</span>
        </div>

        <div class="infoArea">
            <span class="writerArea">작성자 : <span class="writerName">${story.memberNick}</span></span>
            <span class="enrollDate">${story.enrollDt}</span>
        </div>

        <div class="contentArea">
            <div class="content">
                <c:out value="${story.donationStoryContent}" escapeXml="false" />
            </div>
        </div>

        <div class="optionArea">
            <a href="${pageContext.request.contextPath}/donation/storyList?cp=${param.cp}" class="list">목록으로</a>
            <div>
                <a href="${pageContext.request.contextPath}/donation/storyWrite?mode=update&cp=${param.cp}&no=${story.donationStoryNo}" class="edit">수정</a>
                <button class="delete" id="storyDelete">삭제</button>
            </div>
        </div>

    </div>
</section>

<footer>
    <jsp:include page="/WEB-INF/views/main/footer.jsp" />
</footer>

<script>
    const storyDelete = document.getElementById("storyDelete");

    storyDelete.addEventListener("click", () => {
        const url = "${pageContext.request.contextPath}/donation/storyDelete/${story.donationStoryNo}";

        if( confirm("정말로 삭제 하시겠습니까?") ){
            location.href = url; // get방식으로 url에 요청
        }
    });
</script>

<script src="${pageContext.request.contextPath}/resources/js/donation/donationStory.js"></script>
</body>
</html>