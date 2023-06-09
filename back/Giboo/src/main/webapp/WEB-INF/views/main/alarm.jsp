<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>hunny</title>


   

<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/main/alarm.css">

<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/main/reset.css">
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">

<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
   integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
   crossorigin="anonymous" referrerpolicy="no-referrer" />



</head>

<body>



   <div class="alert_container" id="alarmList">
      <%-- 알림 카드부분  --%>
       
      <div class="alert_myfavcard_contaner" >
     
         <div class="alert_titleContainerA">
         <%-- 작은동그라미 --%>
         <div class="smallC_Container">
                    <div class="smallC" id="readStatus"> </div>
                </div>
                
                
         
            <div class="alert_titleContainer">
               <div class="alarmCategory">기부or봉사</div>
               <div class="alarmContent" id="alarmContent"></div>

               <div class="alarmDate"></div>
      
            </div>
         </div>
      </div>
   </div>
   
   <script
      src="${pageContext.request.contextPath}/resources/js/main/alarm.js"></script>



</body>

</html>