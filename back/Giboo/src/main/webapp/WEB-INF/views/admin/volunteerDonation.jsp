<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>adminVolunteer</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminVolunteerDonate.css">
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/main/header.jsp" />
    </header>


    <section class="mainContainer">
        <div class="menuName">기부 / 봉사 관리</div>

        <div class="mainContent">
            <div class="sideMenuArea">
                    <div class="profileImageArea">
                        <img class="profileImage" src="${pageContext.request.contextPath}/resources/images/dog_emoji.png">
                    </div>
                    <div class="managerNickname">관리자</div>
                    <div class="welcomeMessage">관리자님, 안녕하세요</div>

                <ul class="sideMenu">
                    <li class="sideMenuItem"><a href="${pageContext.request.contextPath}/admin/home">대쉬보드</a></li>
                    <li class="sideMenuItem"><a href="${pageContext.request.contextPath}/admin/member">회원 관리</a></li>
                    <li class="sideMenuItem"><a href="${pageContext.request.contextPath}/admin/manager">관리자 관리</a></li>
                    <li class="sideMenuItem"><a href="${pageContext.request.contextPath}/notice/">공지사항 관리</a></li>
                    <li class="sideMenuItem"><a href="${pageContext.request.contextPath}/admin/chat">1 대 1 채팅 상담</a></li>
                    <li class="sideMenuItem"><a href="${pageContext.request.contextPath}/admin/volunteerDonation">기부 / 봉사 관리</a></li>
                    <li class="sideMenuItem"><a href="${pageContext.request.contextPath}/admin/event">이벤트 관리</a></li>
                    <li class="sideMenuItem"><a href="${pageContext.request.contextPath}/admin/category">카테고리 관리</a></li>
                    <li class="sideMenuItem"><a href="${pageContext.request.contextPath}/admin/faq">자주 찾는 질문 관리</a></li>
                </ul>

                <div class="optionArea">
                    <button class="logout">로그아웃</button>
                </div>`
            </div>

            <div class="contentContainer">
                <div class="contentArea">
                    <div class="menuArea">
                        <table class="menuBox">
                            <tbody>
                                <tr class="menuTitle">
                                    <td>검색</td>
                                    <td></td>
                                </tr>

                                <tr class="menuItem">
                                    <td class="searchOptionArea">
                                        <select id="searchOption">
                                            <option value="no">번호</option>
                                            <option value="id">아이디</option>
                                            <option value="email">이메일</option>
                                            <option value="name">이름</option>
                                            <option value="nickname">닉네임</option>
                                            <option value="title">주소</option>
                                            <option value="enrollDate">작성일</option>
                                        </select>
                                        <input type="text" id="inputSearch">
                                        <button id="searchButton">🔎</button>
                                    </td>
                                    <td><button type="reset" id="resetSearch" class="resetSearch">초기화</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <table class="listTable">
                        <tbody>
                            <tr class="sortingOptionArea">
                                <td><button id="selectAll">선택</button></td>
                                <td><button id="sortByNo">번호</button></td>
                                <td><button id="sortByType">구분</button></td>
                                <td><button id="sortById">아이디</button></td>
                                <td><button id="sortByTitle">제목</button></td>
                                <td><button id="sortByEnrollDate">작성일</button></td>
                                <td><button id="sortByApprovalReason">사유</button></td>
                                <td><button id="sortByApprovalStatus">결재 여부</button></td>
                            </tr>

                            <c:forEach var="volunteerlist" items="${volunteerList}">
                                <tr class="listArea">
                                    <td><input type="checkbox" class="listCheck"></td>
                                    <td>${volunteerlist.volunteerNo}</td>
                                    <td>${volunteerlist.parentCategoryName}</td>
                                    <td>${volunteerlist.memberId}</td>
                                    <td>${volunteerlist.volunteerTitle}</td>
                                    <td>${volunteerlist.enrollDate}</td>
                                    <td>봉사 인원 변동</td>
                                    <td class="confirm">승인</td>
                                    <td><button class="detail">상세 정보</button></td>
                                </tr>
                            </c:forEach>

                            <c:forEach var="donationlist" items="${donationList}">
                                <tr class="listArea">
                                    <td><input type="checkbox" class="listCheck"></td>
                                    <td>${donationlist.donationNo}</td>
                                    <td>${donationlist.parentCategoryName}</td>
                                    <td>${donationlist.memberId}</td>
                                    <td>${donationlist.donationTitle}</td>
                                    <td>${donationlist.enrollDate}</td>
                                    <td>봉사 인원 변동</td>
                                    <td class="confirm">승인</td>
                                    <td><button class="detail">상세 정보</button></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <jsp:include page="/WEB-INF/views/main/footer.jsp" />
    </footer>

    <script src="${pageContext.request.contextPath}/resources/js/admin/adminVolunteerDonate.js"></script>
</body>
</html>