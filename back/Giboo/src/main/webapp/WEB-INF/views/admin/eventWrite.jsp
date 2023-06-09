<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
         <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>hunny</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/volunteer/volunteerWrite2.css">
</head>
<body>
<header>
    <jsp:include page="/WEB-INF/views/main/header.jsp" />
</header>

<div class="mainTitleArea">
    <div class="mainTitle">이벤트 등록</div>
</div>

<section class="mainContainer">
    <div class="mainContent">
        <form action="write" method="post" class="contentContainer">
            <ul class="writeArea">
                <li>
                    <div class="titleAreaInner">
                        <div class="listTitle">타이틀</div>
                        <input type="text" id="titleInput" name="eventTitle" placeholder="제목을 입력해 주세요." value="${eventDetail.eventTitle}">
                    </div>
                </li>


                <li>
                    <div>
                        <div class="listTitle">진행일</div>
                        <input type="date" id="beginDate" name="enrollDate" data-placeholder="시작일" aria-required="true" value="${eventDetail.enrollDate}">
                        <div class="margin">~</div>
                        <input type="date" id="endDate" name="endRecruitDate" data-placeholder="종료일" aria-required="true" value="${eventDetail.endRecruitDate}">
                    </div>
                </li>

                <li>
                    <div>
                        <div class="listTitle">목표 인원</div>
                        <input type="number" id="amount" name="targetPeople" placeholder="목표 인원을 입력해 주세요." min="1" value="${eventDetail.targetPeople}">
                    </div>
                </li>


                <li>
                    <div class="contentArea">
                        <div class="listTitle">내용</div>
                        <textarea id="summernote" name="eventContent" placeholder="이벤트 내용&인증방법을 작성해 주세요."></textarea>
                    </div>
                </li>


                <li>
                    <div class="contentArea">
                        <div class="listTitle">인증방법</div>
                        <textarea name="eventCertificationContent" placeholder="사진 첨부하면 안돼요" value="${eventDetail.eventCertificationContent}"></textarea>
                    </div>
                </li>

                <li>
                    <div class="imgInputArea">
                        <div class="listTitle">썸네일</div>
                        <div class="imgInputInner">
                            <input id="imgInput" name="eventAttachment" type="file" accept="image/*">
                            <label for="imgInput" class="imgSelectButton">찾아보기</label>
                            <div id="imgInputPlaceholder"></div>
                        </div>
                    </div>
                </li>
            </ul>

            <div class="optionArea">
                <a href="" class="list" type="button">목록으로</a>
                <div>
                    <button type="submit" class="edit">등록</button>
                    <button class="delete" type="button">취소</button>
                </div>
            </div>

            <!-- 동작 구분 -->
            <input type="hidden" name="mode" value="${param.mode}">

            <!-- 게시글 번호 (커맨드객체 NoticeDetail.noticeNo 세팅) -->
            <input type="hidden" name="eventNo" value="${empty param.no ? 0 : param.no}">

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

<script src="${pageContext.request.contextPath}/resources/js/event/eventWrite2.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
$(document).ready(function () {
    const url = new URL(window.location.href);
    console.log("url: " + url);

    const urlParams = url.searchParams;
    const mode = urlParams.get('mode');
    console.log("mode: " + mode);

    const content = "${eventDetail.eventContent}";

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