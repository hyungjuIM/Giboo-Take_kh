<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>footer</title>
       <!-- jQuery 라이브러리 추가 -->
       <script src="https://code.jquery.com/jquery-3.6.0.min.js"
       integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
       <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/footer.css" />
       
</head>
<body>
    <footer>
        <section class="footerContainer">
           <div class="footerContent">
               <!-- 로고 영역 -->
               <div class="fLogoContainer">
                   <div class="fLogoImg">
                       <img
										src="${pageContext.request.contextPath}/resources/images/doCenter.jpg"
										/>
                   </div>
               </div>
   
               <!-- 공지사항, 개인정보처리방침, 이용약관, about us, 명예의 전당 -->
               <div class="fnoticeContainer">
                   <div class="fnoticeDe">
                       <a href="">
                           <span>about us</span>
                       </a>
                   </div>
                   <div class="fnoticeDe">
                       <a href="">
                           <span>개인정보취급방침</span>
                       </a>
                   </div>
                   <div class="fnoticeDe">
                       <a href="">
                           <span>공지사항</span>
                       </a>
                   </div>
                   <div class="fnoticeDe">
                       <a href="">
                           <span>고객센터</span>
                       </a>
                   </div>
                   <div class="fnoticeDe">
                       <a href="">
                           <span>이용약관</span>
                       </a>
                   </div>
               </div>
   
               <!-- 소셜사이트연동 영역 -->
               <div class="fsocialContainer">
                   <div class="fsocialBox">
                       <a href="">
                           <img
										src="${pageContext.request.contextPath}/resources/images/profile.jpeg"
										/>
                       </a>
                   </div>
                   <div class="fsocialBox">
                       <a href="">
                           <img
										src="${pageContext.request.contextPath}/resources/images/profile.jpeg"
										/>
                       </a>                </div>
                   <div class="fsocialBox">
                       <a href="">
                           <img
										src="${pageContext.request.contextPath}/resources/images/profile.jpeg"
										/>
                       </a>                
                   </div>
               </div>
   
               <!-- 회사정보영역 -->
               <div class="finfoContainer">
                   <div class="finfoDetail">
                       <span>재단 법인 : 기부앤테이크</span>
                       <span>|</span>
                       <span>대표자 : 기부앤테이크</span>
                       <span>|</span>
                       <span>주소 : 서울특별시 강남구 테헤란로14길 6 남도빌딩</span>
                   </div>
                   <div class="finfoDetail">
                       <span>이메일 : gibootake@gmail.com</span>
                   </div>
               </div>
           </div>
        </section>
       </footer>
</body>
</html>