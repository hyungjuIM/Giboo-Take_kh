<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>hunny </title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/donation/donationWrite2.css">
</head>
<body>
<header>
    <jsp:include page="/WEB-INF/views/main/header.jsp" />
</header>

<div class="mainTitleArea">
    <div class="mainTitle">기부등록</div>
</div>

<section class="mainContainer">
    <div class="mainContent">
        <form action="storyWrite" method="post" class="contentContainer">
            <ul class="writeArea">
                <li>
                    <div class="titleAreaInner">
                        <div class="listTitle">제목</div>
                        <input type="text" id="titleInput" name="donationStoryTitle" placeholder="제목을 입력해 주세요." value="${story.donationStoryTitle}">
                    </div>
                </li>

                <li>
                    <div class="contentArea">
                        <div class="listTitle">내용</div>
                        <textarea id="summernote" name="donationStoryContent"></textarea>
                    </div>
                </li>
            </ul>

            <div class="optionArea">
                <a href="" class="list">목록으로</a>
                <div>
                    <button type="submit" class="edit">등록</button>
                    <button class="delete">취소</button>
                </div>
            </div>

            <!-- 동작 구분 -->
            <input type="hidden" name="mode" value="${param.mode}">

            <!-- 게시글 번호 (커맨드객체 NoticeDetail.noticeNo 세팅) -->
            <input type="hidden" name="donationStoryNo" value="${empty param.no ? 0 : param.no}">

            <!-- 현재 페이지 -->
            <input type="hidden" name="cp" value="${param.cp}">
        </form>
    </div>
</section>

<footer>
    <jsp:include page="/WEB-INF/views/main/footer.jsp" />
</footer>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/summernote/writeForm.js" ></script>

<%--<script src="${pageContext.request.contextPath}/resources/js/donation/donationWrite2.js"></script>--%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    $(document).ready(function () {
        const url = new URL(window.location.href);
        console.log("url" + url);

        const urlParams = url.searchParams;
        const mode = urlParams.get('mode');
        console.log(mode);

        const content = "${story.donationStoryContent}";

        switch (mode) {
            case "insert":
                summernote();
                break;

            case "update":
                updateLoad(content);
                break;
        }
    });
</script>

</body>
</html>