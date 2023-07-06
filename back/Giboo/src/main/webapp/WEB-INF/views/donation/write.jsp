<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기부 등록</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/donation/donationWrite2.css">
</head>
<body>
<header>
    <jsp:include page="/WEB-INF/views/main/header.jsp" />
</header>

<div class="mainTitleArea">
    <div class="mainTitle">기부등록</div>
</div>

<section class="mainContainer">
    <div class="mainContent">
        <form action="write" method="post" class="contentContainer">
            <ul class="writeArea">
                <li>
                    <div class="titleAreaInner">
                        <div class="listTitle">타이틀</div>
                        <input type="text" id="titleInput" name="donationTitle" placeholder="제목을 입력해 주세요." value="${detail.donationTitle}">
                    </div>
                </li>

                <li>
                    <div>
                        <div class="listTitle">모집일</div>
                        <input type="date" id="startDate" name="startRecruitDate" data-placeholder="시작일" aria-required="true" value="${detail.startRecruitDate}">
                        <div class="margin">~</div>
                        <input type="date" id="dueDate" name="endRecruitDate" data-placeholder="종료일" aria-required="true" value="${detail.endRecruitDate}">
                    </div>
                </li>

                <li>
                    <div>
                        <div class="listTitle">진행일</div>
                        <input type="date" id="beginDate" name="startProgressDate" data-placeholder="시작일" aria-required="true" value="${detail.startProgressDate}">
                        <div class="margin">~</div>
                        <input type="date" id="endDate" name="endProgressDate" data-placeholder="종료일" aria-required="true" value="${detail.endProgressDate}">
                    </div>
                </li>

                <li>
                    <div>
                        <div class="listTitle">목표 기부금</div>
                        <input type="number" id="amount" name="targetAmount" placeholder="목표 기부금을 입력해 주세요." min="100" value="${detail.targetAmount}">
                    </div>
                </li>

                <li>
                    <div>
                        <div class="listTitle">기부 지역</div>
                        <input type="text" id="address" name="donationAddr" placeholder="주소를 입력해 주세요." readonly value="${detail.donationAddr}">
                        <button type="button" id="searchAddress" onclick="sample5_execDaumPostcode()">주소검색</button>
                    </div>
                </li>

                <li>
                    <div>
                        <div class="listTitle">카테고리 선택</div>
                        <select name="parentCategoryNo">
                            <c:forEach var="parentCategory" items="${parentCategoryList}">
                                <option value="${parentCategory.parentCategoryNo}" class="selectCategory">${parentCategory.parentCategoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </li>

                <li>
                    <div class="contentArea">
                        <div class="listTitle">내용</div>
                        <textarea id="summernote" name="donationContent"></textarea>
                    </div>
                </li>

                <li>
                    <div class="imgInputArea">
                        <div class="listTitle">썸네일</div>
                        <div class="imgInputInner">
                            <input id="imgInput" type="file" accept="image/*">
                            <label for="imgInput" class="imgSelectButton">찾아보기
                                <input id="img1" name="donationAttachment" value="${imgInput}" hidden="hidden"></label>
                            <div id="imgInputPlaceholder">${detail.donationAttachment}</div>

                        </div>
                    </div>
                </li>
            </ul>

            <div class="optionArea">
                <a type="button" class="list" onclick="history.back();">목록으로</a>
                <div>
                    <button type="submit" class="edit">등록</button>
                    <button class="delete" type="button" onclick="history.back();">취소</button>
                </div>
            </div>

            <!-- 동작 구분 -->
            <input type="hidden" name="mode" value="${param.mode}">

            <!-- 게시글 번호 (커맨드객체 NoticeDetail.noticeNo 세팅) -->
            <input type="hidden" name="donationNo" value="${empty param.no ? 0 : param.no}">

            <!-- 현재 페이지 -->
            <input type="hidden" name="cp" value="${param.cp}">
        </form>
    </div>
</section>

<footer>
    <jsp:include page="/WEB-INF/views/main/footer.jsp" />
</footer>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/summernote/writeForm.js" ></script>

<script src="${pageContext.request.contextPath}/resources/js/donation/donationWrite2.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    $(document).ready(function () {
        const selectCategory = document.getElementsByClassName("selectCategory");

        for (const i of selectCategory) {
            if (i.value == "${detail.parentCategoryNo}") {
                i.setAttribute("selected", "selected");
            }
        }

        const url = new URL(window.location.href);
        console.log("url" + url);

        const urlParams = url.searchParams;
        const mode = urlParams.get('mode');
        console.log(mode);

        const content = "${detail.donationContent}";

        switch (mode) {
            case "insert":
                summernote();
                break;

            case "update":
                updateLoad(content);
                break;
        }
    });

    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = addr;
            }
        }).open();
    }
</script>

</body>
</html>