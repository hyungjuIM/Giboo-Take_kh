<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
            <div class="edWrapBox">
                <div class="edWrap">
                    <div class="eFavBtn" id="eFavBtn">
                        <div class="dFavDiv">
                            <span class="dFavSpan">❤️</span>
                        </div>
                    </div>
                    <img src="${pageContext.request.contextPath}${eventDetailTop.attachment}" alt="">
                </div>
                <div class="edWrapDetail">
                    <div class=edWrapPeriod>
                        <div class="edWrapPeriodSpan">
                            <span>${eventDetailTop.result}</span>
                            <span>일 남음</span>
                        </div>
                    </div>
                    <div class="edWrapTitle">
                        <span>${eventDetailTop.eventTitle}</span>
                    </div>
                    <%-- ====================================== --%>
                    <div class="progressArea">
                        <div class="progressInfo">
                            <span class="progressPercentage">${eventDetailTop.percent}%</span>
                                <span class="goal">
                                    목표
                                    <span class="goal" id="goalValue">${eventDetailTop.targetPeople}</span>명
                            </span>
                        </div>

                        <div class="progressBar">
                             <div class="progressBarValue" style="width: ${Math.min(eventDetailTop.percent.longValue(), 100)}%"></div>
                        </div>

                        <div class="progressStatus">
                            <span>
                                <img src="${pageContext.request.contextPath}/resources/images/comment-regular.svg">
                                <span id="volunteerCount">${eventDetailTop.eventPersonCount}</span>명 참여중</span>
                            <span class="fav">
                                <img src="${pageContext.request.contextPath}/resources/images/heart-regular.svg">
                                <span id="recommendedCount">${eventDetailTop.eventFavCount}</span>명 추천</span>
                        </div>
                    </div>
                    
                    
                    <div class="edWrapBar">
                        <%--  <div class="edDoBar">
                            <progress value="${eventDetailTop.eventPersonCount}" max="${eventDetailTop.targetPeople}"></progress>
                        </div>
                        <div class="edWrapBar_2">
                            <div class="edVolDo">
                                <span>❤️</span>
                                <span>${eventDetailTop.eventPersonCount}</span>
                                <span>명 참여중</span>
                            </div>
                            <div class="edVolDo">
                                <span>${eventDetailTop.targetPeople}</span>
                                <span>명 목표</span>
                            </div>
                        </div>  --%>
                        
                    </div>
                    <div class="edDoTo">
                        <div class="edDoTitle">
                            <span>함께하고 있어요 😋</span>
                        </div>
                        <div class="edDoPerson">
                            <c:choose>
                                <c:when test="${empty eventDetailMember}">
                                    <ul class="edDoPersonUl">
                                        <li class="edDoPersonLi">
                                            <span>참여자가 없습니다.</span>
                                        </li>
                                    </ul>
                                </c:when>
                                <c:otherwise>
                                    <ul class="edDoPersonUl">
                                        <c:forEach var="eventDetailMember" items="${eventDetailMember}">
                                            <li class="edDoPersonLi">
                                                <div class="edDoPerImg">                        
                                                    <c:if test="${empty eventDetailMember.profileImg}">
                                                        <span>🥰</span>
                                                    </c:if>
                                                    <c:if test="${!empty eventDetailMember.profileImg}">
                                                        <img src="${pageContext.request.contextPath}${eventDetailMember.profileImg}" alt="">
                                                    </c:if>
                                                </div>
                                                <div class="edPersonName">
                                                    <span>${eventDetailMember.memberNick}</span>
                                                    <span>님</span>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <%--     ============================== --%>
                    <div class="eParMoreWrap">
           				 <div class="eParMoreBox">
                			<jsp:include page="/WEB-INF/views/event/eventParticiMore.jsp" />
           				 </div>
        			</div>
                	<%-- ============================== --%>
                    
                    
                    
                    <div class="edBtn">
                        <div class="edBtnDe memberChange_bottom">
                            <button id="popupButton" class="memberChange_b">이벤트 함께하기</button>                        
                        </div>
                                                
                        <div class="edStamp">
                            <div class="edStampPopup">
                                <div class="edStampPopDe">
                                    <span>참여하고 스템프 받아요!</span>
                                </div>
                            </div>
                            <a href="">
                                <div class="edStampBtn">
                                    <span>🥰</span>
                                </div>
                            </a>
                        </div>
                    </div> 
                </div>
            </div>






