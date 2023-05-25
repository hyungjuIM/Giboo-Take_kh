<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>notice</title>
    <link rel="stylesheet" href="/css/notice/notice.css">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
    integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <header>
        <div data-include1="header" id="header"></div>
    </header>
    
    <main>
        <section class="mainContainer">
            <div class="mainContent">
              <section class="notice">
                <div class="page-title">
                  <img src="로고가 들어가면딱" alt="">
                </div>
          
                <!-- board seach area -->
                <div class="board">
                  <div class="container1">
                    <h3>공지사항</h3>
                  </div>
                  <div class="nothing"></div>
          
                  <div class="container2">
                    <div class="search-area">
                      <form action="">
                        <fieldset>
                          <button type="submit" id="search-btn" class="fa-solid fa-magnifying-glass"></button>
                          <input type="text" id="query" name="query" placeholder="검색어를 입력해주세요">
                        </fieldset>
                      </form>
                    </div>
                  </div>

                  <c:if test="${!empty loginManager}">
                    
                    <button id="insertBtn" class="insertBtn" onclick="location.href='../noticeWrite/?mode=insert&cp=${pagination.currentPage}'">글쓰기</button>                     
                </c:if>
                  
                </div>
          
                <!-- board list area -->
                <div id="board-list">
                  <div class="container3">
                    <table class="board-table">
                      <thead>
                        <tr>
                          <th scope="col" class="th-num">번호</th>
                          <th scope="col" class="th-title">제목</th>
                          <th scope="col" class="th-date">등록일</th>
                          <th scope="col" class="th-name">작성자</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:choose>
                        <c:when test="${empty noticeList}">
                          <tr>
                            <th colspan="5">공지사항이 없습니다.</th>
                          </tr>
                        </c:when>
    
                        <c:otherwise>
                      
                        <c:forEach var="notice" items="${noticeList}">
                          <tr>
                            <td>${notice.noticeNo}</td>
                            <td>
    
    
                              <a
                                href="../noticeDetail/${notice.noticeNo}?cp=${pagination.currentPage}${sURL}">${notice.noticeTitle}</a>
    
                            </td>                        
                            <td>${notice.ncreateDT}</td>
                            <td>${notice.noticeCount}</td>
                          </tr>
                        </c:forEach>
    
                        </c:otherwise>
                      
                        </c:choose>
                      </tbody>
                    </table>
          
                    <nav class="page-nav">
                      <ul class="pagination">
                        <li><a href="">&lt;</a></li>
                        <li><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">4</a></li>
                        <li><a href="">5</a></li>
                        <!-- 페이지 번호 추가 -->
                        <li><a href="">&gt;</a></li>
                      </ul>
                    </nav>
                  </div>
                </div>
              </section>
            </div>
          </section>
          
    </main>

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