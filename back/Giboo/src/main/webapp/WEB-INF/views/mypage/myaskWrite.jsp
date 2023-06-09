<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>hunny</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/reset.css">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/myaskWrite.css">
     


</head>

</head>

<body>
    <!-- 헤더 영역 -->
    <header>
		<jsp:include page="/WEB-INF/views/main/header.jsp" />
	</header>
	
    <main>
        <div class="page-title">
            <span>문의내역 작성</span>
          </div>
          

          

        
     <section class="ask_write_mainContainer">
        <div class="ask_write_mainContent"> 
            <!-- 제목 -->
            <div class="ask_write_TitleBox">
                <div class="ask_write_title"> <input type="text" placeholder="제목을 입력해 주세요"></div>
            </div>

            <div class="ask_write_TitleBox">
                <div class="ask_write_search-area">
                    <div class="myask_radio">분류</div>
                    <div class="myask_radio_group">                        
                        <label for="donation">
                            <input type="radio" id="donation" name="category" value="기부">
                            기부
                        </label>
                        <label for="volunteering">
                            <input type="radio" id="volunteering" name="category" value="봉사">
                            봉사
                        </label>
                    </div>
                    <div class="ask_write_search-filter"> 
                      <select id="filter" name="filter">
                        <option value="entire">전체</option>
                        <option value="young">아동청소년</option>
                        <option value="old">어르신</option>
                        <option value="disabled">장애인</option>
                        <option value="multiculture">다문화</option>
                        <option value="animal">동물</option>
                        <option value="environment">환경</option>
                        <option value="bloodDonation">헌혈</option>
                        <option value="enc">기타</option>
                      </select>
                    </div>
            </div>
        
            <!-- 본문 -->
        <form method="post" class="contentContiner" action="#">
                    <textarea id="summernote" name="editordata"></textarea>
                </form>


          <!-- 목록 알림 등록 취소 영역 -->
          <div class="ask_write_submitContainer">
                    <button class="listBack">목록으로</button>
                    <div class="alarmCheck"><input type="checkbox"> 알림 보내기</div>
                    <button class="save">등록</button>
                    <button class="cancel">취소</button>
                </div>

         
     

        </div>
    </section> 
</main>


<!-- 푸터 영역 -->

    <footer>
        <jsp:include page="/WEB-INF/views/main/footer.jsp" />
    </footer>
    
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet" />

<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script src="${pageContext.request.contextPath}/resources/js/summernote/noticeWrite.js" ></script>



</body>
</html>