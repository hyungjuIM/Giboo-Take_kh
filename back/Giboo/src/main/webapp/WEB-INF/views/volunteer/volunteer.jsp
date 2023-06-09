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
        <a href="/volunteer/volunteer" class="mainCategoryItem mainCategoryChecked" id="volunteer">봉사 진행중</a>
        <a href="/volunteer/volunteerStory" class="mainCategoryItem" id="volunteerStory">봉사이야기</a>
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
                        <img src="../../images/chevron-down-solid.svg">
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
                            <img src="../../images/chevron-right-solid-gray.svg" class="buttonImage"></a>
                        <div class="button">💖</div>
                    </div>

                    <a href="">
                        <img src="../../images/logo.jpg" class="thumbnail">
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
                            <img src="../../images/chevron-right-solid-gray.svg" class="buttonImage"></a>
                        <div class="button">💖</div>
                    </div>

                    <a href="">
                        <img src="../../images/logo.jpg" class="thumbnail">
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
                            <img src="../../images/chevron-right-solid-gray.svg" class="buttonImage"></a>
                        <div class="button">💖</div>
                    </div>

                    <a href="">
                        <img src="../../images/logo.jpg" class="thumbnail">
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
                            <img src="../../images/chevron-right-solid-gray.svg" class="buttonImage"></a>
                        <div class="button">💖</div>
                    </div>

                    <a href="">
                        <img src="../../images/logo.jpg" class="thumbnail">
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
                            <img src="../../images/chevron-right-solid-gray.svg" class="buttonImage"></a>
                        <div class="button">💖</div>
                    </div>

                    <a href="">
                        <img src="../../images/logo.jpg" class="thumbnail">
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
                            <img src="../../images/chevron-right-solid-gray.svg" class="buttonImage"></a>
                        <div class="button">💖</div>
                    </div>

                    <a href="">
                        <img src="../../images/logo.jpg" class="thumbnail">
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

<!-- jQuery 라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
    $(function () {
        var include1 = $('[data-include1="header"]');
        jQuery.each(include1, function () {
            $(this).load('../../html/01.header.html');
        });
    });

</script>

<script src="../../JS/volunteer/volunteer.js"></script>
</body>
</html>