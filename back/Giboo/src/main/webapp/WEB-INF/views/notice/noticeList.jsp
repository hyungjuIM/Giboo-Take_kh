<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>notice</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice/noticeList.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/reset.css" />
   
  </head>
  <body>
    <header>
      <jsp:include page="/WEB-INF/views/main/header.jsp" />
    </header>
    
    <main>
      <div class="page-title">
        <span>공지사항</span>
      </div>
        <section class="mainContainer">
            <div class="mainContent">
              <section class="notice">
          
                <!-- notice seach area -->
                <div class="notice">
                  <div class="container1">
                    <span style="color: #767676;">Giboo&Take 서비스의</span><span style="color: #8071FC;"> 신규</span><span style="color: #767676;"> 및</span> <span style="color: #8071FC;"> 업데이트 소식</span><span style="color: #767676;">을 알려드립니다 😇</span>
                  </div>
                  <div class="nothing"></div>
          
                  <div class="container2">
                    <div class="search-area">
                      <div class="search-filter">
                        
                        <select id="filter" name="filter">
                          <option value="title">제목</option>
                          <option value="author">작성자</option>
                          <option value="views">조회수</option>
                          <option value="date">등록일</option>
                        </select>
                      </div>
                      
                      <form action="">
                        <fieldset>
                          <input type="text" id="query" name="query" placeholder="검색어를 입력해주세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '검색어를 입력해주세요'" >
                          <button type="submit" id="search-btn" class="fa-solid fa-magnifying-glass"></button>
                        </fieldset>
                      </form>
                    </div>
                  </div>
                </div>
          
                <!-- notice list area -->
                <div id="notice-list">
                  <div class="container3">
                    <table class="notice-table">
                      <thead>
                        <tr>
                          <th scope="col" class="th-num">번호</th>
                          <th scope="col" class="th-title">제목</th>
                          <th scope="col" class="th-date">등록일</th>
                          <th scope="col" class="th-name">작성자</th>
                          <th scope="col" class="th-count">조회수</th>
                        </tr>
                      </thead>
                      <tbody>
                       
                      
                        <tr>
                          <td>3</td>
                          <th><a href="#!">Giboo&Take공지사항입니다3</a></th>
                          <td>2023.05.24</td>
                          <td>임형주</td>
                          <td>50</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <th><a href="#!">Giboo&Take공지사항입니다2</a></th>
                            <td>2023.05.13</td>
                            <td>임형주</td>
                            <td>30</td>
                          </tr>
                          <tr>
                            <td>1</td>
                            <th><a href="#!">Giboo&Take공지사항입니다1</a></th>
                            <td>2023.05.03</td>
                            <td>임형주</td>
                            <td>30</td>
                          </tr>
                        <!-- 여러 개의 게시글 추가 -->

                      
                      </tbody>
                    </table>
                  </div>
                  <div class="container4">
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
                    <div class="writeBtn-container">
                    <button class="writeBtn" onclick="location.href='${pageContext.request.contextPath}/notice/noticeWrite'"><i class="fa-solid fa-pen"></i>_글쓰기</button>
                    </div>
                  </div>
                </div>
              </section>
            </div>
          </section>
          
    </main>

     <!-- 푸터 영역 -->
    <footer>
      <jsp:include page="/WEB-INF/views/main/footer.jsp" />
    </footer>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
    integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    
    
    
    <script src="https://kit.fontawesome.com/50a1d35924.js" crossorigin="anonymous"></script>
    </body>
</html>