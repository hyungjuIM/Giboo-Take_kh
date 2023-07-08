<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="pagination" value="${map.pagination}" />
<c:set var="parentCategoryList" value="${map.parentCategoryList}" />
<c:set var="volunteerList" value="${map.volunteerList}" />
<c:set var="volunteerListCount" value="${map.volunteerListCount}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>hunny</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/volunteer/volunteer.css">
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/main/header.jsp" />
	</header>

	<div class="mainCategoryArea">
		<div class="mainCategoryInner">
			<a href="${pageContext.request.contextPath}/volunteer/home"
				class="mainCategoryItem mainCategoryChecked" id="home">봉사 진행중</a> <a
				href="${pageContext.request.contextPath}/volunteer/storyList"
				class="mainCategoryItem" id="story">봉사이야기</a>
		</div>
	</div>

	<section class="mainContainer">
		<div class="mainContent">

			<div class="subCategoryArea">

				<ul class="subCategoryList">
					<li class="subCategoryItem"><a href="../volunteer/home"
						id="all" class="SubCategoryLabelTheme">
							<div class="SubCategoryEmojiTheme">
								<span>🧚</span>
							</div> 전체
					</a></li>

					<c:forEach var="parentCategoryList" items="${parentCategoryList}">
						<li class="subCategoryItem"><a
							href="../volunteer/home?category=${parentCategoryList.parentCategoryNo}"
							id="category${parentCategoryList.parentCategoryNo}"
							class="SubCategoryLabelTheme">
								<div class="SubCategoryEmojiTheme">
									<span>${parentCategoryList.parentCategoryThumbnail}</span>
								</div> ${parentCategoryList.parentCategoryName}
						</a></li>
					</c:forEach>
				</ul>
			</div>

			<div id="content" class="content">
				<div class="sortingSection">

					<h4 class="contentTitle">
						<c:choose>
							<c:when test="${empty param.category}">
                        전체
                    </c:when>
							<c:otherwise>
                        ${volunteerList[0].parentCategoryName}
                    </c:otherwise>

						</c:choose>
						봉사 <span class="contentCount" id="contentCount">${volunteerListCount}</span>개
					</h4>

					<div id="sortingArea" class="sortingArea">
						<select class="sortingButton" id="sortingButton"> 최신 순
							<img src="${pageContext.request.contextPath}/resources/images/chevron-down-solid.svg">
							<option value="new">최신 순</option>
							<option value="favorite">즐겨찾기 순</option>
						</select>
					</div>
					</div>
					<div id="list" class="list">

						<c:forEach var="volunteerList" items="${volunteerList}">
							<div class="item">
								<div class="buttonSection">
									
										<%-- <a href="" class="button">봉사하기<i class="xi-angle-right"></i> <img src="${pageContext.request.contextPath}/resources/images/chevron-right-solid-gray.svg" class="buttonImage"> </a>--%>
									<c:choose>
										<c:when
											test="${fn:contains(favoriteList, volunteerList.volunteerNo)}">
											<div class="favoriteButton" id="${volunteerList.volunteerNo}" data-title="${volunteerList.volunteerTitle}">❤️</div>
										</c:when>

										<c:otherwise>
											<div class="favoriteButton" id="${volunteerList.volunteerNo}"  data-title="${volunteerList.volunteerTitle}">🤍</div>
										</c:otherwise>
									</c:choose>
								</div>


								<div class="content_container">
									<a href="../volunteer/detail/${volunteerList.volunteerNo}?cp=${pagination.currentPage}">
										<img src="${pageContext.request.contextPath}${volunteerList.volunteerAttachment}" class="thumbnail">
										<div class="text_container">
											<div class="mainTitle">${volunteerList.volunteerTitle}</div>

											<div class="progressBar">
												<div class="progressBarValue"
													style="width: ${volunteerList.percent}%"></div>
											</div>

											<div class="info">
												<div class="d-day">D-${volunteerList.DDay}</div>
												<div>
													달성률 <span class="progressPercentage">${volunteerList.percent}%</span>
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
					<c:set var="url" value="?category=${param.category}&cp=" />
					<ul class="pagination">
						<li class="first"><a href="${url}1${sURL}">&lt;&lt;</a></li>
						<li class="prev"><a
							href="${url}${pagination.prevPage}${sURL}">&lt;</a></li>
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
						<li class="next"><a
							href="${url}${pagination.nextPage}${sURL}">&gt;</a></li>
						<li class="last"><a href="${url}${pagination.maxPage}${sURL}">&gt;&gt;</a></li>
					</ul>
				</div>

				<div class="writeBtn-container">
					<c:if test="${loginMember.memberType == 'N'}">
						<button class="writeBtn"
							onclick="location.href='${pageContext.request.contextPath}/volunteer/write?mode=insert&cp=${pagination.currentPage}'">
							<i class="fa-solid fa-pen"></i>_봉사등록
						</button>
					</c:if>
				</div>

			</div>
	</section>

	<footer>
		<jsp:include page="/WEB-INF/views/main/footer.jsp" />
	</footer>

	<script>

     const favoriteButton = document.getElementsByClassName("favoriteButton");
     for (let i of favoriteButton) {
         i.addEventListener("click", function() {
             console.log("${loginMember.memberNo}");
             console.log(i.id);



              $.ajax ({
                  url: "addFavorite",
                  data: {"memberNo" : ${loginMember.memberNo},
                         "volunteerNo" : i.id ,
                         "volunteerTitle" : i.dataset.title},

                 success: function(result) {
                     if (result == "success") {

                         i.innerHTML = '❤️';

                 } else {
                     i.innerHTML = '🤍';
                 }
                 }
             })


             $.ajax ({
                 url: "deleteFavorite",
                 data: {"memberNo" : ${loginMember.memberNo},
                        "volunteerNo" : i.id ,
                        "volunteerTitle" : i.dataset.title},

                 success: function(result) {
                    if (result == "success") {
                        i.innerHTML = '🤍';
                    } else {
                        i.innerHTML = "❤️";
                    }
                }
            })

        })
    }
</script>

	<script
		src="${pageContext.request.contextPath}/resources/js/volunteer/volunteer.js"></script>
</body>
</html>