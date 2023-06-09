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

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypage_side.css" />
  <link rel="stylesheet"href="${pageContext.request.contextPath}/resources/css/main/reset.css">

  <!-- fontawesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
    integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />


</head>


<body>
    <!-- <header>
      <div data-include1="header" id="header"></div>
    </header> -->
  
    <main>
      <!-- <div class="page-title">
        <span>나의 문의내역</span>
      </div> -->
  
     
          
          
           <!--왼쪽 네비바 틀-->
				<nav class="mypage_nav_area">
					<div class="mypage_summary_container">

						<div class="mypage_profileEmojiContainer">
							<div class="mypage_profileEmojiTheme ">
							
					
								
								<%--회원프로필 이미지 --%>
								<a href="${pageContext.request.contextPath}/mypage/changeProfile">
                                
                                <c:if test="${empty loginMember.profileImg}">
                                    <img src="${contextPath}/resources/images/11 3.png" id="member-profile">
                                </c:if>

                                <c:if test="${!empty loginMember.profileImg}">
                                    <img src="${contextPath}${loginMember.profileImg}" id="member-profile">
                                </c:if>
		
            					</a>
					
							</div>
						</div>
						
						
						<!-- 사용자 정보 -->
						 <div class="side_user_container">
                            <div class="userName">
                                <p>${loginMember.memberNick}님,</p>
                                <p> 안녕하세요🥳</p>
                            </div>

                            <div class="rateName">
                                <span>${loginMember.rateName}</span>
                                <span>${loginMember.pointPrice} 원</span>
                            </div>
                        </div>


						<!--왼쪽 네비바 메뉴 -->
						<nav class="mypage_content_container">
							<ul class="mypage_content_first">
                                <li><a href="${pageContext.request.contextPath}/mypage/memberChange">회원정보수정</a></li>

                                <li class="mypage_content_first_s">
                                    <a href="${pageContext.request.contextPath}/mypage/changePw">- 비밀번호 변경</a>
                                </li>
                                 <li class="mypage_content_first_s">
                                    <a href="${pageContext.request.contextPath}/mypage/changeProfile">- 프로필 이미지 변경</a>
                                </li>

                                <li class="li_enter"><a href="${pageContext.request.contextPath}/mypage/favorites">즐겨찾기</a></li>
                            </ul>
                            
							<hr>
							
							<div class="mypage_content_second">
								<ul>
									<li><a
										href="${pageContext.request.contextPath}/mypage/myActiveDonationList">나의
											활동</a></li>
									<%--   <li><a
										href="${pageContext.request.contextPath}/mypage/myask">나의
											문의</a></li>  --%>
									
									
									<li><a
										href="${pageContext.request.contextPath}/mypage/myReview">나의
											리뷰</a></li>

                                    <li>
                                        <a href="${pageContext.request.contextPath}/mypage/myStamp">나의 스탬프</a>
                                    </li>

                                    <!-- <li>
                                        <a href="${pageContext.request.contextPath}/mypage/myPoint">나의 적립금</a>
                                    </li> -->
								</ul>
							</div>
							<hr>
							<div class="mypage_content_third">
								<ul>
									<li><a href="${contextPath}/main/logout">로그아웃</a></li>
								</ul>
								
							</div>
						</nav>
						<!--mypage_content_container-->
					</div>
					<!-- mypage_summary_container-->
				</nav>
				<!--mypage_nav_area-->

       
  </main>

  
</body>

</html>