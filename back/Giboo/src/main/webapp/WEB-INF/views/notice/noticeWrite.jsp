<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>noticeWrite</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/noticeWrite.css" />
    <!-- jQuery 라이브러리 추가(CDN) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>



  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- 서머노트를 위해 추가해야할 부분 -->
    <script src="/JS/summernote/summernote-lite.js"></script>
    <script src="/JS/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="/css/summernote/summernote-lite.css">
    <!--  -->

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
        <div class="mainContent"> 
            <!-- 제목 -->
            <div class="TitleBox">
                <div class="title"> <input type="text" placeholder="제목을 입력해 주세요"></div>
               
            </div>
        
            <!-- 본문 -->
        <form action="#" method="post" class="contentContiner">
            <textarea class="summernote" name="editordata"></textarea>
           </form>  
          <script>
          $('.summernote').summernote({
            placeholder : '내용을 입력해 주세요',
            width:1080,
                height: 500,
                minHeight:null,
                maxHeight: null,             // 최대 높이
		        focus: true,
                lang: "ko-KR", toolbar: [
                ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['forecolor','color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['height', ['height']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          
          ],
          fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
              });
          </script>

          <!-- 목록 알림 등록 취소 영역 -->
          <div class="submitContainer">
            <button class="listBack">목록으로</button>
            <div class="alarmCheck"><input type="checkbox"> 알림 보내기</div>
            <button class="save">등록</button>
            <button class="cancel">취소</button>
          </div>

         
     

        </div>
    </section> 
</main>

     <!-- jQuery 라이브러리 추가 -->
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"
     integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>
        $(function () {
            var include1 = $('[data-include1="header"]');
            jQuery.each(include1, function () {
                $(this).load('/html/01.header.html');
            });
        });

    </script>

<script type="text/javascript">
    jQuery(document).ready(function() {
    
        $('#summernote').summernote({
            lang : 'ko-KR',              // default: 'en-US'
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true,                 // set focus to editable area after initializing summernote
            toolbar: [
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['color', ['color']],
                ['para', ['paragraph']],
                ['insert', ['picture', 'link', 'video']],
                ['view', ['codeview']]
            ],
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica neue', 'Helvetica', 'Impact', 'Lucida Grande', 'Tahoma', 'Times New Roman', 'Verdana', 'Tahoma', 'Courier New', '맑은 고딕', '굴림', '돋움'],
            fontNamesIgnoreCheck: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica neue', 'Helvetica', 'Impact', 'Lucida Grande', 'Tahoma', 'Times New Roman', 'Verdana', 'Tahoma', 'Courier New',  '맑은 고딕', '굴림', '돋움'],
        });
    
    });
</script>
<!-- 푸터 영역 -->
<header>
    <jsp:include page="/WEB-INF/views/main/footer.jsp" />
</header>


</body>
</html>