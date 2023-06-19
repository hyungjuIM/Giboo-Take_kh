<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>footer</title>
      
       
</head>
<body>
    <footer>
        <section class="footerContainer">
           <div class="footerContent">
           <div class="footerContent1">
               <!-- 로고 -->
              <div class="footerLogoContainer">로고 자리</div>
              <!-- 우리이야기, 개인정보 etc -->
              <div class="footerMainContainer">
               <div class="footerMain"><a href="">우리 이야기</a></div>
               <div class="footerMain"><a href="">개인정보취급방침</a></div>
               <div class="footerMain"><a href="${pageContext.request.contextPath}/termsOfService/termsOfService">이용약관</a></div>
               <div class="footerMain"><a href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a></div>
               <div class="footerMain"><a href="${pageContext.request.contextPath}/cs/csMain">고객센터</a></div>
              </div>
              <!-- 주소 -->
              <div class="faddress"><span style="font-weight: bold;">기부엔테이크</span>
               <span>서울특별시 강남구 테헤란로 14길 6 남도빌딩 2층</span>
               </div>
              <!-- 대표, 이메일, 문의 -->
              <div class="finfoContainer">
               <div class="ceo">조장 : <a href="${pageContext.request.contextPath}/admin/mLogin">임형주</a></div><div class="emp">조원 : 박상빈 심찬영 이슬기 이유정 정서윤</div>
               <div class="femail">이메일 : gibootake@gmail.com</div>
               <div class="ftel">문의 : 02-123-1234</div>
              </div>
           </div>
   
           <div class="footerContent2">
               <div class="snsLogo">
                   <!-- 카톡 -->
                  <a class="kakaoContainer"><img class="kakaoImg" src="${pageContext.request.contextPath}/resources/images/kakao.jpg"alt="#"></a>
                  <!-- 페북 -->
                  <a class="fbookContainer"><img class="fbookImg" src="${pageContext.request.contextPath}/resources//images/facebook.jpg" alt="#"></a>
                  <!-- 유튭 -->
                  <a class="youtubeContainer"><img class="youtubeImg" src="${pageContext.request.contextPath}/resources//images/youtube.png" alt="#"></a>
               </div>
           </div>
   
       </div>
        </section>
       </footer>
</body>
</html>