<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pagination" value="${map.pagination}" />
<c:set var="myActiveVolunteerList" value="${map.myActiveVolunteerList}" />


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 활동목록(봉사)</title>



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/myactive_2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/reset.css">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
	<header>
		<jsp:include page="/WEB-INF/views/main/header.jsp" />
	</header>

	<main>
		<div class="page-title">
			<span>나의 활동목록</span>
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
											style="color: #8071FC;"> 활동목록</span><span
											style="color: #767676;">를 알려드립니다 😇</span>

										<div class="container2">
											<div class="container2_title">
												<div class="active_title_name">
													<div class="myactive_donation">
														<a
															href="${pageContext.request.contextPath}/mypage/myActiveDonationList">기부</a>
													</div>
												</div>
												<div class="active_title_right">|</div>
												<div class="active_title_name">
													<div class="myactive_volunteer">
														<a
															href="${pageContext.request.contextPath}/mypage/myActiveVolunteerList">봉사</a>
													</div>
												</div>
												<div class="active_title_right">|</div>
												<div class="active_title_name2">
													<div class="myactive_event">
														<a
															href="${pageContext.request.contextPath}/mypage/myActiveEventList">참여한
															이벤트</a>
													</div>
												</div>
											</div>


										</div>
										<div class="active_contatiner">
										<%--  container2 --%>

										<%-- 검색을 진행한 경우 key, query를 쿼리스트링 형태로 저장한 변수 생성 --%>
										<c:if test="${!empty param.key}">
											<c:set var="sURL"
												value="&key=${param.key}&query=${param.query}" />
										</c:if>

										<c:if test="${!empty param.key}">
											<h3 style="margin-left: 30px;">"${param.query}" 검색 결과</h3>
										</c:if>


										<form method="get" id="boardSearch"
											onsubmit="return searchValidate()">


											<select id="search-key" name="key">
												<option value="t">제목</option>
												<option value="c">일자</option>
												<option value="p">장소</option>

											</select>


											
												<input type="text" id="search-query" name="query"
													placeholder="검색어를 입력해주세요" onfocus="this.placeholder = ''"
													onblur="this.placeholder = '검색어를 입력해주세요'">
												<button type="submit" id="search-btn"
													class="fa-solid fa-magnifying-glass"></button>
												<button>검색</button>
											
											<%--     search-area --%>
										</form>
										</div>
									</div>
								</div>


								<div id="myactive_notice-list">
									<div class="myactive_container3">
										<table class="myactive_notice-table">
											<thead>
												<tr>
													<th scope="col" class="th-num">번호</th>
													<th scope="col" class="th-name">봉사활동 내역</th>
													<th scope="col" class="th-time">봉사일자</th>
													<th scope="col" class="th-place">장소</th>


												</tr>
											</thead>
											<tbody>

												<c:choose>
													<c:when test="${empty myActiveVolunteerList}">

														<tr>
															<th colspan="4">게시글이 존재하지 않습니다.</th>
														</tr>
													</c:when>

													<c:otherwise>
														<c:forEach var="myActiveVolunteerList"
															items="${myActiveVolunteerList}">
															<tr>
																<td>${myActiveVolunteerList.myactiveVolunteerNo}</td>
																<td><a
																	href="../volunteer/detail/${myActiveVolunteerList.volunteerNo}?cp=${pagination.currentPage}${sURL}">${myActiveVolunteerList.volunteerTitle}</a></td>

																<td>${myActiveVolunteerList.myactiveDate}</td>
																<td>${myActiveVolunteerList.volunteerAddr}</td>
															</tr>
														</c:forEach>



													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
									</div>

									<div class="container4">
										<c:set var="url" value="?cp=" />
										<ul class="pagination">
											<li><a href="${url}1${sURL}">&lt;&lt;</a></li>
											<li><a href="${url}${pagination.prevPage}${sURL}">&lt;</a></li>
											<c:forEach var="i" begin="${pagination.startPage}"
												end="${pagination.endPage}" step="1">

												<c:choose>
													<c:when test="${i == pagination.currentPage}">
														<li><a class="current">${i}</a></li>
													</c:when>

													<c:otherwise>
														<li><a href="${url}${i}${sURL}">${i}</a></li>
													</c:otherwise>
												</c:choose>

											</c:forEach>


											<li><a href="${url}${pagination.nextPage}${sURL}">&gt;</a></li>


											<li><a href="${url}${pagination.maxPage}${sURL}">&gt;&gt;</a></li>

										</ul>
									</div>

								</div>

							</section>
						</div>
					</section>

				</div>
				<%-- myask_content_area --%>

			</div>
			<%-- mypage_wrapper --%>
		</div>
		<%-- mypage-container --%>
	</main>


	<!-- 푸터 영역 -->
	<footer>
		<jsp:include page="/WEB-INF/views/main/footer.jsp" />
	</footer>

<script src="${pageContext.request.contextPath}/resources/js/mypage/mypageBoard.js"></script>



</body>

</html>