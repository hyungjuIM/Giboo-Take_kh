<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>adminManager</title>
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
                    <li class="sideMenuItem"><a href="">대쉬보드</a></li>
                    <li class="sideMenuItem"><a href="">회원 관리</a></li>
                    <li class="sideMenuItem"><a href="">관리자 관리</a></li>
                    <li class="sideMenuItem"><a href="">공지사항 관리</a></li>
                    <li class="sideMenuItem"><a href="">1 대 1 채팅 상담</a></li>
                    <li class="sideMenuItem"><a href="">기부 / 봉사 관리</a></li>
                    <li class="sideMenuItem"><a href="">이벤트 관리</a></li>
                    <li class="sideMenuItem"><a href="">카테고리 관리</a></li>
                    <li class="sideMenuItem"><a href="">자주 찾는 질문 관리</a></li>
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

                            <tr class="listArea">
                                <td><input type="checkbox" id="listCheck1" class="listCheck"></td>
                                <td>1</td>
                                <td>마스터</td>
                                <td>123451234512</td>
                                <td>video0w@icloud.com</td>
                                <td>김김김김</td>
                                <td>010-0000-0000</td>
                                <td>신규 등록</td>
                                <td><button id="confirm1" class="confirm">승인</button></td>
                                <td><button id="reject1" class="reject">반려</button></td>
                                <td><button id="detail1" class="detail">상세 정보</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
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
                $(this).load('/html/01.header.html');
            });
        });

    </script>

    <script src="${pageContext.request.contextPath}/resources/js/admin/adminManager.js"></script>
</body>
</html>