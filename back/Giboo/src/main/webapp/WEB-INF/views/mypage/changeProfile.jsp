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
<title>회원프로필 이미지</title>



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/changeProfile.css">
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
			<span>프로필 이미지 변경</span>
		</div>

		<div class="mypage-container">
			<div class="mypage_wrapper">

				<header>
					<jsp:include page="/WEB-INF/views/mypage/mypage_side.jsp" />
				</header>



				<div class="myask_content_area memberChange_content_area">
					<section class="mainContainer memberChange_mainContainer">
						<div class="mainContent memberChange_mainContent">
							<section class="notice">


								<div class="memberChange_notice">
									<div class="memberChange_container1">
										<span style="color: #767676;">Giboo&Take서비스의 봉사자(기부자)님의
											<span style="color: #00CA61;"> 회원프로필 이미지 변경 </span>에 대해
											알려드립니다 😇
										</span>
									</div>

							


									<form action="changeProfile" method="POST" name="myPage-form"
										enctype="multipart/form-data"
										onsubmit="return profileValidate()">
										<div class="profileC">
											<div class="profile-image-area">

												<c:if test="${empty loginMember.profileImg}">
													<img src="${contextPath}/resources/images/11 3.png"
														id="profile-image">
												</c:if>

												<c:if test="${!empty loginMember.profileImg}">
													<img src="${contextPath}${loginMember.profileImg}"
														id="profile-image">
												</c:if>

												<span id="delete-image">x</span>

											</div>
										</div>



										<div class="memberChange_bottom">

											<div class="button_bottom">
												<div class="imageS">
													<label for="input-image">이미지 선택</label> <input type="file"
														name="uploadImg" id="input-image" accept="image/*">
												</div>
												<button class="memberChange_b">수정완료</button>
											</div>
										</div>


										<div class="myPage-row">
											<label>가입일</label> <span>${loginMember.enrollDt}</span>
										</div>

										<input type="hidden" name="delete" id="delete" value="0">
									</form>



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
		const contextPath = "${pageContext.request.contextPath}";
	</script>


	<script
		src="${pageContext.request.contextPath}/resources/js/mypage/memberChange.js"></script>


</body>

</html>