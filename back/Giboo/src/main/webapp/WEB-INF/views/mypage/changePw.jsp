<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 문자열 관련 함수(메서드) 제공 JSTL (EL형식으로 작성) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보수정</title>



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/changePw.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/reset.css">

<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
	<!-- 헤더 영역 -->
	<header>
		<jsp:include page="/WEB-INF/views/main/header.jsp" />
	</header>

	<main>
		<div class="page-title">
			<span>비밀번호변경</span>
		</div>

		<div class="mypage-container">
			<div class="mypage_wrapper">

				<header>
					<jsp:include page="/WEB-INF/views/mypage/mypage_side.jsp" />
				</header>



				<div class="myask_content_area">
					<section class="mainContainer">
						<div class="mainContent">
							<section class="notice">

								<div class="notice1">
									<div class="container1">
										<span style="color: #767676;">Giboo&Take서비스의 봉사자(기부자)님의</span><span
											style="color: #8071FC;"> 비밀번호변경</span><span
											style="color: #767676;">을 알려드립니다 😇</span>

										<div class="changePw_C">
											<form action="changePw" method="POST" name="myPage-form"
												onsubmit="return changePwValidate()">


												<%-- 
							<div class="memberChange_title">
								<label>새 비밀번호</label> <input type="password" name="newPw"
									maxlength="30">
							</div>  
							
							<div class="memberChange_title">
								<label>새 비밀번호 확인</label> <input type="password"
									name="newPwConfirm" maxlength="30">
							</div>
							
							--%>


												<div class="memberChange_title">
													<span class="memberChange_con1">새 비밀번호</span> <span
														class="memberChange_con2"> <span><i
															class="fa-solid fa-fingerprint"></i></span> <input
														type="password" name="newPw" maxlength="30"></span>
												</div>




												<div class="memberChange_title">
													<span class="memberChange_con1">새 비밀번호 확인</span> <span
														class="memberChange_con2"> <span><i
															class="fa-solid fa-fingerprint"></i></span> <input
														type="password" name="newPwConfirm" maxlength="30"></span>
												</div>

												<div class="memberChange_bottom">
													<button class="memberChange_b">수정완료</button>



												</div>

											</form>
										</div>
									</div>
								</div>
							</section>
						</div>
					</section>
				</div>


			</div>
		</div>



	</main>


	<!-- 푸터 영역 -->
	<footer>
		<jsp:include page="/WEB-INF/views/main/footer.jsp" />
	</footer>

<script>
		const contextPath = "${contextPath}"; // 최상위 경로를 JS 전역변수로 선언
	</script>

	<script
		src="${pageContext.request.contextPath}/resources/js/mypage/memberChange.js"></script>




</body>

</html>