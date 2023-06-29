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
        <a href="${pageContext.request.contextPath}/volunteer/story" class="mainCategoryItem mainCategoryChecked" id="story">봉사이야기</a>
    </div>
</div>

<section class="mainContainer">
    <div class="mainContent">
        <div class="storyTitle">Story Title</div>

        <div class="categoryArea">
            <span class="type">봉사</span>
            <img src="${pageContext.request.contextPath}/resources/images/minus-solid.svg">
            <span class="category">동물</span>
        </div>

        <div class="infoArea">
            <span class="writerArea">작성자 : <span class="writerName">김김김</span></span>
            <span class="enrollDate">2023. 01. 01</span>
        </div>

        <div class="contentArea">
            <img class="contentImg" src="${pageContext.request.contextPath}/resources/images/all-about-tabby-cats-552489-hero-a23a9118af8c477b914a0a1570d4f787.jpg">
            <div class="content">
                <h4>What is Lorem Ipsum?</h4><br>
                Lorem Ipsum is simply dummy text of the printing and typesetting industry.<br>
                Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,<br>
                when an unknown printer took a galley of type and scrambled it to make a type specimen book.<br>
                <br>
                It has survived not only five centuries,<br>
                but also the leap into electronic typesetting, remaining essentially unchanged.<br>
                <br>
                It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,<br>
                and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br>
                <br>
                <h4>Why do we use it?</h4><br>
                It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<br>
                The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,<br>
                as opposed to using 'Content here, content here',<br>
                making it look like readable English.<br>
                <br>
                Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text,<br>
                and a search for 'lorem ipsum' will uncover many web sites still in their infancy.<br>
                Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br>
                <br>
                <h4>Where does it come from?</h4><br>
                Contrary to popular belief, Lorem Ipsum is not simply random text.<br>
                It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.<br>
                Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia,<br>
                looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage,<br>
                and going through the cites of the word in classical literature, discovered the undoubtable source.<br>
                <br>
                Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero,<br>
                written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance.<br>
                <br>
                The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.<br>
                <br>
                The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.<br>
                Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form,<br>
                accompanied by English versions from the 1914 translation by H. Rackham.<br>
                <br>
                <h4>Where can I get some?</h4><br>
                There are many variations of passages of Lorem Ipsum available,<br>
                but the majority have suffered alteration in some form, by injected humour,<br>
                or randomised words which don't look even slightly believable.<br>
                If you are going to use a passage of Lorem Ipsum,<br>
                you need to be sure there isn't anything embarrassing hidden in the middle of text.<br>
                <br>
                All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary,<br>
                making this the first true generator on the Internet.<br>
                It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures,<br>
                to generate Lorem Ipsum which looks reasonable.<br>
                The generated Lorem Ipsum is therefore always free from repetition,<br>
                injected humour, or non-characteristic words etc.<br>
            </div>
        </div>

        <div class="optionArea">
            <a href="" class="list">목록으로</a>
            <div>
                <a href="" class="edit">수정</a>
                <button class="delete">삭제</button>
            </div>
        </div>

    </div>
</section>

<footer>
    <jsp:include page="/WEB-INF/views/main/footer.jsp" />
</footer>

<script src="${pageContext.request.contextPath}/resources/js/volunteer/volunteerStory.js"></script>
</body>
</html>