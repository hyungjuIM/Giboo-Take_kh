<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    <div class="eMoreTitle">
        <span>🥰 진행중인 이벤트</span>
    </div>
    <div class="eMoreList">
        <div class="relatedItemListButtonArea">
            <button id="prev"><img src="${pageContext.request.contextPath}/resources/images/arrow-left-long-solid.svg"></button>
        </div>
        <c:choose>
            <c:when test="${empty eventMore}">
                <ul class="elist_official">
                    <li class="elist_official_li">
                        <span>진행중인 이벤트가 없습니다.</span>
                    </li>
                </ul>
            </c:when>
            <c:otherwise>
                <div class="elist_official">
                    <c:forEach var="eventMore" items="${eventMore}">
                        <div class="elist_official_li">  
                            <a href="../eventDetailMain/${eventMore.eventNo}?cp=${pagination.currentPage}${sURL}" class="elink_official">
                                <span class="earea_thumb">
                                    <img src="${pageContext.request.contextPath}${eventMore.attachment}" alt="썸네일이미지">
                                    <div class="earea_thumb_period_go">
                                        <span>${eventMore.result}</span>
                                    </div>
                                </span>
                                <span class="etxt_official">
                                    <div class="etxt_officialTi">
                                        <span>${eventMore.eventTitle}</span>
                                    </div>
                                    <span class="edate_official">
                                        <span class="escrean_out">${eventMore.enrollDate}</span>
                                        <span class="escrean_out">~</span>
                                        <span class="escrean_out">${eventMore.endRecruitDate}</span>
                                    </span>
                                </span>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
        <div class="relatedItemListButtonArea">
            <button id="next"><img src="${pageContext.request.contextPath}/resources/images/arrow-right-long-solid.svg"></button>
        </div>
    </div>
    <div class="eMoreBtn">
            <button class="eMoreBtnBox">
                <span>&dbkarow;</span>
                <span>이벤트 더보기</span>
            </button>
    </div>

 --%>