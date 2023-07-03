<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pagination" value="${map.pagination}" />
<c:set var="parentCategoryList" value="${map.parentCategoryList}" />
<c:set var="donationList" value="${map.donationList}" />
<c:set var="donationListCount" value="${map.donationListCount}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>donation</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/donation/donation.css">
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/main/header.jsp" />
	</header>

	<div class="mainCategoryArea">
		<div class="mainCategoryInner">
			<a href="${pageContext.request.contextPath}/donation/home"
				class="mainCategoryItem mainCategoryChecked" id="home">기부 진행중</a> <a
				href="${pageContext.request.contextPath}/donation/storyList"
				class="mainCategoryItem" id="story">기부이야기</a>
		</div>
	</div>

	<section class="mainContainer">
		<div class="mainContent">

			<div class="subCategoryArea">

				<ul class="subCategoryList">
					<li class="subCategoryItem"><a href="../donation/home"
						id="all" class="SubCategoryLabelTheme">
							<div class="SubCategoryEmojiTheme">🧚</div> 전체
					</a></li>

					<c:forEach var="parentCategoryList" items="${parentCategoryList}">
						<li class="subCategoryItem"><a
							href="../donation/home?category=${parentCategoryList.parentCategoryNo}"
							id="category${parentCategoryList.parentCategoryNo}"
							class="SubCategoryLabelTheme">
								<div class="SubCategoryEmojiTheme">${parentCategoryList.parentCategoryThumbnail}</div>
								${parentCategoryList.parentCategoryName}
						</a></li>
					</c:forEach>

				</ul>
			</div>

			<div id="content" class="content">
				<h4 class="contentTitle">
					<c:choose>
						<c:when test="${empty param.category}">
                        전체
                    </c:when>
						<c:otherwise>
                        ${donationList[0].parentCategoryName}
                    </c:otherwise>
					</c:choose>
					기부 <span class="contentCount" id="contentCount">${donationListCount}</span>개
				</h4>

				<div class="sortingSection">
					<div id="sortingArea" class="sortingArea">
						<select class="sortingButton" id="sortingButton"> 종료임박 순
							<img
							src="${pageContext.request.contextPath}/resources/images/chevron-down-solid.svg">
							<option value="expired">종료임박 순</option>
							<option value="recommended">추천 순</option>
							<option value="new">최신 순</option>
							<option value="participantsDesc">참여자 많은 순</option>
							<option value="participantsAsc">참여자 적은 순</option>
						</select>
					</div>
				</div>

				<%-- 콘텐츠 부분 --%>
				<div id="list" class="list">

					<c:forEach var="donationList" items="${donationList}">
						<div class="item">
							<div class="buttonSection">
								<a href="" class="button">기부하기 <i class="xi-angle-right"></i>
									<%--  <img src="${pageContext.request.contextPath}/resources/images/chevron-right-solid-gray.svg" class="buttonImage"> --%></a>
								<div class="favoriteButton"
									onclick="addFavorite('${donationList.donationTitle}')">🤍</div>
							</div>

							<div class="content_container">
								<a
									href="../donation/detail/${donationList.donationNo}?cp=${pagination.currentPage}">
									<img
									src="${pageContext.request.contextPath}/resources/images/logo.jpg"
									class="thumbnail">
									<div class="text_container">
										<div class="mainTitle">${donationList.donationTitle}</div>
										<span class="subTitle"><span>모집</span>2023. 01. 01 ~
											2023. 01. 02</span>
										<div class="progressBar">
											<div class="progressBarValue"
												style="width: ${donationList.percent}%"></div>
										</div>

										<div class="info">
											<div class="D-day">D-${donationList.DDay}</div>
											<div>
												달성률 <span class="progressPercentage">${donationList.percent}%</span>
											</div>
										</div>
									</div>
								</a>
							</div>
						</div>
					</c:forEach>

				</div>

			</div>

			<div class="container4">
				<c:set var="url" value="?cp=" />
				<ul class="pagination">
					 <li class="first"><a href="${url}1${sURL}">&lt;&lt;</a></li>
					<li class="prev"><a href="${url}${pagination.prevPage}${sURL}">&lt;</a></li>
					<c:forEach var="i" begin="${pagination.startPage}"
						end="${pagination.endPage}" step="1">
						<c:choose>
							<c:when test="${i == pagination.currentPage}">
								<li class="num active"><a class="current">${i}</a></li>
							</c:when>

							<c:otherwise>
								<li class="num"><a href="${url}${i}${sURL}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="next"><a href="${url}${pagination.nextPage}${sURL}">&gt;</a></li>
					<li class="last"><a href="${url}${pagination.maxPage}${sURL}">&gt;&gt;</a></li>
				</ul>
			</div>

			<div class="writeBtn-container">
				<c:if test="${loginMember.memberType == 'N'}">
					<button class="writeBtn"
						onclick="location.href='${pageContext.request.contextPath}/donation/write?mode=insert&cp=${pagination.currentPage}'">
						<span>📝</span> 기부등록
					</button>
					
				</c:if>
			</div>

		</div>
	</section>

	<footer>
		<jsp:include page="/WEB-INF/views/main/footer.jsp" />
	</footer>

	<script
		src="${pageContext.request.contextPath}/resources/js/donation/donation.js"></script>
</body>
</html>