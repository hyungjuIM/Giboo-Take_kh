<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<div class="eParMoreTitle">
	<span>🥰함께하고 있어요</span>
</div>
<div class="swiper-container eParMoreList">
	
	<%--  <div class="Par_relatedItemListButtonArea">
		<button id="prev1">
			<img
				src="${pageContext.request.contextPath}/resources/images/arrow-left-long-solid.svg">
		</button>
	</div>  --%>
	<c:choose>
		<c:when test="${empty eventDetailMember}">
			<ul class="edDoPersonUl">
				<li class="edDoPersonLi"><span>참여자가 없습니다.</span></li>
			</ul>
		</c:when>
		<c:otherwise>
			<div class="swiper-container edDoPersonUl">
				<c:forEach var="eventDetailMember" items="${eventDetailMember}">
				<div class="swiper-wrapper">
					<div class="swiper-slide edDoPersonLi">
						<span class="edDoPerImg"> 
							<c:if test="${empty eventDetailMember.profileImg}">
                                <span>🥰</span>
                            </c:if>
                            <c:if test="${!empty eventDetailMember.profileImg}">
                                <img src="${pageContext.request.contextPath}${eventDetailMember.profileImg}" alt="">
                            </c:if>
						</span>
						<div class="edPersonName">
						<span>${eventDetailMember.memberNick}</span>
                         <span>님</span>
						</div>
						</div>
					</div>
					
				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
	<div class="do_next_prev_btn">
                    <span class="swiper-button-prev do_prev">prev</span>
                    <span class="swiper-button-next do_next">next</span>
                </div>
	<%--   <div class="Par_relatedItemListButtonArea">
		<button id="next1">
			<img
				src="${pageContext.request.contextPath}/resources/images/arrow-right-long-solid.svg">
		</button>
	</div> --%>
	
</div>


