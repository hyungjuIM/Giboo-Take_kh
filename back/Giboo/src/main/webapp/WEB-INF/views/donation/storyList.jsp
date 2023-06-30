<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <c:set var="pagination" value="${map.pagination}" />
    <c:set var="storyList" value="${map.storyList}" />

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>기부이야기</title>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/donation/storyList.css" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/reset.css" />

    </head>

    <body>
      <header>
        <jsp:include page="/WEB-INF/views/main/header.jsp" />
      </header>

      <main>
        <div class="page-title">
          <span>기부이야기</span>
        </div>
        <section class="mainContainer">
          <div class="mainContent">
            <section class="notice">

              <!-- notice seach area -->
              <div class="notice">
                <div class="container1">
                  <span style="color: #767676;">Giboo&Take 서비스의</span><span style="color: #8071FC;"> 신규</span><span
                    style="color: #767676;"> 및</span> <span style="color: #8071FC;"> 업데이트 소식</span><span
                    style="color: #767676;">을 알려드립니다 😇</span>
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
                        <input type="text" id="query" name="query" placeholder="검색어를 입력해주세요"
                          onfocus="this.placeholder = ''" onblur="this.placeholder = '검색어를 입력해주세요'">
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

                      <c:choose>
                        <c:when test="${empty storyList}">
                          <tr>
                            <td colspan="5">게시글이 존재하지 않습니다.</td>
                          </tr>
                        </c:when>
                        <c:otherwise>
                          <c:forEach var="story" items="${storyList}">
                            <tr>
                              <td>${story.donationStoryNo}</td>
                              <td><a
                                  href="../donation/story/${story.donationStoryNo}?cp=${pagination.currentPage}${sURL}">${story.donationStoryTitle}</a>
                              </td>
                              <td>${story.enrollDt}</td>
                              <td>${story.memberNick}</td>
                              <td>${story.viewCount}</td>
                            </tr>

                          </c:forEach>
                        </c:otherwise>
                      </c:choose>





                    </tbody>
                  </table>
                </div>
                <div class="container4">
                  <nav class="page-nav">
                    <c:set var="url" value="?cp=" />
                    <ul class="pagination">
                      <li><a href="${url}1${sURL}">&lt;&lt;</a></li>
                      <li><a href="${url}${pagination.prevPage}${sURL}">&lt;</a></li>
                      <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                        <c:choose>
                          <c:when test="${i == pagination.currentPage}">
                            <li><a class="current">${i}</a></li>
                          </c:when>

                          <c:otherwise>
                            <li><a href="${url}${i}${sURL}">${i}</a></li>
                          </c:otherwise>
                        </c:choose>

                      </c:forEach>

                      <li><a href="${url}${pagination.nextPage}${sURL}">&gt;</a></li>
                      <li><a href="${url}${pagination.maxPage}${sURL}">&gt;&gt;</a></li>
                    </ul>
                  </nav>
                 
                  <div class="writeBtn-container">
                    <c:if test="${!empty loginMember}">
                    <button class="writeBtn"
                      onclick="location.href='${pageContext.request.contextPath}/donation/write?mode=insert&cp=${pagination.currentPage}'"><i
                        class="fa-solid fa-pen"></i>_글쓰기</button>
                      </c:if>
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