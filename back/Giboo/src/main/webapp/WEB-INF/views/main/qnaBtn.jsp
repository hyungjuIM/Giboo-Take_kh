<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/qnaBtn.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
    
     <!-- jQuery 라이브러리 추가(CDN) -->
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
            <!-- fontawesome -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
                integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
            <!--font-->
            <script src="https://kit.fontawesome.com/606ab3dc62.js" crossorigin="anonymous"></script>
    
</head>
<body>
    <section>
    	<div class="Qna-container">
        	<div class="QnABtn-icon show jittery" data-animate="shake">
            	<img src="${pageContext.request.contextPath}/resources/images/hunny.png" class="btn-emoji" >
        	</div>
        </div>	




        
    </section>
    
    <script src="${pageContext.request.contextPath}/resources/js/QnABtn.js"></script>
</body>
</html>