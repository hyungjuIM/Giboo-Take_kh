<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>noticeDetail</title>
   
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/noticeDetail.css" />
</head>
<body>
    <header>
        <div data-include1="header" id="header"></div>
    </header>
    

    <section class="mainContainer">
        <div class="mainContent">
            <!-- 제목 부분 컨테이너 -->
            <div class="notice-container1">
                <h1 class="noticeTitle">${noticeDetail.noticeTitle}</h1>
            </div>

            <!-- 본문쪽 컨테이너 -->
            <div class="notice-container2">

                <!-- 작성자, 작성일, 수정일, 조회수 컨테이너 -->
                <div class="notice-container3">
                    <!-- 작성자 -->
                    <div class="board-writer">
                        <p><span>작성자 :</span>  ${noticeDetail.managerNickname}</p>
                    </div>

                    <!-- 작성일,수정일,조회수 -->
                    <div class="board-info">
                        <p><span>작성일 :</span> ${noticeDetail.ncreateDT} </p>
                        <!-- if문통해 수정일 추가해야함 -->
                        <c:if test="${!empty noticeDetail.nupdateDT"}>
                            <p><span>수정일 :</span> ${noticeDetail.nupdateDT}</p>
                        </c:if>
                    </div>
                    <div class="readCount">    
                        <p><span>조회수 :</span> ${noticeDetail.noticeCount}</p>
                    </div>

              
                </div>
               

                <!-- 본문 컨테이너 -->
                <div class="notice-container4">
                    <div class="board-contnent">
                    ${noticeDetail.noticeContent}    
                    </div>
                </div>

                <!-- 수정 삭제 컨테이너 -->
                <div class="notice-container5">
                    <!-- 관리자계정일 때만이라는 if문 추가해야함 -->
                <c:if test="${loginManager.managerNo == noticeDetail.managerNo}">
                
                <!-- <%-- cp가 없을 경우에 대한 처리 --%> -->
                <c:if test="${empty param.cp}">
                    <!-- 파라미터에 cp가 없을 경우 1 -->
                    <c:set var="cp" value="1" />
                </c:if>

                <c:if test="${!empty param.cp}">
                    <!-- 파라미터에 cp가 있을 경우 param.cp -->
                    <c:set var="cp" value="${param.cp}" />
                </c:if>

                <!-- 수정 -->
                    <button class="updateBtn" id="updateBtn" onclick="location.href='../../noticeWrite/?mode=update&cp=${cp}&no=${noticeDetail.noticeNo}'">수정</button>
                    <button class="deleteBtn">삭제</button>

                </c:if>
                </div>
            </div>



        </div>
    </section>


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
</body>
</html>