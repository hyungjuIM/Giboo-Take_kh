<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<label%-- 문자열 관련 함수(메서드) 제공 JSTL (EL형식으로 작성) --%>
			<label%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


				<!DOCTYPE html>
				<html lang="en">

				<head>
					<meta charset="UTF-8">
					<meta http-equiv="X-UA-Compatible" content="IE=edge">
					<meta name="viewport" content="width=device-width, initial-scale=1.0">
					<title>회원정보수정</title>



					<link rel="stylesheet"
						href="${pageContext.request.contextPath}/resources/css/mypage/memberChange.css">
					<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/reset.css">

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
							<span>회원정보수정</span>
						</div>

						<div class="mypage-container">
							<div class="mypage_wrapper">
								<!-- 1200*800 -->

								<!--왼쪽 네비바 틀-->
								<header>
									<jsp:include page="/WEB-INF/views/mypage/mypage_side.jsp" />
								</header>

								<!--오른쪽 회원정보수정 본문-->

								<section class="memberChange_mainContainer">

									<div class="memberChange_mainContent">

										<!-- notice seach area -->
										<div class="memberChange_notice">
											<div class="memberChange_container1">
												<span style="color: #767676;">Giboo&Take서비스의
													봉사자(기부자)님의</span><span style="color: #8071FC;">
													회원정보수정</span><span style="color: #767676;">에 대해 알려드립니다 😇</span>
											</div>
										</div>

										<form action="info" method="POST" name="myPage-form"
											onsubmit="return infoValidate()">

											<!-- 아이디 -->
											<div class="memberChange_title">
												<span class="memberChange_con1">아이디</span>
												<span class="memberChange_con2">${loginMember.memberId}</span>
											</div>

											<!-- 이름  -->
											<div class="memberChange_title">
												<span class="memberChange_con1">이름</span>
												<span class="memberChange_con2">${loginMember.memberName}</span>
											</div>

											<!-- 이메일 -->
											<div class="memberChange_title">
												<span class="memberChange_con1">이메일</span>
												<span class="memberChange_con2">${loginMember.memberEmail}</span>
											</div>

											<!-- 비밀번호 -->
											<div class="memberChange_title">
												<label>현재 비밀번호</label>
												<input type="password" name="currentPw" id="currentPw" maxlength="30">
											</div>

											<!-- 비밀번호 변경 -->
											<div class="memberChange_title">
												<label>새 비밀번호</label>
												<input type="password" name="newPw" maxlength="30">
											</div>

											<div class="memberChange_title">
												<label>새 비밀번호 확인</label>
												<input type="password" name="newPwConfirm" maxlength="30">
											</div>



											<!-- 닉네임 -->
											<div class="memberChange_title">
												<label>닉네임</label>
												<input type="text" name="updateNickname" id="MemberNick"
													value="${loginMember.memberNick}" maxlength="10">
											</div>

											<!-- 휴대폰 번호 -->
											<div class="memberChange_title">
												<label>휴대폰번호</label>
												<input type="text" name="updateTel" id="MemberTel"
													value="${loginMember.memberTel}" maxlength="11">
											</div>

											<!-- 주소 -->
											<c:set var="addr" value="${loginMember.memberAddr, ',,'}"></c:set>

											<div class="memberChange_title">
												<span>주소</span>
											</div>

											<div class="memberChage_title">
												<input type="text" name="updateAddress" id="postcode" value="${addr[0]}"
													maxlength="6">
												<button type="button" onclick="execDaumPostcode()">검색</button>
											</div>

											<div class="memberChage_title">
												<input type="text" name="updateAddress" id="address" value="${addr[1]}">
											</div>

											<div class="memberChage_title">
												<input type="text" name="updateAddress" id="detailAddress"
													value="${addr[2]}">
											</div>


											<div class="memberChange_bottom">
												<button class="memberChange_b">수정완료</button>
												<button class="memberChange_b">이전으로</button>
												<span class="memberChange_w_c">회원탈퇴를 원하시면 회원탈퇴 버튼을
													눌러주세요</span>
												<button class="memberChange_w">
													<a
														href="${pageContext.request.contextPath}/mypage/withdrawal">회원탈퇴</a>
												</button>
											</div>
										</form>
									</div>
								</section>
							</div>



						</div>



					</main>


					<!-- 푸터 영역 -->
					<footer>
						<jsp:include page="/WEB-INF/views/main/footer.jsp" />
					</footer>

					<script src="${pageContext.request.contextPath}/resources/js/mypage/memberChange.js"></script>

					<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

				

				</body>

				</html>