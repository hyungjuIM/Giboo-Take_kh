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
     <section class="section1">
    
        <div class="QnABtn-icon show jittery" data-animate="shake">
             <img src="${pageContext.request.contextPath}/resources/images/main_img/upperBody.png" class="btn-emoji">
         </div>
   
         <div class="QnAxBtn-icon show jittery" data-animate="shake">
            <img src="${pageContext.request.contextPath}/resources/images/heart-regular.svg" class="btn-emoji">
        </div>
    </section>
        

        <section class="section2_TalkBox hidden show">
        <div class="AWrap">
            
                <div class="ABox">
                    <div class="ATitle">
                        <div class="ATitlDe">
                            <span>기부 앤 테이크</span>
                            <div class="ALogo">
                                <img src="${pageContext.request.contextPath}/resources/images/main_img/plane.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                    <div class="AchatWrap">
                        <div class="AchatBox">
                            <ul class="AchatUl">
                                <!-- 상담자 -->
                                <li class="AAichatLi">
                                    <div class="AProfile">
                                        <div class="AProImg">
                                            <img src="${pageContext.request.contextPath}/resources/images/main_img/upperBody.png" alt="">
                                        </div>
                                    </div>
                                    <div class="AchatWrapBox">
                                        <div class="AAiLiBox">
                                            <div class="AAiSpan">
                                                <span>
                                                    안녕하세요🥰
                                                    Giboo&take입니다.
                                                    문의 사항을 아래에서 선택해주세요.
                                                    
                                                </span>
                                            </div>
                                        </div>
                                        <div class="AAiWrap">
                                            <div class="AAiBox">
                                                <div class="AAiBox_1">
                                                	<a href="http://localhost:8081/giboo/volunteer/home" target="_blank">
                                                    	<span>봉사 신청 바로가기😆</span>
                                                    </a>
                                                </div>
                                                <div class="AAiBox_1">
                                                	<a href="http://localhost:8081/giboo/donation/home" target="_blank">
                                                    	<span>기부 신청 바로가기😋</span>
                                                    </a>
                                                </div>
                                                <div class="AAiBox_1">
                                                	<a href="http://localhost:8081/giboo/event/eventList" target="_blank">
                                                    	<span>이벤트❤️</span>
                                                    </a>
                                                </div>
                                                <div class="AAiBox_1">
                                                	
                                                    	<span>대표전화📞</span>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <!-- 나 -->
                                <li class="AMeWrap">
                                    <div class="AMechatWrapBox">
                                        <div class="ALiMeSpan">
                                            <span>
                                                ALiMeBoxALiMeBoxALiMeBoxALiMeBoxALiMeBoxALiMeBoxALiMeBoxALiMeBoxALiMeBoxALiMeBox
                                            </span>
                                        </div>
                                    </div>
                                    <div class="AMeProfile">
                                        <div class="AProImg">
                                            <img src="${pageContext.request.contextPath}/resources/images/ghost-solid.svg" alt="">
                                        </div>
                                    </div>
                                </li>
                                <!-- 상담자 -->
                                <li class="AAichatLi">
                                    <div class="AProfile">
                                        <div class="AProImg">
                                           <img src="${pageContext.request.contextPath}/resources/images/main_img/upperBody.png" alt="">
                                        </div>
                                    </div>
                                    <div class="AchatWrapBox">
                                        <div class="AAiLiBox">
                                            <div class="AAiSpan">
                                                <span>
                                                    문의하신 대표전화는 02-8282-8282 입니다.
                                                    
        
                                                </span>
                                            </div>
                                        </div>
                                        <div class="AAiLiBox">
                                            <div class="AAiSpan">
                                                <span>
                                                    더 문의 사항 있으신가요?
                                                
                                                </span>
                                            </div>
                                        </div>
                                        <div class="AAiWrap">
                                            <div class="AAiBox">
                                                <div class="AAiBox_1">
                                                    <span>예</span>
                                                </div>
                                                <div class="AAiBox_1">
                                                    <span>아니요</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="AInputWrap">
                        <div class="AInputSticky">
                            <div class="AInputBox">
                                <textarea id="AInputArea" placeholder="여기에 문의사항을 적어주세요."></textarea>
                                <button class="AsendBtn">보내기</button>
                            </div>
                        </div>
                    </div>
            
        </div>
    </section>


    
    <script src="${pageContext.request.contextPath}/resources/js/main//qna.js"></script>
</body>
</html>