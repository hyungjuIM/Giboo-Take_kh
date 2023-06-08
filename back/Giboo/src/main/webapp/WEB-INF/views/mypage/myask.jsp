<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>나의문의내역</title>

  <!-- jQuery 라이브러리 추가 -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/myask.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/reset.css">



  <!-- fontawesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
    integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

  
</head>

<body>
  <!-- 헤더 영역 -->
  <header>
    <jsp:include page="/WEB-INF/views/main/header.jsp" />
</header>

  <main>
    <div class="page-title">
      <span>나의 문의내역</span>
    </div>

    <div class="mypage-container">
      <div class="mypage_wrapper"> <!-- 1200*800 -->
        
        
          <!--왼쪽 네비바 틀-->
          <nav class="mypage_nav_area">
              <div class="mypage_summary_container">
    
                <div class="mypage_profileEmojiContainer">
                  <div class="mypage_profileEmojiTheme ">🥳</div>
                </div>
                <div class="mypage_hiuser">고마운분</div>
                <div class="userName">000님, 안녕하세요🥳 </div>
    
    
                <!--왼쪽 네비바 메뉴 -->
                <nav class="mypage_content_container">
                  <ul class="mypage_content_first">
                    <li><a href="#">회원정보수정</a></li>
                    
                    <li><a href="#">즐겨찾기</a></li>
                    <li><a href="#">적립금</a></li>
                  </ul>
                  <hr>
                  <div class="mypage_content_second">
                    <ul>
                      <li><a href="../myPage/myactive.html">나의 활동</a></li>
                      <li><a href="../myPage/myask.html">나의 문의</a></li>
                    </ul>
                  </div>
                  <hr>
                  <div class="mypage_content_third">
                    <button>로그아웃</button>
                  </div>
                </nav> <!--mypage_content_container-->
              </div> <!-- mypage_summary_container-->
            </nav> <!--mypage_nav_area-->
    

        <!--오른쪽 나의 문의내역 본문-->
        <div class="myask_content_area">
          <section class="myask_mainContainer">
            <div class="myask_mainContent">
              <section class="myask_notice">

                <!-- notice seach area -->
                <div class="myask_notice">
                  <div class="myask_container1">
                    <span style="color: #767676;">Giboo&Take에</span><span style="color: #8071FC;"> 문의한 내역</span><span
                      style="color: #767676;">을 알려드립니다 😇</span>

                    <div class="myask_container2">
                      <div class="myask_search-area">
                        <div class="myask_search-filter">

                          <select id="filter" name="filter">
                            <option value="title">제목</option>
                            <option value="author">작성자</option>
                            <option value="views">조회수</option>
                            <option value="date">등록일</option>
                          </select>
                        </div>

                        <form action="">
                          <fieldset>
                            <input type="text" id="myask_query" name="myask_query" placeholder="검색어를 입력해주세요"
                              onfocus="this.placeholder = ''" onblur="this.placeholder = '검색어를 입력해주세요'">
                            <button type="submit" id="search-btn" class="fa-solid fa-magnifying-glass"></button>
                          </fieldset>
                        </form>
                      </div>

                    </div>



                  </div>
                </div>

                <!-- notice list area -->
                <div id="myask_notice-list">
                  <div class="myask_container3">
                    <table class="myask_notice-table">
                      <thead>
                        <tr>
                          <th scope="col" class="th-num">번호</th>
                          <th scope="col" class="th-name">분류</th>
                          <th scope="col" class="th-title">제목</th>
                          <th scope="col" class="th-date">작성일</th>
                          <th scope="col" class="th-status">진행상태</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>6</td>
                          <td>기부>어르신</td>
                          <td><a href="#!">기부를 했을 때 연말정산에 반영되나요?</a></td>
                          <td>2023.05.24</td>
                          <td><span style="color: #8071FC;">미답변</span></td>
                        </tr>
                        <tr>
                          <td>5</td>
                          <td>기부>어린이</td>
                          <td><a href="#!">어린이 기부를 할 때 소아암 환우에게 하고 싶은데 방법이 있나요?</a></td>
                          <td>2023.05.05</td>
                          <td>답변완료</td>
                        </tr>
                        <td>4</td>
                        <td>기부>장애인</td>
                        <td><a href="#!">기부할 때 최대금액 정해져 있나요?</a></td>
                        <td>2023.05.05</td>
                        <td>답변완료</td>
                        </tr>
                        <td>3</td>
                        <td>기부>장애인</td>
                        <td><a href="#!">장애인 봉사활동이 처음인데 가능한가요?</a></td>
                        <td>2023.05.01</td>
                        <td>답변완료</td>
                        </tr>
                        <td>2</td>
                        <td>봉사>어르신</td>
                        <td><a href="#!">독거노인 봉사활동을 하고 싶은데, </a></td>
                        <td>2023.04.01</td>
                        <td>답변완료</td>
                        </tr>
                        <td>1</td>
                        <td>봉사>어르신</td>
                        <td><a href="#!">연탄봉사 활동은 겨울에만 가능한가요?</a></td>
                        <td>2023.001.01</td>
                        <td>답변완료</td>
                        </tr>


                        <!-- 여러 개의 게시글 추가 -->

                      </tbody>
                    </table>
                  </div>
                  <div class="myask_container4">
                    <nav class="myask_page-nav">
                      <ul class="myask_pagination">
                        <li><a href="">&lt;</a></li>
                        <li><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">4</a></li>
                        <li><a href="">5</a></li>
                        <li><a href="">6</a></li>
                        <li><a href="">7</a></li>
                        <!-- 페이지 번호 추가 -->
                        <li><a href="">&gt;</a></li>
                      </ul>
                    </nav>
                    <div class="myask_writeBtn-container">
                      <button type="button" class="myask_writeBtn"><i class="fa-solid fa-pen"></i>_글쓰기</button>
                    </div>
                  </div>
                </div>
              </section>
            </div>
          </section>

        </div> <!-- myask_content_area -->

      </div> <!-- mypage_wrapper -->
    </div> <!-- mypage-container -->
  </main>


  <!-- 푸터 영역 -->
  <header>
    <jsp:include page="/WEB-INF/views/main/footer.jsp" />
</header>

  </script>
</body>

</html>