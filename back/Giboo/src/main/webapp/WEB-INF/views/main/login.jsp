<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">



<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>hunny</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/login.css">

</head>

<body>
	<header>
		<jsp:include page="/WEB-INF/views/main/header.jsp" />
	</header>


	<main>
		<section class="loginSection">
			<div class="loginContainer_box">

				<div class="loginTitle">
					<span>로그인</span>
				</div>

				<div class="loginContainer">
					<form action="" method="POST" name="login-form"
						onsubmit="return loginCValidate()" id="loginForm">
						<fieldset class="id-pw-area">

							<div class="memberid loginInput_Container">
								<span><i class="fa-regular fa-user"></i></span> <input
									type="text" name="memberId" id="loginId" placeholder="아이디"
									value="${cookie.saveId.value}">
							</div>

							<div class="memberPw loginInput_Container">
								<span><i class="fa-solid fa-fingerprint"></i></span> <input
									type="password" name="memberPw" id="loginPw"
									placeholder="비밀번호(8자 이상)">
							</div>


							<div class="checkContainer">
								<div class="checkboxBox">
									
									<%-- 쿠키에 saveId가 있는 경우--%>
									<c:if test="${ !empty cookie.saveId.value}">
										<%-- chk 변수 생성(page scope)--%>
										<c:set var="chk" value="checked" />
									</c:if>
									<label for="saveId">
									<input type="checkbox" class="cookieBox" name="saveId" ${chk}
										id="saveId" value="saveId"> <span>아이디 저장</span>
										</label>
						
								</div>
								<div class="signUp">
									<a href="${pageContext.request.contextPath}/main/signUp">회원가입
										하기</a>
								</div>
							</div>


							<div>
								<div class="loginBtnnBox">
									<button type="submit" class="loginBtnn">로그인</button>

								</div>
							</div>

						</fieldset>

					</form>

				</div>



				<div class="loginSocial">
					<span>3초만에 시작하기</span> <a href="" class="loginKakaoLink">
						<div class="social_icon_Container">
							<a class="loginKakao icon_Style"
								href="https://kauth.kakao.com/oauth/authorize?client_id=ca354a1ec30c6c06ea4746d8610afdf8&redirect_uri=https://hunny.today/oauth/kakao&response_type=code">
								<img
								src="${pageContext.request.contextPath}/resources/images/kakao_icon.png"
								class="kakaoIcon01" alt=""> <img
								src="${pageContext.request.contextPath}/resources/images/change_kakao.png"
								class="kakaoIcon02" alt="">
							</a>
							<div class="loginGoogle icon_Style" title="서비스를 준비중입니다.">
								<img
									src="${pageContext.request.contextPath}/resources/images/google_icon.png">
							</div>
						</div>

					</a>
				</div>

			</div>

		</section>

	</main>


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
		
		<script
		src="${pageContext.request.contextPath}/resources/js/main/login.js"></script>

</body>

</html>
