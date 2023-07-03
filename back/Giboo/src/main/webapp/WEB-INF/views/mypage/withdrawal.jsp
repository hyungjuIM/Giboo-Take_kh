<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원탈퇴</title>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/withdrawal.css">
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
			<span>회원탈퇴</span>
		</div>

		<div class="mypage-container">
			<div class="mypage_wrapper">
				<!-- 1200*800 -->

				<!--왼쪽 네비바 틀-->
				<header>
					<jsp:include page="/WEB-INF/views/mypage/mypage_side.jsp" />
				</header>

				<!--오른쪽 회원탈퇴 본문-->
				<div class="myask_content_area memberChange_content_area">
					<section class="mainContainer memberChange_mainContainer">
						<div class="mainContent memberChange_mainContent">
							<section class="notice">

								<div class="memberChange_notice">
									<div class="memberChange_container1">
										<span style="color: #767676;">Giboo&Take서비스의 봉사자(기부자)님의
											<span style="color: #00CA61;"> 회원탈퇴 </span>에 대해 알려드립니다 😇
										</span>
									</div>



									<form action="withdrawal" method="POST" name="myPage-form"
										onsubmit="return secessionValidate()">


										<div class="withdrawal_container">
											<div class="withdrawal_title1">회원탈퇴</div>
											<div class="withdrawal_content1">
												Giboo&take 를 아끼고 사랑해주신신 시간에 감사드립니다.<br> 기부자(봉사자)님이 느끼셨을
												점을 저희에게 공유해주시면 <br> 더욱 건강한 서비스를 제공할 수 있는 Giboo&take 가
												되도록 노력하겠습니다.<br>
											</div>



											<div class="withdrawal_hr">
												<hr>
											</div>
											<div class="withdrawal_title2">회원탈퇴를 원하시는 이유를 모두 골라주세요</div>
											<div class="withdrawal_content2">
												<fieldset>
													<label for="reason1"> <input type="checkbox"
														id="reason1" name="withdrawal_reason" value="reason1">
														사이트 방문을 잘 하지 않아요
													</label><br> <label for="reason2"> <input
														type="checkbox" id="reason2" name="withdrawal_reason"
														value="reason2"> 사이트 오류가 생겨서 쓸 수가 없어요
													</label><br> <label for="reason3"> <input
														type="checkbox" id="reason3" name="withdrawal_reason"
														value="reason3"> 개인정보 보안이 걱정돼요
													</label><br> <label for="reason4"> <input
														type="checkbox" id="reason4" name="withdrawal_reason"
														value="reason4"> 사이트 사용법이 어려워요
													</label><br> <label for="reason5"> <input
														type="checkbox" id="reason5" name="withdrawal_reason"
														value="reason5"> 다른 사이트가 더 좋아요
													</label><br> <label for="reason6"> <input
														type="checkbox" id="reason6" name="withdrawal_reason"
														value="reason6"> 사이트 내용이 불만이에요
													</label><br> <label for="reason7"> <input
														type="checkbox" id="reason7" name="withdrawal_reason"
														value="reason7"> 기타
													</label>
												</fieldset>
											</div>
											<div class="withdrawal_title3_container">
												<div class="withdrawal_title3">
													<span style="color: #000000;">회원탈퇴 전 아래</span> <span
														style="color: #00CA61;">안내사항</span> <span
														style="color: #000000;">을 꼭 확인해주세요</span>
												</div>
												<div class="withdrawal_content3">
													회원탈퇴 후 재가입시에는 신규가입으로 처리되며, 탈퇴 시 적립된 포인트는 소멸됩니다.<br> <span
														style="color: #00CA61">탈퇴시점 후로부터 30일 이내 재가입이 불가합니다.</span>
												</div>
												<div class="memberChange_bottom">
													<button class="memberChange_b">
														<a href="${pageContext.request.contextPath}/mypage/memberChange"  class="memberChange_b1" id="back">이전으로</a>
													</button>
													<button class="memberChange_b">
														<a class="memberChange_b1" id="withdrawal"
															onclick="showWithdrawalPopup()">회원탈퇴</a>
													</button>



												</div>
											</div>
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


	<script
		src="${pageContext.request.contextPath}/resources/js/mypage/memberChange.js"></script>
</body>

</html>