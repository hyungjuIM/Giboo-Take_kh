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
        <title>noticeWrite</title>
        
       
         

    
        <!-- Summernote-->
        
    
        
        
        <!--  -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/reset.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice/noticeWrite.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css" />
    </head>
    
    <body>
        
        <header>
            <jsp:include page="/WEB-INF/views/main/header.jsp" />
        </header>
    <main>
        <div class="page-title">
            <span>공지사항</span>
        </div>

        <section class="mainContainer">
            <form action="noticeWrite" method="POST" class="mainContent" onsubmit="return noticeWriteValidate()"> 
                <!-- 제목 -->
                <div class="TitleBox">
                    <div class="title"> <input name="noticeTitle" type="text" placeholder="제목을 입력해 주세요" value="${noticeDetail.noticeTitle}"></div>
                </div>
                
                <!-- 본문 -->
                
                <div class="contentContiner">
                    <textarea id="summernote" name="noticeContent"></textarea>
                    
                </div>

                <!-- 목록 알림 등록 취소 영역 -->
                <div class="submitContainer">
                    <button type="button" class="listBack" onclick="history.back();">목록으로</button>
                    <div class="alarmCheck"><input type="checkbox" name="sendAlarm" value="sendAlarm" checked> 알림 보내기</div>
                    <button type="submit" class="save">등록</button>
                    <button type="button" class="cancel" onclick="history.back();">취소</button>
                </div>
                
                   <!-- 숨겨진 값(hidden) -->
            <!-- 동작 구분 -->
            <input type="hidden" name="mode" value="${param.mode}">

            <!-- 게시글 번호 (커맨드객체 NoticeDetail.noticeNo 세팅) -->
            <input type="hidden" name="noticeNo" value="${empty param.no ? 0 : param.no}">
            
            <!-- 현재 페이지 -->
            <input type="hidden" name="cp" value="${param.cp}">

            </form>
        </section> 
    </main>

    <!-- 푸터 영역 -->
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
 <script src="${pageContext.request.contextPath}/resources/js/notice/noticeWrite.js" ></script>

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