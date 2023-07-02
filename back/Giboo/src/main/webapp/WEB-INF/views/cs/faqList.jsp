<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:set var="pagination" value="${map.pagination}" />
    <c:set var="faqList" value="${map.faqList}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>csMain page</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cs/csMain.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/reset.css">
    
	 	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	
		<!-- fontawesome -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	    integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	    crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <header>
            <jsp:include page="/WEB-INF/views/main/header.jsp" />
        </header>
    <main>
        <div class="page-title">
          <span>고객센터</span>
        </div>

       <div class="cs-container">	
    	<div class="cs-wrapper">
      	  <div class="cs-inquryBtnWrapper">
          	  <div class="cs-inquryBtn" >
                
                <a href="${pageContext.request.contextPath}/cs/faqVolunteer"><span>봉사</span></a> 
                <a href="${pageContext.request.contextPath}/cs/faqDonation"><span>기부</span></a> 
                <a href="${contextPath}/cs/faqEvent"><span>이벤트</span></a> 
                <a href="#"><span>지도</span></a>
                <a href="#"><span>적립금</span></a>
                <a href="#"><span>스탬프</span></a>
            </div>

            <div class="cs-inquryBtn" id="cs-inquryBtn">
                <a href="#"><span>환불문의</span></a>
                <a href="#"><span>신청문의</span></a>
                <a href="#"><span>취소문의</span></a>
            </div>
        </div>
    </div>
    
		<div class="cs-faqArea">
                <section class="cs-faqContainer">
                    <div class="faqContent">
                        <div class="faqNotice">
                            <span style="color: #767676;">Giboo&Take서비스의 봉사자(기부자)님의 &nbsp;</span><span style="color: #00CA61; font-weight: bold; font-size: 20px;">
                                 자주 찾으시는 목록 Best 10</span><span style="color: #767676;">을 알려드립니다 😇</span>
                        </div>
                        <hr>
						<!-- faq list -->
                        <div id="Accordion_wrap">
                                <c:choose>
                                    <c:when test="${empty faqList}">
                                        <span>자주찾는질문이 존재하지 않습니다.</span>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="faqList" items="${faqList}">
                                            <div class="que">
                                                <div class="queCategory">
                                                    <span>${faqList.faqCategory}</span>
                                                </div>
                                                <span>${faqList.faqTitle}</span>
                                                <div class="arrow-wrap">
                                                    <span class="arrow-top">></span>
                                                    <span class="arrow-bottom">></span>
                                                </div>
                                            </div>
                                            <div class="anw">
                                                <div class="anw2">
                                                    <span id="anw-content">${faqList.faqContent}</span>
                                                    <div class="dontAnw">
                                                        <span id="dontAnw-span">* 원하시는 답을 찾지 못하셨나요?</span>
                                                        <a href=""><span id="dontAnw-span2">1:1 문의</span></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                        </div>
					</div>
                   
                    <div class="container4">
                        <nav class="page-nav">
                            <c:set var="url" value="?cp=" />
                            <ul class="pagination">
                                <li><a href="${url}1${sURL}">&lt;&lt;</a></li>
                                <li><a href="${url}${pagination.prevPage}${sURL}">&lt;</a></li>
                                
                                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                                    <c:choose>
                                        <c:when test="${i == pagination.currentPage}">
                                            <li><a class="current">${i}</a></li>
                                        </c:when>

                                        <c:otherwise>
                                            <li><a href="${url}${i}${sURL}">${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>

                                </c:forEach>

                                <li><a href="${url}${pagination.nextPage}${sURL}">&gt;</a></li>
                                <li><a href="${url}${pagination.maxPage}${sURL}">&gt;&gt;</a></li>
                            </ul>
                        </nav>
                    </div>
                    
                </section>     
            </div>    
        </div>
        
        <!-- 푸터 영역 -->
        <footer>
        <jsp:include page="/WEB-INF/views/main/footer.jsp" />
        </footer>

    	<script src="${pageContext.request.contextPath}/resources/js/cs/csMain.js"></script>
    </body>
</html>