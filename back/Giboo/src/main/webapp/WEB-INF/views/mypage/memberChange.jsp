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



<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/memberChange.css">
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
				<div class="memberChange_content_area">
					<section class="memberChange_mainContainer">
						<div class="memberChange_mainContent">
							<section class="notice">
								<form action="info" method="POST" name="myPage-form" onsubmit="return infoValidate()">
									<!-- notice seach area -->
									<div class="memberChange_notice">
										<div class="memberChange_container1">
											<span style="color: #767676;">Giboo&Take서비스의
												봉사자(기부자)님의</span><span style="color: #8071FC;"> 회원정보수정</span><span
												style="color: #767676;">에 대해 알려드립니다 😇</span>
										</div>


								
										<div class="memberChange_title">
											<span class="memberChange_con1">아이디</span> <span
												class="memberChange_con2">
												<div>로그인아이디</div>
											</span>
										</div>
										<div class="memberChange_title">
											<span class="memberChange_con1">이름</span> <span
												class="memberChange_con2"> <input type="text"
												name="updateName" id="MemberName"
												placeholder="변경할 이름을 입력해주세요">
											</span>
										</div>
										<div class="memberChange_title">
											<span class="memberChange_con1">이메일주소</span> <span
												class="memberChange_con2"> <input type="text" name=""
												id="" placeholder="변경할 이메일주소를 입력해주세요">
											</span>
										</div>
										<div class="memberChange_title">
											<span class="memberChange_con1">비밀번호변경</span> <span
												class="memberChange_con2"> <input type="text"
												name="updateName" id="MemberName"
												placeholder="변경할 비밀번호를 입력해주세요">
											</span>
										</div>
										<div class="memberChange_title">
											<span class="memberChange_con1"></span> <span
												class="memberChange_con2"> <input type="text"
												name="updateName" id="MemberName"
												placeholder="변경할 비밀번호를 재입력해주세요">
											</span>
										</div>
										<div class="memberChange_title">
											<span class="memberChange_con1">닉네임</span> <span
												class="memberChange_con2"> <input type="text"
												name="updateNickname" id="MemberNick"
												placeholder="변경할 닉네임을 입력해주세요">
											</span>
										</div>
										<div class="memberChange_title">
											<span class="memberChange_con1">휴대폰번호</span> <span
												class="memberChange_con2"> <input type="text"
												name="updateTel" id="MemberTel"
												placeholder="변경할 휴대폰번호를 입력해주세요">
											</span>
										</div>
										<!-- 주소 -->			<!--  fn:split(문자열, '구분자')  -->
										<c:set var="addr"  value="${fn:split(loginMember.memberAddress, ',,')}"  />
										
										<div class="memberChange_title">
											<span class="memberChange_con1">주소</span> <span
												class="memberChange_con3"> <input type="text"
												id="zip-code" placeholder="우편번호" readonly>
											</span> <input type="button" onclick="execDaumPostcode()" value="검색">
										</div>
										<div class="memberChange_title">
											<span class="memberChange_con1"></span> <span
												class="memberChange_con3"> <input type="text"
												id="address-1" placeholder="도로명주소" style="width: 400px"
												readonly>
											</span>
										</div>
										<div class="memberChange_title">
											<span class="memberChange_con1"></span> <span
												class="memberChange_con3"> <input type="text"
												id="address-1-1" placeholder="지번주소" style="width: 400px"
												readonly>
											</span>
										</div>
										<div class="memberChange_title">
											<span class="memberChange_con1"></span> <span
												class="memberChange_con3"> <input type="text"
												id="address-2" placeholder="상세주소" style="width: 400px">
											</span>
										</div>
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
							</section>
						</div>
				</div>
				</section>

			</div>
			</section>

		</div>
		<!-- myask_content_area -->

		</div>
		<!-- mypage_wrapper -->
		</div>
		<!-- mypage-container -->
	</main>


	<!-- 푸터 영역 -->
<footer>
    <jsp:include page="/WEB-INF/views/main/footer.jsp" />
</footer>



	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/js/mypage/memberChange.js"></script>
</body>

</html>