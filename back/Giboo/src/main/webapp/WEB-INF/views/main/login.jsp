<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>로그인</title>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/reset.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/login.css">

		</head>

		<body>
			<header>
				<jsp:include page="/WEB-INF/views/main/header.jsp" />
			</header>

			<main>
				<section class="loginSection">
					<div class="loginTitle">
						<span>로그인</span>
					</div>
					<div class="loginContainer">
						<form action="" method="POST" name="login-form" onsubmit="return loginCValidate()"
							id="loginForm">
							<fieldset class="id-pw-area">
								<section class="memberid">
									<span><i class="fa-regular fa-user"></i></span> <input type="text" name="memberId"
										id="loginId" placeholder="아이디" value="${cookie.saveId.value}">
								</section>

								<section class="memberPw">
									<span><i class="fa-solid fa-fingerprint"></i></span> <input type="password"
										name="memberPw" id="loginPw" placeholder="비밀번호(8자 이상)">
								</section>

								<section>
									<div class="loginBtnnBox">
										<button type="submit" class="loginBtnn">로그인</button>
									</div>
								</section>

							</fieldset>

							<!-- 쿠키  -->

							<div class="checkContainer">
								<div class="checkboxBox">
									<input type="checkbox"> <span>아이디 저장</span>
								</div>
								<div class="signUp">
									<a href="${pageContext.request.contextPath}/main/signUp">회원가입
										하기</a>
								</div>
							</div>



						</form>

					</div>



					<div class="loginSocial">
						<span>3초만에 시작하기</span> <a href="" class="loginKakaoLink">
							<div class="loginKakao">
								<img src="/images/kakao.jpg" alt="">
							</div>
							<div class="loginKakao">
								<span>🥰</span>
							</div>
						</a>
					</div>


				</section>

			</main>
			<footer>
				<jsp:include page="/WEB-INF/views/main/footer.jsp" />
			</footer>

			<script src="https://code.jquery.com/jquery-3.6.0.min.js"
				integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

		</body>

		</html>