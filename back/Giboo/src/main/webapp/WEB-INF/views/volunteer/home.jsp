<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <title>03.main</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/volunteer/volunteer.css">
</head>
<body>
<header>
    <jsp:include page="/WEB-INF/views/main/header.jsp" />
</header>


<div class="mainCategoryArea">
    <div class="mainCategoryInner">
        <a href="${pageContext.request.contextPath}/volunteer/home" class="mainCategoryItem mainCategoryChecked" id="home">봉사 진행중</a>
        <a href="${pageContext.request.contextPath}/volunteer/storyList" class="mainCategoryItem" id="story">봉사이야기</a>
    </div>
</div>

<section class="mainContainer">
    <div class="mainContent">

        <div class="subCategoryArea">

            <ul class="subCategoryList">
                <li class="subCategoryItem">
                    <a href="../volunteer/home" id="all" class="SubCategoryLabelTheme">
                        <div class="SubCategoryEmojiTheme">🧚</div>
                        전체
                    </a>
                </li>

                <c:forEach var="parentCategoryList" items="${parentCategoryList}">
                    <li class="subCategoryItem">
                        <a href="../volunteer/home?category=${parentCategoryList.parentCategoryNo}" class="SubCategoryLabelTheme">
                            <div class="SubCategoryEmojiTheme">${parentCategoryList.parentCategoryThumbnail}</div>
                                ${parentCategoryList.parentCategoryName}
                        </a>
                    </li>
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
                        ${volunteerList[0].parentCategoryName}
                    </c:otherwise>
                </c:choose>
                봉사
                <span class="contentCount" id="contentCount">${volunteerListCount}</span>개
            </h4>

            <div class="sortingSection">
                <div id="sortingArea" class="sortingArea">
                    <select class="sortingButton" id="sortingButton">
                        종료임박 순
                        <img src="${pageContext.request.contextPath}/resources/images/chevron-down-solid.svg">
                        <option value="expired">종료임박 순</option>
                        <option value="recommended">추천 순</option>
                        <option value="new">최신 순</option>
                        <option value="participantsDesc">참여자 많은 순</option>
                        <option value="participantsAsc">참여자 적은 순</option>
                    </select>
                </div>
            </div>

            <div id="list" class="list">

                <c:forEach var="volunteerList" items="${volunteerList}">
                    <div class="item">
                        <div class="buttonSection">
                            <a href="" class="button">🍀 봉사하기
                                <img src="${pageContext.request.contextPath}/resources/images/chevron-right-solid-gray.svg" class="buttonImage"></a>
                            <div class="favoriteButton" id="${volunteerList.volunteerNo}">🤍</div>
                        </div>

                        <a href="../volunteer/detail/${volunteerList.volunteerNo}?cp=${pagination.currentPage}">
                            <img src="${pageContext.request.contextPath}/resources/images/logo.jpg" class="thumbnail">

                            <div class="mainTitle">${volunteerList.volunteerTitle}</div>
                        </a>
                        <div class="progressBar">
                            <div class="progressBarValue" style="width: ${volunteerList.percent}%"></div>
                        </div>

                        <div class="info">
                            <div class="d-day">D-${volunteerList.DDay}</div>
                            <div>달성률
                                <span class="progressPercentage">${volunteerList.percent}%</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>

        </div>

        <div class="container4">
            <c:set var="url" value="?cp="/>
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
        </div>

        <div class="writeBtn-container">
            <c:if test="${loginMember.memberType == 'N'}">
                <button class="writeBtn"
                        onclick="location.href='${pageContext.request.contextPath}/volunteer/write?mode=insert&cp=${pagination.currentPage}'"><i
                        class="fa-solid fa-pen"></i>_봉사등록</button>
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
                 data: {"memberNo" : ${loginMember.memberNo}, "volunteerNo" : i.id},
                 
                success: function(result) {
                    if (result == "success") {
                        if (i.innerHTML == "🤍") {
                            i.innerHTML = '❤️'; 
                           console.log("성공");
                           
                        } else {
                            i.innerHTML = '🤍'; 
                             
                            
                        }

                        
                    } else {
                        alert("이미 추가햇음");
                    
                    }
                }
            })
        })
    }
</script>

<script src="${pageContext.request.contextPath}/resources/js/volunteer/volunteer.js"></script>
</body>
</html>