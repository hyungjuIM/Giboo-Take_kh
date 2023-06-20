<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pagination" value="${map.pagination}" />
<c:set var="myReview" value="${map.myReview}" />


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 리뷰목록</title>



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/myreview.css">
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
			<span>나의 리뷰목록</span>
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
											style="color: #8071FC;"> 리뷰목록</span><span
											style="color: #767676;">를 알려드립니다 😇</span>

										<div class="container2">


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


								<div id="myactive2_notice-list">
									<div class="myactive2_container3">
										<table class="myactive2_notice-table">
											<thead>
												<tr>
													<th scope="col" class="th-num">번호</th>
													
													<th scope="col" class="th-name">참가한 내역</th>
													<th scope="col" class="th-content">리뷰내용</th>
													<th scope="col" class="th-date">일자</th>
												</tr>
											</thead>
											<tbody>

												<c:choose>
													<c:when test="${empty myReview}">

														<tr>
															<th colspan="4">게시글이 존재하지 않습니다.</th>
														</tr>
													</c:when>

													<c:otherwise>

														<c:forEach var="myReview" items="${myReview}">
															<tr>
																<td class="th-num">${myReview.reviewNo}</td>
																<td class="th-name">${myReview.title}</td>  
																<td class="th-content">${myReview.reviewContent}</td>
																<td class="th-date">${myReview.enrollDate}</td>
															</tr>
														</c:forEach>
													</c:otherwise>
												</c:choose>

												<%-- 
											<tr>
													<td>50</td>
													<td><a href="#">치매안심센터-기억력 검진 봉사활동</a></td>
													<td>2023.05.24</td>
													<td>처음으로 봉사활동 해봤는데 너무 뿌듯해요!....</td>
												</tr>
											 --%>


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

</body>

</html>