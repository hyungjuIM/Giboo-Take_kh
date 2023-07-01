<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <c:set var="pagination" value="${map.pagination}" />
    <c:set var="eventList" value="${map.eventList}" />

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/event/eventList.css">
        
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
            <div class="eventContent">
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
                                                <a href="../event/eventDetailMain/${eventList.eventNo}?cp=${pagination.currentPage}${sURL}" class="elink_official">
                                                    <span class="earea_thumb">
                                                        <img src="${pageContext.request.contextPath}${eventList.attachment}" alt="썸네일이미지">

                                                        <div class="earea_thumb_period ${eventList.result}">
                                                            <span>${eventList.result}</span>
                                                        </div>
                                                    </span>
                                                    <span class="etxt_official">
                                                        <div class="etxt_officialTi">
                                                            <span>${eventList.eventTitle}</span>
                                                        </div>
                                                        <span class="edate_official">
                                                            <span class="escrean_out">${eventList.enrollDate}</span>
                                                            <span class="escrean_out">~</span>
                                                            <span class="escrean_out">${eventList.endRecruitDate}</span>
                                                        </span>
                                                    </span>
                                                    <span class="ereg">
                                                        <span>✔️</span>
                                                        <span>${eventList.eventPersonCount}</span>
                                                        <span>명 참여중</span>
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

            <div class="event-pagination-area">
                <c:set var="url" value="?cp="/>

                <ul class="event-pagination">
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
            </div>
    </main>
    
    <footer>
        <jsp:include page="/WEB-INF/views/main/footer.jsp" />
    </footer>

    </body>
    </html>