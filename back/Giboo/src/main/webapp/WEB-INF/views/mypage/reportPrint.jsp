<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>증명서출력</title>

     <!-- jQuery 라이브러리 추가 -->
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"
     integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>



    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/reportPrint.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/reset.css">
</head>
<body>
    
    
    
   <main>
    
    <div class="reportContainer">
        <div class="reportPrint">
            <button class="print" onclick="printPage()"><b>증명서 출력</b></button> 
        </div>
        <div class="reportContent">
                
            <div class="reportTitle1">봉사(기부금) 인증서</div>
            <div class="reportCont1">
                <span class="reportCont2">성명  </span>
                <span class="reportCont3"> : 홍길동</span>
            </div> 
            <div class="reportCont1">
                <span class="reportCont2">주소  </span>
                <span class="reportCont3"> : 경기도 용인시 수지구 용구대로 </span>
            </div>
            <div class="reportTitle2_container">
                <span class="reportTitle2"><자원봉사(기부금) 실적></span>
            </div>  
            <div class="reportCont1">
                <span class="reportCont2">기간  </span>
                <span class="reportCont3"> : 2023.06.06</span>
            </div>
            <div class="reportCont1">
                <span class="reportCont2">시간(금액) </span>
                <span class="reportCont3"> : 6시간</span>
            </div>
            <div class="reportCont1">
                <span class="reportCont2">봉사활동(기부금) 내용</span>
                <span class="reportCont3"> : 치매안심센터-기억력 검진 봉사활동</span>
            </div>

            <div class="reportCont1">
                <span class="reportCont2">장소</span>
                <span class="reportCont3"> : 노인복지회관</span>
            </div>

            <div class="reportCont4">
                「소득세법」 제34조, 「조세특례제한법」 제75조ㆍ제88조의4 및 「법인세법」 제24조에 따른 기부금을 위와 같이 
                <br>기부하였음을 증명하여 주시기 바랍니다.<br>   
                사회복지자원봉사 인증관리규정 제9조 제3항에 따라 위와 같이 자원봉사 활동실적이 있음을 인증합니다
            </div>
            <div class="reportDate">2023년 06월 07일</div>

            <div class="reportName">Giboo&take</div>
        </div>
    </div>


   </main>



    <script src="${pageContext.request.contextPath}/resources/js/mypage/reportPrint.js"></script>
</body>
</body>
</html>