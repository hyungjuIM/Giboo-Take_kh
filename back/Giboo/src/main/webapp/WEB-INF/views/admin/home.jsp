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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css">
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/main/header.jsp" />
    </header>


    <section class="mainContainer">
        <div class="menuName">대쉬보드</div>

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
                    <li class="sideMenuItem"><a href="${pageContext.request.contextPath}/notice/noticeList">공지사항 관리</a></li>
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

                    <div class="managerNotificationArea">
                        <div class="managerNotificationTitle">알림</div>
                        <table class="managerNotification">
                            <tr>
                                <td>고객센터</td>
                                <td>로그인에러</td>
                            </tr>
                            <tr>
                                <td>고객센터</td>
                                <td>탈퇴 안됨</td>
                            </tr>
                            <tr>
                                <td>봉사 관리</td>
                                <td>봉사 결재 대기중</td>
                            </tr>
                            <tr>
                                <td>기부 관리</td>
                                <td>기부 결재 대기중</td>
                            </tr>
                            <tr>
                                <td>이벤트 관리</td>
                                <td>이벤트 결재 대기중</td>
                            </tr>
                        </table>
                    </div>

                    <div class="menuButtonArea">
                        <div class="menuButtonLine1">
                            <a href="${pageContext.request.contextPath}/admin/member" class="menuButton">
                                <div>🥰</div>
                                <div>회원 관리</div>
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/manager" class="menuButton">
                                <div>🚧</div>
                                <div>관리자 관리</div>
                            </a>
                            <a href="${pageContext.request.contextPath}/notice/noticeList" class="menuButton">
                                <div>📢</div>
                                <div>공지사항 관리</div>
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/chat" class="menuButton">
                                <div>💬</div>
                                <div>1 대 1 채팅상담</div>
                            </a>
                        </div>

                        <div class="menuButtonLine2">
                            <a href="${pageContext.request.contextPath}/admin/volunteerDonation" class="menuButton">
                                <div>🕊️</div>
                                <div>기부 / 봉사 관리</div>
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/event" class="menuButton">
                                <div>🎉</div>
                                <div>이벤트 관리</div>
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/category" class="menuButton">
                                <div>🗂️</div>
                                <div>카테고리 관리</div>
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/faq" class="menuButton">
                                <div>🤔</div>
                                <div>자주 찾는 질문 관리</div>
                            </a>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </section>

    <footer>
        <jsp:include page="/WEB-INF/views/main/footer.jsp" />
    </footer>

    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
</body>
</html>