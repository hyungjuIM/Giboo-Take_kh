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
    <title>eventWrite2</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/eventWrite2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css" />
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
            <form action="noticeWrite" method="POST" class="mainContent" onsubmit="return noticeWriteValidate()"> 
                <ul class="writeArea">
                    <li>
                        <div class="titleAreaInner">
                            <div class="listTitle">이벤트명</div>
                            <input type="text" id="titleInput" placeholder="제목을 입력해 주세요.">
                        </div>
                    </li>

                    <li>
                        <div class="titleAreaInner">
                            <div class="listTitle">목표인원 수</div>
                            <input type="text" id="targetInput" placeholder="참여인원을 입력해 주세요.">
                        </div>
                    </li>
                    <li>
                        <div>
                            <div class="listTitle">이벤트 기간 </div>
                            <input type="date" id="beginDate" data-placeholder="시작일" required aria-required="true">
                            <div class="margin">~</div>
                            <input type="date" id="endDate" data-placeholder="종료일" required aria-required="true">
                        </div>
                    </li>

                    <li>
                        <div class="contentArea">
                            <div class="listTitle">내용1</div>
                            <textarea id="summernote" name="noticeContent"></textarea>
                        </div>
                    </li>

                    <li class="eventWrite2">
                        <div class="listTitle">내용2</div>
                        <textarea id="summernote" name="noticeContent"></textarea>
                    </li>
                </ul>

                <div class="optionArea">
                    <a href="" class="list">목록으로</a>
                    <div>
                        <div class="alarmCheck"><input type="checkbox" name="sendAlarm" value="sendAlarm" checked> 알림 보내기</div>
                        <button type="submit" class="edit">등록</button>
                        <button class="delete">취소</button>
                    </div>
                </div>

                <!-- 숨겨진 값(hidden) -->
                <!-- 동작 구분 -->
                <input type="hidden" name="mode" value="${param.mode}">

                <!-- 게시글 번호 (커맨드객체 NoticeDetail.noticeNo 세팅) -->
                <input type="hidden" name="noticeNo" value="${empty param.no ? 0 : param.no}">
                
                <!-- 현재 페이지 -->
                <input type="hidden" name="cp" value="${param.cp}">
            </form>

        </div>
    </section>

    <footer>
        <jsp:include page="/WEB-INF/views/main/footer.jsp" />
    </footer>

<!-- Summernote-->
<!-- <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>  -->
 <script src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js" ></script>
 <script src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js" ></script>
 <script src="${pageContext.request.contextPath}/resources/js/summernote/writeForm.js" ></script>
 <script src="${pageContext.request.contextPath}/resources/js/event/eventWrite2.js"></script>

 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
 integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
 crossorigin="anonymous" referrerpolicy="no-referrer" />

 <script src="https://kit.fontawesome.com/50a1d35924.js" crossorigin="anonymous"></script>

    

    <script>
        $(document).ready(function () {
            const url = new URL(window.location.href);
            console.log("url" + url);

            const urlParams = url.searchParams;
            const mode = urlParams.get('mode');
            console.log(mode);

            const content = "${noticeDetail.noticeContent}";

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