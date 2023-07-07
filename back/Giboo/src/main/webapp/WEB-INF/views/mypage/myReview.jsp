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
<title>hunny</title>



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

				<div class="myask_content_area  menu_box_container">
					<section class="mainContainer main">
						<div class="mainContent">
							<section class="notice">

								<!-- notice seach area -->
								<!--  container1 -->
								<div class="notice1">
									<div class="container1">

										<span style="color: #767676;">Giboo&Take서비스의 봉사자(기부자)님의
											<span style="color: #00CA61;"> 내가 작성한 리뷰 </span>을(를) 알려드립니다
											😇
										</span>

										<!--  container2 -->
										<div class="container2">



											<!-- active container  -->
											<div class="active_contatiner">
												<%--  container2 --%>

												<%-- 검색을 진행한 경우 key, query를 쿼리스트링 형태로 저장한 변수 생성 --%>
												<c:if test="${!empty param.key}">
													<c:set var="sURL"
														value="&key=${param.key}&query=${param.query}" />
												</c:if>

												<c:if test="${!empty param.key}">

													<div class="query_result">
														"<span>${param.query}</span>" 검색 결과
													</div>
												</c:if>

												<div class="search_area">
													<form method="get" id="boardSearch"
														onsubmit="return searchValidate()">

														<div class="search-filter">
															<select id="search-key" name="key">
																<option value="t">제목</option>
																<option value="c">내용</option>
																<option value="d">일자</option>
															</select>
														</div>


														<span class="search_field"> <input type="text"
															id="search-query" name="query" placeholder="검색어를 입력해주세요"
															onfocus="this.placeholder = ''"
															onblur="this.placeholder = '검색어를 입력해주세요'">
															<button type="submit" id="search-btn"
																class="fa-solid fa-magnifying-glass"></button>

														</span>



													</form>
												</div>

											</div>
										</div>
									</div>

								</div>
							</section>
						</div>

						<div id="myactive_notice-list"
							class="notice_box_container_content">
							<div class="myactive_container3 notice_index_container">
								<table class="myactive_notice-table notice_table">

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
				

			</div>
			

		</div>
		
	</main>

	<!-- 푸터 영역 -->
	<footer>
		<jsp:include page="/WEB-INF/views/main/footer.jsp" />
	</footer>

</body>

</html>