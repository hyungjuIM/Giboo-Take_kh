<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 활동목록(참여한 이벤트)</title>




<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/myactive_3.css">
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
			<span>나의 활동목록</span>
		</div>

		<div class="mypage-container">
			<div class="mypage_wrapper">
				<!-- 1200*800 -->

				<!--왼쪽 네비바 틀-->
				<header>
					<jsp:include page="/WEB-INF/views/mypage/mypage_side.jsp" />
				</header>

				<!--오른쪽 나의 문의내역 본문-->
				<div class="myask_content_area">
					<section class="mainContainer">
						<div class="mainContent">
							<section class="notice">

								<!-- notice seach area -->
								<div class="notice1">
									<div class="container1">
										<span style="color: #767676;">Giboo&Take서비스의 봉사자(기부자)님의</span><span
											style="color: #8071FC;"> 활동목록</span><span
											style="color: #767676;">를 알려드립니다 😇</span>

										<div class="container2">
											<div class="container2_title">
												<div class="active_title_name">
													<div class="myactive_donation">
														<a
															href="${pageContext.request.contextPath}/mypage/myactive_1">기부</a>
													</div>
												</div>
												<div class="active_title_right">|</div>
												<div class="active_title_name">
													<div class="myactive_volunteer">
														<a
															href="${pageContext.request.contextPath}/mypage/myactive_2">봉사</a>
													</div>
												</div>
												<div class="active_title_right">|</div>
												<div class="active_title_name2">
													<div class="myactive_event">
														<a
															href="${pageContext.request.contextPath}/mypage/myactive_3">참여한
															이벤트</a>
													</div>
												</div>
											</div>

											<div class="search-area">
												<div class="search-filter">

													<select id="filter" name="filter">
														<option value="title">제목</option>
														<option value="author">작성자</option>
														<option value="views">조회수</option>
														<option value="date">등록일</option>
													</select>
												</div>

												<form action="">
													<fieldset>
														<input type="text" id="query" name="query"
															placeholder="검색어를 입력해주세요" onfocus="this.placeholder = ''"
															onblur="this.placeholder = '검색어를 입력해주세요'">
														<button type="submit" id="search-btn"
															class="fa-solid fa-magnifying-glass"></button>
													</fieldset>
												</form>
											</div>

										</div>



									</div>
								</div>

								<!-- notice list area -->
								<div id="myactive_notice-list">
									<div class="myactive_container3">
										<table class="myactive_notice-table">
											<thead>
												<tr>
													<th scope="col" class="th_num">번호</th>
													<th scope="col" class="th_name">참여한 이벤트 내역</th>
													<th scope="col" class="th-date">참여일자</th>

												</tr>
											</thead>
											<tbody>
												<tr>
													<td>50</td>
													<td><a href="#">참여한 이벤트 내역 참여한 이벤트 내역</a></td>
													<td>2023.05.23</td>

												</tr>
												<tr>
													<td>49</td>
													<td><a href="#">참여한 이벤트 내역 참여한 이벤트 내역</a></td>
													<td>2023.05.23</td>
												</tr>
												<tr>
													<td>48</td>
													<td><a href="#">참여한 이벤트 내역 참여한 이벤트 내역</a></td>
													<td>2023.05.23</td>
												</tr>
												<tr>
													<td>47</td>
													<td><a href="#">참여한 이벤트 내역 참여한 이벤트 내역</a></td>
													<td>2023.05.23</td>
												</tr>
												<tr>
													<td>46</td>
													<td><a href="#">참여한 이벤트 내역 참여한 이벤트 내역</a></td>
													<td>2023.05.23</td>
												</tr>
												<tr>
													<td>45</td>
													<td><a href="#">참여한 이벤트 내역 참여한 이벤트 내역</a></td>
													<td>2023.05.23</td>
												</tr>



												<!-- 여러 개의 게시글 추가 -->

											</tbody>
										</table>
									</div>
									<div class="container4">
										<nav class="page-nav">
											<ul class="pagination">
												<li><a href="">&lt;</a></li>
												<li><a href="">1</a></li>
												<li><a href="">2</a></li>
												<li><a href="">3</a></li>
												<li><a href="">4</a></li>
												<li><a href="">5</a></li>
												<li><a href="">6</a></li>
												<li><a href="">7</a></li>
												<!-- 페이지 번호 추가 -->
												<li><a href="">&gt;</a></li>
											</ul>
										</nav>

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


</body>

</html>