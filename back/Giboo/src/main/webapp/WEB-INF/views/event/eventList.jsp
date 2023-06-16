<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/event/eventList.css">
      <!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css"> --> 
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
        integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://kit.fontawesome.com/50a1d35924.js" crossorigin="anonymous"></script>
        
     
    </head>
    <body>
        <header>
            <jsp:include page="/WEB-INF/views/main/header.jsp" />
        </header>

    
        <main>
            <!-- <section class="board-list">
                <h1 class="board-name">이벤트 목록</h1>
    
    
                <div class="list-wrapper">
                    <table class="list-table">
                        <thead>
                            <tr>
                                <th>상태</th>
                                <th>첨부파일</th>
                                <th>리스트 제목</th>
                                <th>등록일</th>
                                <th>마감일</th>
                                <th>참여자수</th>
                            </tr>
                        </thead>
                        
                        <%-- 채팅 목록 출력 --%>
                        <tbody>
                            <c:choose>
                            
                                <%-- 조회된 게시글 목록이 없을 때 --%>
                                <c:when test="${empty eventList }">
                                    <tr>
                                        <td colspan="6">존재하는 이벤트가 없습니다.</td>
                                    </tr>
                                </c:when>
                                
                                <%-- 조회된 채팅방 목록이 있을 때 --%>
                                <c:otherwise>
                                    
                                    <c:forEach var="eventList" items="${eventList}">
                                        <tr>
                                            <td>${eventList.result}</td>
                                            <td>${eventList.attachment}</td>
                                            <td>${eventList.eventTitle}</td>
                                            <td>${eventList.enrollDate}</td>
                                            <td>${eventList.endRecruitDate}</td>
                                            <td>${eventList.currentPeople}</td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </section> -->

            <div class="eventContent">
                <div class="eventBody">
                    <div class="eventList_main">
                        <div class="ewrap_tab">
                        </div>
                        <div class="egroup_catalog">
                            <c:choose>
                                <c:when test="${empty eventList}">
                                    <ul class="elist_official">
                                        <li class="elist_officialLi">
                                            <span>존재하는 이벤트가 없습니다.</span>
                                        </li>
                                    </ul>
                                </c:when>
                                <c:otherwise>
                                    <ul class="elist_official">
                                        <c:forEach var="eventList" items="${eventList}">
                                            <li class="elist_officialLi">  
                                                <a href="" class="elink_official">
                                                    <span class="earea_thumb">
                                                        <img src="${pageContext.request.contextPath}${eventList.attachment}" alt="썸네일이미지">

                                                        <div class="earea_thumb_period">
                                                            <span>${eventList.result}</span>
                                                        </div>
                                                    </span>
                                                    <span class="etxt_official">
                                                        <div class="etxt_officialTi">
                                                            <span>${eventList.eventTitle}</span>
                                                        </div>
                                                        <span class="edate_official">
                                                            <span class="escrean_out">${eventList.enrollDate}</span>
                                                            <span class="escrean_out">${eventList.endRecruitDate}</span>
                                                        </span>
                                                    </span>
                                                    <span class="ereg">
                                                        <span>✔️</span>
                                                        <span>${eventList.currentPeople}</span>
                                                        <span>참여중</span>
                                                        <span>${eventList.eventNo}</span>
                                                    </span>
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>


        <!-- <div class="eventContent">
            <div class="eventBody">
                <div class="eventList_main">
                    <div class="ewrap_tab">
                        <ul class="elist_tab">
                            <li class="eon">
                                <a href="" class="elink_tab">
                                    <span class="etxt_tab">전체</span>
                                </a>
                            </li>
                            <li class="eon">
                                <a href="" class="elink_tab">
                                    <span class="etxt_tab">진행중</span>
                                </a>
                            </li>
                            <li class="eon">
                                <a href="" class="elink_tab">
                                    <span class="etxt_tab">종료</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="egroup_catalog">
                        <ul class="elist_official">
                            <li>  
                                <a href="" class="elink_official">
                                    <span class="earea_thumb">
                                        <img src="${pageContext.request.contextPath}${eventList.attachment}" alt="썸네일이미지">
                                        <div class="earea_thumb_period">
                                            <span>종료<br>임박</span>
                                        </div>
                                    </span>
                                    <span class="etxt_official">
                                        <div class="etxt_officialTi">
                                            <span>
                                                강아지의 날! 행복한 강아지 만들기
                                            </span>
                                        </div>
                                        <span class="edate_official">
                                            <span class="escrean_out">
                                                2023.05.05 ~ 2023.06.07
                                            </span>
                                        </span>
                                    </span>
                                    <span class="ereg">
                                        <span>✔️ 5,023명 참여중</span>
                                    </span>
                                </a>
                            </li>
                            <li class="eother">
                                <a href="" class="elink_official_2">
                                    <span class="earea_thumb_2">
                                        <img src="${pageContext.request.contextPath}/resources/images/dogil.png" alt="썸네일이미지">
                                    </span>
                                    <span class="etxt_official_2">
                                        <span>강아지의 날! 이벤트</span>
                                    </span>
                                    <span class="ereg_2">
                                        <span>5,000명 달성</span>
                                    </span>
                                </a>
                                <div class="edetail">
                                    <a href="">
                                        <span>자세히보기</span>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="epnation">
                        <div class="epnation_wrap">
                            <button><</button>
                            <ul class="epnation_ul">
                                <li>1</li>
                                <li>2</li>
                                <li>3</li>
                                <li>4</li>
                                <li>5</li>
                                <li>6</li>
                                <li>7</li>
                            </ul>
                            <button>></button>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
    </main>
    
    <!-- 푸터 영역 -->
    <footer>
        <jsp:include page="/WEB-INF/views/main/footer.jsp" />
    </footer>

    </body>
    </html>