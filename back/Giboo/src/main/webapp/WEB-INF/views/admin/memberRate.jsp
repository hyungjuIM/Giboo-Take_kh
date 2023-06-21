<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>adminMember</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminRateMember.css">
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/main/header.jsp" />
    </header>


    <section class="mainContainer">
        <div class="menuName">등급 관리</div>

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
                  
                    <table class="listTable">
                        <tbody>
                            <tr class="sortingOptionArea">
                                <td><button id="selectAll">선택</button></td>
                                <td><button id="sortByNo">번호</button></td>
                                
                                <td><button id="sortById">아이디</button></td>
                                <td><button id="sortByEmail">이메일</button></td>
                                <td><button id="sortByName">이름</button></td>
                                
                                <td><button id="sortByEnrollDate">등급</button></td>
                                <td><button id="sortBySavedMoney">적립금</button></td>
                            </tr>

                            <c:forEach var="member" items="${memberRateList}">
                                <tr class="listArea">
                                    <td><input type="checkbox" class="listCheck"></td>
                                    <td>${member.memberNo}</td>                                    
                                    <td>${member.memberId}</td>
                                    <td>${member.memberEmail}</td>
                                    <td>${member.memberName}</td>
                                    
                                    <td class="rateName" name="rateName">${member.rateName}</td>
                                    <td class="pointPrice" name="pointPrice">${member.pointPrice}</td>
                                    <td><button class="detail">상세 정보</button></td>
                                </tr>
                            </c:forEach>

                           
                        </tbody>
                    </table>
                    <button type="button" class="updatebtn" id="updatebtn" name="updatebtn">등급 업데이트</button>
                
                </div>
            </div>
        </div>
    </section>

    <footer>
        <jsp:include page="/WEB-INF/views/main/footer.jsp" />
    </footer>
    <script src="${pageContext.request.contextPath}/resources/js/admin/updateMemberRate.js"></script>

</body>
</html>