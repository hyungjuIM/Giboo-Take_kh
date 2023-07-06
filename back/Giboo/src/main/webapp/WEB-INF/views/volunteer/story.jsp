<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>volunteerStory</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/volunteer/volunteerStory.css">
</head>
<body>
<header>
    <jsp:include page="/WEB-INF/views/main/header.jsp" />
</header>

<div class="mainCategoryArea">
    <div class="mainCategoryInner">
        <a href="${pageContext.request.contextPath}/volunteer/home" class="mainCategoryItem" id="home">봉사 진행중</a>
        <a href="${pageContext.request.contextPath}/volunteer/storyList" class="mainCategoryItem mainCategoryChecked" id="story">봉사이야기</a>
    </div>
</div>

<section class="mainContainer">
    <div class="mainContent">
        <div class="storyTitle">${story.volunteerStoryTitle}</div>

        <div class="categoryArea">
            <span class="type">봉사</span>
            <img src="${pageContext.request.contextPath}/resources/images/minus-solid.svg">
            <span class="category">동물</span>
        </div>

        <div class="infoArea">
            <span class="writerArea">작성자 : <span class="writerName">${story.memberNick}</span></span>
            <span class="enrollDate">${story.enrollDt}</span>
        </div>

        <div class="contentArea">
            <div class="content">
                ${story.volunteerStoryContent}
            </div>
        </div>

        <div class="optionArea">
            <a href="${pageContext.request.contextPath}/volunteer/storyList?cp=${param.cp}" class="list">목록으로</a>
            <div>
                <a href="${pageContext.request.contextPath}/volunteer/storyWrite?mode=update&cp=${param.cp}&no=${story.volunteerStoryNo}" class="edit">수정</a>
                <button class="delete" id="storyDelete">삭제</button>
            </div>
        </div>

    </div>
</section>

<footer>
    <jsp:include page="/WEB-INF/views/main/footer.jsp" />
</footer>

<script src="${pageContext.request.contextPath}/resources/js/volunteer/volunteerStory.js"></script>

<script>
    const storyDelete = document.getElementById("storyDelete");

    storyDelete.addEventListener("click", () => {
        const url = "${pageContext.request.contextPath}/volunteer/storyDelete/${story.volunteerStoryNo}";

        if( confirm("정말로 삭제 하시겠습니까?") ){
            location.href = url; // get방식으로 url에 요청
        }
    });
</script>

</body>
</html>