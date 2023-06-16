<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <a href="${pageContext.request.contextPath}/volunteer/story" class="mainCategoryItem" id="story">봉사이야기</a>
    </div>
</div>

<section class="mainContainer">
    <div class="mainContent">

        <div class="subCategoryArea">

            <ul class="subCategoryList">
                <li class="subCategoryItem">
                    <input type="radio" id="SubCategory0" class="SubCategoryTheme" name="SubCategory" checked>
                    <label for="SubCategory0" class="SubCategoryLabelTheme SubCategoryChecked">
                        <div class="SubCategoryEmojiTheme">🧚</div>
                        전체
                    </label>
                </li>
                <li class="subCategoryItem">
                    <input type="radio" id="SubCategory1" class="SubCategoryTheme" name="SubCategory">
                    <label for="SubCategory1" class="SubCategoryLabelTheme">
                        <div class="SubCategoryEmojiTheme">🥳</div>
                        아동청소년
                    </label>
                </li>
                <li class="subCategoryItem">
                    <input type="radio" id="SubCategory2" class="SubCategoryTheme" name="SubCategory">
                    <label for="SubCategory2" class="SubCategoryLabelTheme">
                        <div class="SubCategoryEmojiTheme">🥸</div>
                        어르신
                    </label>
                </li>
                <li class="subCategoryItem">
                    <input type="radio" id="SubCategory3" class="SubCategoryTheme" name="SubCategory">
                    <label for="SubCategory3" class="SubCategoryLabelTheme">
                        <div class="SubCategoryEmojiTheme">💖</div>
                        장애인
                    </label>
                </li>
                <li class="subCategoryItem">
                    <input type="radio" id="SubCategory4" class="SubCategoryTheme" name="SubCategory">
                    <label for="SubCategory4" class="SubCategoryLabelTheme">
                        <div class="SubCategoryEmojiTheme">🌏</div>
                        다문화
                    </label>
                </li>
                <li class="subCategoryItem">
                    <input type="radio" id="SubCategory5" class="SubCategoryTheme" name="SubCategory">
                    <label for="SubCategory5" class="SubCategoryLabelTheme">
                        <div class="SubCategoryEmojiTheme">🐶</div>
                        동물
                    </label>
                </li>
                <li class="subCategoryItem">
                    <input type="radio" id="SubCategory6" class="SubCategoryTheme" name="SubCategory">
                    <label for="SubCategory6" class="SubCategoryLabelTheme">
                        <div class="SubCategoryEmojiTheme">🪴</div>
                        환경
                    </label>
                </li>
                <li class="subCategoryItem">
                    <input type="radio" id="SubCategory7" class="SubCategoryTheme" name="SubCategory">
                    <label for="SubCategory7" class="SubCategoryLabelTheme">
                        <div class="SubCategoryEmojiTheme">🩸</div>
                        헌혈
                    </label>
                </li>
                <li class="subCategoryItem">
                    <input type="radio" id="SubCategory8" class="SubCategoryTheme" name="SubCategory">
                    <label for="SubCategory8" class="SubCategoryLabelTheme">
                        <div class="SubCategoryEmojiTheme">👻</div>
                        기타
                    </label>
                </li>
            </ul>
        </div>

        <div id="content" class="content">
            <h4 class="contentTitle">
                동물 봉사
                <span class="contentCount" id="contentCount">20</span>개
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

                <div class="item">
                    <div class="buttonSection">
                        <a href="" class="button">🍀 봉사하기
                            <img src="${pageContext.request.contextPath}/resources/images/chevron-right-solid-gray.svg" class="buttonImage"></a>
                        <div class="favoriteButton">💖</div>
                    </div>

                    <a href="">
                        <img src="${pageContext.request.contextPath}/resources/images/logo.jpg" class="thumbnail">
                        <div class="subTitle">타이틀</div>
                        <div class="mainTitle">타이틀2</div>
                    </a>
                    <div class="progressBar">
                        <div class="progressBarValue"></div>
                    </div>

                    <div class="info">
                        <div class="d-day">D-180</div>
                        <div>달성률
                            <span class="progressPercentage">50%</span>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="buttonSection">
                        <a href="" class="button">🍀 봉사하기
                            <img src="${pageContext.request.contextPath}/resources/images/chevron-right-solid-gray.svg" class="buttonImage"></a>
                        <div class="favoriteButton">💖</div>
                    </div>

                    <a href="">
                        <img src="${pageContext.request.contextPath}/resources/images/logo.jpg" class="thumbnail">
                        <div class="subTitle">타이틀</div>
                        <div class="mainTitle">타이틀2</div>
                    </a>
                    <div class="progressBar">
                        <div class="progressBarValue"></div>
                    </div>

                    <div class="info">
                        <div class="d-day">D-180</div>
                        <div>달성률
                            <span class="progressPercentage">50%</span>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="buttonSection">
                        <a href="" class="button">🍀 봉사하기
                            <img src="${pageContext.request.contextPath}/resources/images/chevron-right-solid-gray.svg" class="buttonImage"></a>
                        <div class="favoriteButton">💖</div>
                    </div>

                    <a href="">
                        <img src="${pageContext.request.contextPath}/resources/images/logo.jpg" class="thumbnail">
                        <div class="subTitle">타이틀</div>
                        <div class="mainTitle">타이틀2</div>
                    </a>
                    <div class="progressBar">
                        <div class="progressBarValue"></div>
                    </div>

                    <div class="info">
                        <div class="d-day">D-180</div>
                        <div>달성률
                            <span class="progressPercentage">50%</span>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="buttonSection">
                        <a href="" class="button">🍀 봉사하기
                            <img src="${pageContext.request.contextPath}/resources/images/chevron-right-solid-gray.svg" class="buttonImage"></a>
                        <div class="favoriteButton">💖</div>
                    </div>

                    <a href="">
                        <img src="${pageContext.request.contextPath}/resources/images/logo.jpg" class="thumbnail">
                        <div class="subTitle">타이틀</div>
                        <div class="mainTitle">타이틀2</div>
                    </a>
                    <div class="progressBar">
                        <div class="progressBarValue"></div>
                    </div>

                    <div class="info">
                        <div class="d-day">D-180</div>
                        <div>달성률
                            <span class="progressPercentage">50%</span>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="buttonSection">
                        <a href="" class="button">🍀 봉사하기
                            <img src="${pageContext.request.contextPath}/resources/images/chevron-right-solid-gray.svg" class="buttonImage"></a>
                        <div class="favoriteButton">💖</div>
                    </div>

                    <a href="">
                        <img src="${pageContext.request.contextPath}/resources/images/logo.jpg" class="thumbnail">
                        <div class="subTitle">타이틀</div>
                        <div class="mainTitle">타이틀2</div>
                    </a>
                    <div class="progressBar">
                        <div class="progressBarValue"></div>
                    </div>

                    <div class="info">
                        <div class="d-day">D-180</div>
                        <div>달성률
                            <span class="progressPercentage">50%</span>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="buttonSection">
                        <a href="" class="button">🍀 봉사하기
                            <img src="${pageContext.request.contextPath}/resources/images/chevron-right-solid-gray.svg" class="buttonImage"></a>
                        <div class="favoriteButton">💖</div>
                    </div>

                    <a href="">
                        <img src="${pageContext.request.contextPath}/resources/images/logo.jpg" class="thumbnail">
                        <div class="subTitle">타이틀</div>
                        <div class="mainTitle">타이틀2</div>
                    </a>
                    <div class="progressBar">
                        <div class="progressBarValue"></div>
                    </div>

                    <div class="info">
                        <div class="d-day">D-180</div>
                        <div>달성률
                            <span class="progressPercentage">50%</span>
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <div>페이지네이션</div>

    </div>
</section>

<footer>
    <jsp:include page="/WEB-INF/views/main/footer.jsp" />
</footer>

<script src="${pageContext.request.contextPath}/resources/js/volunteer/volunteer.js"></script>
</body>
</html>