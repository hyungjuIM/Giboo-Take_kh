<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>즐겨찾기</title>

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
						<div class="favcategory">
							<button class="favcategoryBtn">기부</button>
						</div>
						<div class="favcategory">
							<button class="favcategoryBtn">봉사</button>
						</div>

					</div>

					<!-- 즐겨찾기 카드부분 -->
					<div class="myfavcard_contaner">
						<!-- 이모티콘 -->
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
									<div style="color: #8071fc;">기부</div>
									&nbsp;어르신
								</div>
								<div class="updateDate">2023.05.30</div>
							</div>
							<div class="titleWrap">
							<!-- 제목, 작성자, 달성률, 총기부금액 -->
							<c:choose>
							    <c:when test="${empty favoritesList}">
							        <p>즐겨 찾는 플렛폼이 없습니다.</p>
							    </c:when>
							    <c:otherwise>

							        <c:forEach var="favorite" items="${favoritesList}">
							            <!-- Use the 'favorite' object to display each favorite. For example: -->
							            
										<div class="titleContainer">
							                <div class="favTitle">${favorite.mainTitle}</div>
							               
							            </div>
							        </c:forEach>
							    </c:otherwise>
							</c:choose>

						<div class="favmarkContainer">
							<div class="favMark">
								<i class="fa-regular fa-heart heartIcon"></i>
							</div>
						</div>
					</div>
				</div>


					</div>
					<!-- 즐겨찾기 카드부분 -->
					<!-- <div class="myfavcard_contaner">
						이모티콘
						<div class="categoryImgContainer">
							<div class="categoryImg">
								<i class="fa-solid fa-person-cane"></i>
							</div>
							점선
							<div class="hrpart">
								<div class="hrpart2"></div>
							</div>
						</div> -->

						<!-- 메인내용 -->
				  		 <!-- <div class="favMaincontainer">
							카테고리, 마감일, 메인
							<div class="categoryUpdateContainer">
								<div class="detailCategory">
									<div style="color: #8071fc;">기부</div>
									&nbsp;어르신
								</div>
								<div class="updateDate">2023.05.30</div>
							</div>

							제목, 작성자, 달성률, 총기부금액
							<div class="titleContainer">
								<div class="favTitle">강릉 산불 피해 주민분들을 위한 모금</div>
								<div class="favWriter">밀알 복지 재단</div>
								<div class="achieveFav">달성률 60% | 총 기부 금액 1,358,000원</div>
							</div>
						</div> 

						하트모양
						<div class="favmarkContainer">
							<div class="favMark">
								<i class="fa-regular fa-heart heartIcon"></i>
							</div>

						</div> -->


					</div>

				</div>



			</div>
			<!-- mypage_wrapper -->
		</div>
		<!-- mypage-container -->
	</main>

	<script src="/JS/mypage/favorites.js"></script>
	<!-- jQuery 라이브러리 추가 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script>
		$(function() {
			var include1 = $('[data-include1="header"]');
			jQuery.each(include1, function() {
				$(this).load('/html/01.header.html');
			});
		});
	</script>
</body>

</html>