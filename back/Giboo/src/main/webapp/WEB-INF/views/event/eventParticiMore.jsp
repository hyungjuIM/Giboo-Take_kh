<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<div class="eParMoreTitle">
	<span>🥰함께하고 있어요</span>
</div>
<div class="eParMoreList">
	<c:choose>
		<c:when test="${empty eventDetailMember}">
			<ul class="edDoPersonUl">
				<li class="edDoPersonLi"><span>참여자가 없습니다.</span></li>
			</ul>
		</c:when>
		<c:otherwise>
			<div class="swiper-container first">
			<div class="swiper-wrapper parWrapper">
				<c:forEach var="eventDetailMember" items="${eventDetailMember}">
					
						<div class="swiper-slide">
							<div class="edDoPerImg"> <c:if
									test="${empty eventDetailMember.profileImg}">
									<span>🥰</span>
								</c:if> <c:if test="${!empty eventDetailMember.profileImg}">
									<img
										src="${pageContext.request.contextPath}${eventDetailMember.profileImg}"
										alt="">
								</c:if>
							</div>
							<div class="edPersonName">
								<span>${eventDetailMember.memberNick}</span> <span>님</span>
							</div>
						</div>
					

				</c:forEach>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<div class="do_next_prev_btn1">
		<span class="swiper-button-prev1 do_prev">
		<img src="${pageContext.request.contextPath}/resources/images/arrow-left-long-solid.svg">
		</span> 
		<span class="swiper-button-next1 do_next">
		<img src="${pageContext.request.contextPath}/resources/images/arrow-right-long-solid.svg">
		</span>
	</div>
</div>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">


