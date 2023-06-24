<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    
    	<!-- jQuery 라이브러리 추가 -->
         <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	 	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
    	<script src="${pageContext.request.contextPath}/resource/js/csMain.js"></script>
	
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
                    <div class="cs-inquryBtn">
                        
                        <a href=""><span>봉사</span></a> 
                        <a href=""><span>기부</span></a> 
                        <a href=""><span>이벤트</span></a> 
                        <a href=""><span>지도</span></a>
                        <a href=""><span>적립금</span></a>
                        <a href=""><span>스탬프</span></a>

                    </div>

                    <div class="cs-inquryBtn" id="Btn2">
                        <a href=""><span>환불문의</span></a>
                        <a href=""><span>신청문의</span></a>
                        <a href=""><span>취소문의</span></a>
                    </div>
                </div>
            </div>



            <div class="cs-faqArea">
                <section class="cs-faqContainer">
                    <div class="faqContent">
                        <div class="faqNotice">
                            <span style="color: #767676;">Giboo&Take서비스의 봉사자(기부자)님의 &nbsp;</span><span style="color: #8071FC; font-weight: bold; font-size: 20px;">
                                 자주 찾으시는 목록 Best 10</span><span style="color: #767676;">을 알려드립니다 😇</span>
                        </div>

                        <hr>


                        <div id="Accordion_wrap">
                            
                            <div class="que">
                                <div class="queCategory">
                                    <span>봉사</span>
                                </div>
                                <span>봉사 신청을 하려면 어떻게 해야 하나요??</span>
                                
                                

                                <div class="arrow-wrap">
                                    <span class="arrow-top">&#x3e;</span>
                                    <span class="arrow-bottom">&#x3e;</span>
                                </div>
                            </div>
                            <div class="anw">
                                <div class="anw2">

                                    <span id="anw-content">테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트
                    
                                    </span>
                                    <div class="dontAnw">
                                        <span id="dontAnw-span">* 원하시는 답을 찾지 못하셨나요?</span>
                                        <a href=""><span id="dontAnw-span2">1:1 문의</span></a>
                                    </div>
                                </div>
                            </div>
                             <div class="que">
                                    <div class="queCategory">
                                        <span>기부</span>
                                    </div>

                                    <span>기부 신청을 하기 위해서 어떻게 해야 하나요?.</span>
                                    <div class="arrow-wrap">
                                        <span class="arrow-top">&#x3e;</span>
                                        <span class="arrow-bottom">&#x3e;</span>
                                    </div>
                             </div>

                            
                                <div class="anw">
                                    <div class="anw2">

                                        <span id="anw-content">테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트
                        
                                        </span>
                                        <div class="dontAnw">
                                            <span id="dontAnw-span">* 원하시는 답을 찾지 못하셨나요?</span>
                                            <a href=""><span id="dontAnw-span2">1:1 문의</span></a>
                                        </div>
                                    </div>
                                    
                                </div>
                               
                            


                                 <div class="que">
                                            <div class="queCategory">
                                                <span>도장</span>
                                            </div>

                                        <span>스탬프는 어떻게 모으나요??</span>
                                        <div class="arrow-wrap">
                                            <span class="arrow-top">&#x3e;</span>
                                            <span class="arrow-bottom">&#x3e;</span>
                                        </div>
                                 </div>
                            <div class="anw">
                                <div class="anw2">

                                    <span id="anw-content">테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트테스트 테스트 엄청난 테스트
                                    테스트
                    
                                    </span>
                                    <div class="dontAnw">
                                        <span id="dontAnw-span">* 원하시는 답을 찾지 못하셨나요?</span>
                                        <a href=""><span id="dontAnw-span2">1:1 문의</span></a>
                                    </div>
                                </div>
                            </div>

                                <div class="que">
                                    <div class="queCategory">
                                        <span>문의</span>
                                    </div>

                                    <span>1:1 문의는 어떻게 하나요??</span>
                                    <div class="arrow-wrap">
                                        <span class="arrow-top">&#x3e;</span>
                                        <span class="arrow-bottom">&#x3e;</span>
                                    </div>
                               </div>
                               <div class="anw">
                                    <div class="anw2">

                                        <span id="anw-content">테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트
                        
                                        </span>
                                        <div class="dontAnw">
                                            <span id="dontAnw-span">* 원하시는 답을 찾지 못하셨나요?</span>
                                            <a href=""><span id="dontAnw-span2">1:1 문의</span></a>
                                        </div>
                                    </div>
                               </div>

                            <div class="que">
                                <div class="queCategory">
                                    <span>기부</span>
                                </div>

                                <span>기부를 취소할 수 있나요??</span>
                                <div class="arrow-wrap">
                                   <span class="arrow-top">&#x3e;</span>
                                   <span class="arrow-bottom">&#x3e;</span>
                                 </div>
                            </div>
                               <div class="anw">
                                    <div class="anw2">

                                        <span id="anw-content">테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트테스트 테스트 엄청난 테스트
                                        테스트
                        
                                        </span>
                                        <div class="dontAnw">
                                            <span id="dontAnw-span">* 원하시는 답을 찾지 못하셨나요?</span>
                                            <a href=""><span id="dontAnw-span2">1:1 문의</span></a>
                                        </div>
                                    </div>
                               </div>
                       </div>

                       <div class="container4">
                            <nav class="page-nav">
                                <ul class="pagination">
                                    <li><a href="">&lt;</a></li>
                                    <li><a href="">1</a></li>
                                    <li><a href="">2</a></li>
                                    <li><a href="">3</a></li>
                                    <li><a href="">4</a></li>
                                    <li><a href="">5</a></li>
                                    <li><a href="">6</a></li>
                                    <li><a href="">7</a></li>
                                    <!-- 페이지 번호 추가 -->
                                    <li><a href="">&gt;</a></li>
                                </ul>
                            </nav>
            
                        </div>
                    </div>
                    
                </section>
                
            </div>




            
        </div>

        














           
            <script>
                $(function () {
                    var include1 = $('[data-include1="header"]');
                    jQuery.each(include1, function () {
                        $(this).load('/html/01.header.html');
                    });
                });

            </script>
        <script src="https://code.jquery.com/jquery-latest.min.js"></script>
        <script> $(".que").click(function() {
                $(this).next(".anw").stop().slideToggle(300);
            $(this).toggleClass('on').siblings().removeClass('on');
            $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
            });
        </script>
        
        <!-- 푸터 영역 -->
<footer>
  <jsp:include page="/WEB-INF/views/main/footer.jsp" />
</footer>
        
    </body>
</html>