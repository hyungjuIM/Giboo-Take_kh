<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>hunny</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminManager.css">
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/main/header.jsp" />
    </header>


    <section class="mainContainer">
        <div class="menuName">관리자 관리</div>

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
                </div>
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
                                            <option value="permission">권한</option>
                                            <option value="id">아이디</option>
                                            <option value="email">이메일</option>
                                            <option value="name">이름</option>
                                            <option value="nickname">닉네임</option>
                                            <option value="tel">전화번호</option>
                                        </select>
                                        <input type="text" id="inputSearch">
                                        <button id="searchButton">🔎</button>
                                    </td>
                                    <td><button type="reset" id="resetSearch" class="resetSearch">초기화</button></td>
                                </tr>
                            </tbody>
                        </table>

                        <button id="crateManager" class="crateManager">관리자 신규 등록</button>
                    </div>

                    <table class="listTable">
                        <tbody>
                            <tr class="sortingOptionArea">
                                <td><button id="selectAll">선택</button></td>
                                <td><button id="sortByNo">번호</button></td>
                                <td><button id="sortByPermission">권한</button></td>
                                <td><button id="sortById">아이디</button></td>
                                <td><button id="sortByEmail">이메일</button></td>
                                <td><button id="sortByName">이름</button></td>
                                <td><button id="sortByTel">전화번호</button></td>
                                <td><button id="sortByApprovalReason">사유</button></td>
                                <td colspan="2"><button id="sortByApprovalStatus">결재</button></td>
                            </tr>

                            <c:forEach var="manager" items="${managerList}">
                                <tr class="listArea">
                                    <td><input type="checkbox" class="listCheck"></td>
                                    <td>${manager.managerNo}</td>
                                    <td>${manager.managerPermission}</td>
                                    <td>${manager.managerId}</td>
                                    <td>${manager.managerEmail}</td>
                                    <td>${manager.managerName}</td>
                                    <td>${manager.managerTel}</td>
                                    <td>${manager.managerSignUpReason}</td>
                                    <td><button class="confirm">승인</button></td>
                                    <td><button class="reject">반려</button></td>
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

    <script src="${pageContext.request.contextPath}/resources/js/admin/adminManager.js"></script>
</body>
</html>