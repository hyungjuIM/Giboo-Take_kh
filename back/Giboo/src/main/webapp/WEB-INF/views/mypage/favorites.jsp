<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<c:set var="pagination" value="${map.pagination}" />
    <c:set var="favoriteList" value="${map.favoriteList}" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>hunny</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/favorites.css">
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
			<span>즐겨찾기</span>
		</div>

		<div class="mypage-container">
			<div class="mypage_wrapper">
				<!-- 1200*800 -->

				<!--왼쪽 네비바 틀-->
				<header>
					<jsp:include page="/WEB-INF/views/mypage/mypage_side.jsp" />
				</header>

				<!--오른쪽 본문-->
				<div class="myfav_content_Area">
					<!-- 전체, 기부, 봉사 -->
					<div class="fav_category_container">
						<div class="favcategory">
							<button class="favcategoryBtn">전체</button>
						</div>
					</div>

					<!-- 즐겨찾기 카드부분 -->
					<c:choose>
						<c:when test="${empty favoriteList}">
							<p>즐겨 찾는 플렛폼이 없습니다.</p>
						</c:when>
						<c:otherwise>
							<c:forEach var="favoriteList" items="${favoriteList}">
								<div class="myfavcard_contaner">
									<div class="categoryImgContainer">
										<div class="categoryImg">
											<i class="fa-solid fa-person-cane"></i>
										</div>
										<!-- 점선 -->
										<div class="hrpart">
											<div class="hrpart2"></div>
										</div>
									</div>

									<!-- 메인내용 -->
									<div class="favMaincontainer">
										<!-- 카테고리, 마감일, 메인 -->
										<div class="categoryUpdateContainer">
											<div class="detailCategory">
												<div style="color: #00CA61;">${favoriteList.categoryName}</div>
												&nbsp;${favoriteList.parentCategoryName}
											</div>
										</div>
										<div class="titleContainer">
											<div class="favTitle">${favoriteList.favoriteTitle}</div>
										</div>
									</div>
									<div class="favmarkContainer">
										<div class="favMark"><i class="fa-regular fa-heart heartIcon" ></i></div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>

					<div class="container4">
                        <nav class="page-nav">
                            <c:set var="url" value="?cp=" />
                            <ul class="pagination">
                                <li><a href="${url}1${sURL}">&lt;&lt;</a></li>
                                <li><a href="${url}${pagination.prevPage}${sURL}">&lt;</a></li>
                                
                                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

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
                        </nav>
                    </div>
				</div>
			</div>
		</div>
	</main>
	<footer>
		<jsp:include page="/WEB-INF/views/main/footer.jsp" />
	</footer>

	<script src="/JS/mypage/favorites.js"></script>

</body>

</html>