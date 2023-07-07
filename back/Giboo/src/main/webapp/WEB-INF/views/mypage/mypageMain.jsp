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




<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/mypageMain.css">
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
			<span>마이페이지</span>
		</div>

		<div class="mypage-container">
			<div class="mypage_wrapper">
				<!-- 1200*800 -->


				<!--왼쪽 네비바 틀-->
				<header>
					<jsp:include page="/WEB-INF/views/mypage/mypage_side.jsp" />
				</header>


				<!--오른쪽 나의 문의내역 본문-->
				<div class="mypage_content_area">

					<div class="mypage_container">
						<div class="mypage_title1">나의 등급</div>
						<section class="mypage_mainContainer1">
							<div class="mypage_mainContent">
								<section class="mypage_up">
									<div class="mypage_up1">우리동네 지킴이</div>
									<div class="mypage_up2">
										<div class="mypage_up2_1">회원님의 등급혜택 :</div>
										<div class="mypage_up2_2">봉사 or 기부(1만원당 1회로 환산) 5회 진행 시</div>
										<div class="mypage_up2_3">스탬프 1개 무료증정 + 등급업</div>
										<div class="mypage_up2_4">
											<img
												src="${pageContext.request.contextPath}/resources/images/11 3.png"
												alt="#"">
										</div>

									</div>
									<hr>
									<div class="mypage_up3">

										<div class="mypage_up3_1">우리동네지킴이 LV.1</div>
										<div class="mypage_up3_2">
											<div class="mypage_up3_2_1">60%</div>
											<div class="mypage_up3_2_2">
												<div></div>
											</div>

										</div>
										<div class="mypage_up3_1">우리동네지킴이 LV.2</div>
									</div>
									<div class="mypage_up4">
										<div class="mypage_up4_1">🍀 봉사 1회, 기부 1회</div>
										<div class="mypage_up4_2">
											다음 등급까지 <span style="color: #5b53f5; font-weight: 600;">봉사
												or 기부 3회</span>가 남았습니다.
										</div>
										<div class="mypage_up4_3">봉사 3회, 기부 2회 ~</div>
									</div>
									<div>기부금액 10000원당 기부 1회로 산정하여 등급혜택 진행합니다.<br>
									(기부금액이  10000이상 20000미만 1, <br> 
									 기부금액이  20000이상 30000미만 2,<br>
									 기부금액이  30000이상 40000미만 3,<br>
									 기부금액이  40000이상 50000미만 4  <br>
									 기부금액이  50000이상  5)</div>
								</section>

							</div>
						</section>
						<div class="mypage_title1">나의 적립금</div>
						<section class="mypage_mainContainer2">
							<div class="mypage_mainContent">
								<section class="mypage_down">
									<div class="mypage_down1">
										<div class="mypage_down1_1">나의적립금</div>
										<div class="mypage_down1_2">P</div>
										<div class="mypage_down1_3">10,000</div>
									</div>
									<div class="mypage_down2">
										<div class="mypage_down2_1">사용내역</div>
										<div class="mypage_down2_2">
											<button>적립</button>
											<button>사용</button>
										</div>

									</div>

									<div id="myask_notice-list">
										<div class="mypage_container3">
											<table class="myask_notice-table">
												<thead>
													<tr>
														<th scope="col" class="th-date">적용일시</th>
														<th scope="col" class="th-pay">금액</th>
														<th scope="col" class="th-title">적립 내용</th>

													</tr>
												</thead>
												<tbody>
													<tr>
														<td>23.05.23</td>
														<td><span style="color: #5D55FA;">+5,000원</span></td>
														<td class="mypage_container_ba"><span
															class="mypage_container_ba_1">이벤트</span> <span
															class="mypage_container_ba_2">5월 기부자님을 위한 깜짝 적립금</span></td>
													</tr>
													<br>
													<br>
													<tr>
														<td>23.05.23</td>
														<td><span style="color: #5D55FA;">+5,000원</span></td>
														<td class="mypage_container_ba"><span
															class="mypage_container_ba_1">이벤트</span> <span
															class="mypage_container_ba_2">5월 기부자님을 위한 깜짝 적립금</span></td>
													</tr>
													<br>
													<br>
													<tr>
														<td>23.05.23</td>
														<td><span style="color: #5D55FA;">+5,000원</span></td>
														<td class="mypage_container_ba"><span
															class="mypage_container_ba_1">이벤트</span> <span
															class="mypage_container_ba_2">5월 기부자님을 위한 깜짝 적립금</span></td>
													</tr>


													<!-- 여러 개의 게시글 추가 -->

												</tbody>
											</table>
										</div>


									</div>



									<div class="mypage_bottom">
										- 적립금은 구매 확정 시 지급됩니다. (별도의 구매 확정이 없더라도 상품 발송 후 9일이 지난 경우에는 자동
										구매 확정 됩니다.)<br> - 구매 후기 작성 시 적립금 지급됩니다.<br> -
										Giboo&take 적립금은 상품 금액의 7%까지만 사용 가능합니다.<br> - 포인트 전환을 통해
										적립금을 획득하실 수 있습니다.
									</div>
								</section>

							</div>

						</section>
					</div>

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

</body>

</html>