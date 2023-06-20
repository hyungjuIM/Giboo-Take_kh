<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>알림창</title>
    
    
    
    
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/alarm.css">

    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/reset.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- jQuery 라이브러리 추가(CDN) 
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
-->

    </head>

<body>
    <div class="alert_container" >
    	
    	  	<%-- 알림 카드부분  --%>
        <div class="alert_myfavcard_contaner" id="alarmList">
            <div class="myalert_container">
             	<%-- 작은동그라미 --%>
                <div class="smallC_Container">
                    <div class="smallC"> </div>
                </div>
                <%--  이모티콘 --%>
                <div class="alert_categoryImgContainer">
                    <div class="alert_categoryImg"><i class="fa-solid fa-person-cane"></i></div>
                    <%-- 점선 --%>
                    <div class="alert_hrpart">
                        <div class="alert_hrpart2"></div>
                    </div>
                </div>

                <%-- 메인내용 --%>
                <div class="alert_Maincontainer">
                    <%-- 카테고리, 마감일, 메인 --%>
                    <div class="alert_categoryUpdateContainer">
                        <div class="alert_detailCategory">
                            <div style="color: #8071fc;">참여완료</div>
                        </div>
                        <div class="alert_updateDate">15시간 전</div>
                    </div>

                    <%-- 제목, 작성자, 달성률, 총기부금액 --%>
                    <div class="alert_titleContainerA">
                        <div class="alert_titleContainer" id="alarmList">
                            <div class="alertTitle"><a href="#">강릉 산불 피해 주민분들을 위한 모금</a></div>
                            <div class="alertWriter">밀알 복지 재단</div>
                            <div class="achieveAlert">기부 > 환경</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <%-- ------------------------------------------ --%>
  
        
        
        <%--------------------------------------------- --%>
          

        <%-- 더보기 탭 --%>
        <div class="alert_addTab">
            <div class="alert_addTab_text" id="alertAdd">더보기</div>
        </div>
   	
    </div>

    <script
		src="${pageContext.request.contextPath}/resources/js/main/alarm.js"></script>



</body>

</html>