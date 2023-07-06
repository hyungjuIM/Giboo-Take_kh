<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


		<!DOCTYPE html>
		<html lang="en">


		


		<head>
			<meta charset="UTF-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>header</title>
			<!-- jQuery 라이브러리 추가(CDN) -->
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"
				integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/reset.css" />

			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/footer.css" />

			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/header.css" />
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/alarm.css" />




			<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">





			<!-- fontawesome -->
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
				integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
				crossorigin="anonymous" referrerpolicy="no-referrer" />

		</head>

		<body>

			<section class="headerContainer">
				<div class="headerContent">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/main">
							<div>여기는 로고자리올시다</div>
						</a>

					</div>

					<div class="gnb">
						<div id="horizontal_underline"></div>
						<a  class="headerACss" href="${pageContext.request.contextPath}/donation/home">기부하기</a>
						<a class="headerACss" href="${pageContext.request.contextPath}/volunteer/home">봉사하기</a>
						<a class="headerACss" href="${pageContext.request.contextPath}/event/eventList">이벤트</a>
						<a class="headerACss" href="${pageContext.request.contextPath}/map/mapList">위치찾기</a>
					</div>
					<div class="user_sec">

						<section class="laginArea">
							<%-- 로그인 하기 전 --%>
								<c:choose>
									<c:when
										test="${empty sessionScope.loginMember && empty sessionScope.loginManager && empty sessionScope.loginMember2}">
										<a href="${pageContext.request.contextPath}/main/login" class="loginBtn">로그인</a>
									</c:when>
									<%-- 관리자로그인 시 --%>
										<c:when test="${!empty sessionScope.loginManager}">
											<!-- 관리자로 로그인한 경우에 대한 내용을 추가 -->
											<div class="nick_container manager">
												<span id="nickName">${loginManager.managerNickname}</span> 관리자님
												<a href="${contextPath}/admin/managerlogout"
															class="logout_Btn"><span>로그아웃</span></a>
												<a class="logout_Btn" href="${pageContext.request.contextPath}/admin/home"><span>관리자페이지</span></a>			
											</div>
										</c:when>
										<%-- 로그인 된 후 --%>
											<c:otherwise>

												<div class="loginContainer_box">
													<div class="nick_container">

														<span id="nickName">${loginMember.memberNick}</span>님

													</div>

													<div class="toggle">
														<a href="${pageContext.request.contextPath}/mypage/memberChange"
															data-text="마이페이지">
															<div class="iBox">
																<i class="far fa-user-circle gray_Style"></i>
																<i class="far fa-user-circle green_Style"></i>
																<!-- <div class="tooltip">마이페이지</div> -->
															</div>

														</a>
													</div>

													<div class="toggle">

														<a href="#none" data-text="알림" class="tooltip" id="alarm">
															<div class="iBox">
																<i class="far fa-bell gray_Style"></i>
																<!-- <i class="far fa-bell green_Style"></i> -->

															</div>


														</a>
													</div>




													<a href="${contextPath}/main/logout"
														class="logout_Btn"><span>로그아웃</span></a>

												</div>







											</c:otherwise>
								</c:choose>
						</section>




					</div>
				</div>


			</section>

			<jsp:include page="/WEB-INF/views/main/alarm.jsp" />


			<script src="${pageContext.request.contextPath}/resources/js/main/header.js"></script>

			<c:if test="${ !empty message }">
				<script>
					alert("${message}");
				</script>
			</c:if>

		</body>

		</html>