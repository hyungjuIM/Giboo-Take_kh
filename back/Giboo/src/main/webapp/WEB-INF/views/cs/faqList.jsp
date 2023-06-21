<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="cs-wrapper">
        <div class="cs-inquryBtnWrapper">
            <div class="cs-inquryBtn" >
                
                <a href="${pageContext.request.contextPath}WEB-INF/cs/faqVolunteer"><span>봉사</span></a> 
                <a href="${pageContext.request.contextPath}WEB-INF/cs/faqDonation"><span>기부</span></a> 
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

    	<script src="${pageContext.request.contextPath}/resources/js/cs/csMain.js"></script>
    </body>
</html>