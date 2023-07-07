<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="donationList" value="${map.donationList}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>hunny</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/donation/donationDetail.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slick/slick.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slick/slick-theme.css">

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

</head>
<body>

	<header>
		<jsp:include page="/WEB-INF/views/main/header.jsp" />
	</header>

	<div class="mainCategoryArea">
		<div class="mainCategoryInner">
			<a href="${pageContext.request.contextPath}/donation/home"
				class="mainCategoryItem mainCategoryChecked" id="home">기부 진행중</a> <a
				href="${pageContext.request.contextPath}/donation/storyList"
				class="mainCategoryItem" id="story">기부이야기</a>
		</div>
	</div>

	<section class="mainContainer">
		<div class="mainContent">

			<div class="infoArea">
				<img class="thumbnail"
					src="${pageContext.request.contextPath}${donationDetail.donationAttachment}">

				<div class="info">
					<div class="tag">
						<span class="hot">HOT</span> <span class="d-day">D-<span
							id="d-day">${donationDetail.DDay}</span>일
						</span>
					</div>
					<div class="title">${donationDetail.donationTitle}</div>

					<div class="progressArea">
						<div class="progressInfo">
							<span class="progressPercentage">${donationDetail.percent}%</span>
							<span class="goal"> 목표 <span class="goal" id="goalValue">${donationDetail.targetAmount}</span>원
							</span>
						</div>

						<div class="progressBar">
							<div class="progressBarValue"
								style="width: ${donationDetail.percent}%"></div>
						</div>

						<div class="progressStatus">
							<span> <img
								src="${pageContext.request.contextPath}/resources/images/comment-regular.svg">
								<span id="donationCount">1,030</span>명 참여중
							</span> <span> <img
								src="${pageContext.request.contextPath}/resources/images/heart-regular.svg">
								<span id="recommendedCount">102</span>명 추천
							</span>
						</div>
					</div>

					<div class="description">기부금 전액 올무에 패인 상처가 평생 낫지 않는 길고양이 1마리의
						3개월 치료비와 1년 사료비를 지원합니다.</div>

					<button class="donationButton" onclick="clickPayButton()">모금함
						기부하기</button>
				</div>
			</div>

			<section class="contentArea">
				<div class="content">
					<c:out value="${donationDetail.donationContent}" escapeXml="false" />
				</div>

				<div class="nav">
					<div class="agencyInfoArea">
						<div class="agencyInfo">
							<img class="agencyImg"
								src="${pageContext.request.contextPath}/resources/images/dog_emoji.png">
							<div class="agencyInfoInner">
								<div class="division">모금단체</div>
								<div class="agencyName">${donationDetail.agencyName}</div>
							</div>
						</div>

						<div class="agencyDescription">
							존엄한 생명으로서 그들의 본연의 삶을 영위하고,<br> 모든 생명의균형과 조화 속에 공존하는 세상을
							지향합니다.
						</div>
						<a class="agencyLink" href="">사이트 방문하기 <img
							class="agencyLinkImg"
							src="${pageContext.request.contextPath}/resources/images/chevron-right-solid.svg"></a>
					</div>

					<div class="commentArea">
						<div class="">
							<img class="commentTitleImg iconImg"
								src="${pageContext.request.contextPath}/resources/images/comment-regular.svg">
							<span id="name">마리</span>에게 응원의 메시지를 남겨주세요
						</div>
						<div class="commentItem">
							<div class="memberImgArea">
								<img id="memberImg1" class="memberImg"
									src="${pageContext.request.contextPath}/resources/images/dog_emoji.png">
							</div>

							<div class="commentInner">
								<div id="memberName1" class="memberName">유저1</div>
								<div id="comment1" class="comment">123456789</div>
							</div>
						</div>

						<div class="commentItem">
							<div class="memberImgArea">
								<img id="memberImg2" class="memberImg"
									src="${pageContext.request.contextPath}/resources/images/dog_emoji.png">
							</div>

							<div class="commentInner">
								<div id="memberName2" class="memberName">유저1</div>
								<div id="comment2" class="comment">123456789</div>
							</div>
						</div>

						<div class="commentItem">
							<div class="memberImgArea">
								<img id="memberImg3" class="memberImg"
									src="${pageContext.request.contextPath}/resources/images/dog_emoji.png">
							</div>

							<div class="commentInner">
								<div id="memberName3" class="memberName">유저1</div>
								<div id="comment3" class="comment">123456789</div>
							</div>
						</div>

						<button class="commentSubmit">응원하기</button>
						<div class="commentInfo">
							<img
								src="${pageContext.request.contextPath}/resources/images/comment-regular.svg">
							<div class="commentCount">
								<span id="commentCount">1,030</span> 명 응원
							</div>
							<img
								src="${pageContext.request.contextPath}/resources/images/share-from-square-regular.svg">
							<span id="shareCount">508</span> <span>명 공유</span>
						</div>
					</div>
					<div class="modify_tag_box">
						<a class="modify_tag"
							href="${pageContext.request.contextPath}/donation/write?mode=update&no=${donationDetail.donationNo}">수정</a>
					</div>
				</div>
			</section>
<%-- 
			<section class="relatedArea">

				<div class="relatedTitle">관련된 동물 기부</div>

				<div class="relatedAreaInner">

					<div class="relatedItemListButtonArea">
						<button id="prev" class="do_button">
							<img
								src="${pageContext.request.contextPath}/resources/images/arrow-left-long-solid.svg">
						</button>

						<button id="next" class="do_button">
							<img
								src="${pageContext.request.contextPath}/resources/images/arrow-right-long-solid.svg">
						</button>

					</div> --%>

					<!-- 하단 이미지  -->

					<%-- <div class="relatedItemList">

						<div class="relatedItem">
							<a class="reatedImg_box" href=""> <img class="relatedImg"
								src=" ${pageContext.request.contextPath}/resources/images/220726-cat-theo-elise-ew-636p-6cd3b0.webp">
								<div class="relatedItemTitle">타이틀</div>
							</a>

							<div class="relatedItemStatus">
								<span> <img
									src="${pageContext.request.contextPath}/resources/images/comment-regular.svg">
									<span>1,030</span>명 참여중
								</span> <span> <img
									src="${pageContext.request.contextPath}/resources/images/heart-regular.svg">
									<span>102</span>명 추천
								</span>
							</div>
						</div> --%>


						<%-- 	<div class="relatedItem">

						<div class="relatedItem">
							<a href=""> <img id="relatedImg3" class="relatedImg"
								src="${pageContext.request.contextPath}/resources/images/all-about-tabby-cats-552489-hero-a23a9118af8c477b914a0a1570d4f787.jpg">
								<div class="relatedItemTitle">타이틀</div>
							</a>
							<div class="relatedItemStatus">
								<span> <img
									src="${pageContext.request.contextPath}/resources/images/comment-regular.svg">
									<span id="relateddonationCount3">1,030</span>명 참여중
								</span> <span> <img
									src="${pageContext.request.contextPath}/resources/images/heart-regular.svg">
									<span id="relatedRecommendedCount3">102</span>명 추천
								</span>
							</div>
						</div>

						<div class="relatedItem">
							<a href=""> <img id="relatedImg4" class="relatedImg"
								src="${pageContext.request.contextPath}/resources/images/1E3A3E62-B3CA-434A-8C3B3ED0C982FB69_source.webp">
								<div class="relatedItemTitle">타이틀</div>
							</a>
							<div class="relatedItemStatus">
								<span> <img
									src="${pageContext.request.contextPath}/resources/images/comment-regular.svg">
									<span id="relateddonationCount4">1,030</span>명 참여중
								</span> <span> <img
									src="${pageContext.request.contextPath}/resources/images/heart-regular.svg">
									<span id="relatedRecommendedCount4">102</span>명 추천
								</span>
							</div>
						</div>

						<div class="relatedItem"> --%>
					<%-- 	<a href=""> <img id="relatedImg5" class="relatedImg"
							src="${pageContext.request.contextPath}/resources/images/Cat_August_2010-4.jpg">
							<div class="relatedItemTitle">타이틀</div>
						</a>
						<div class="relatedItemStatus">
							<span> <img
								src="${pageContext.request.contextPath}/resources/images/comment-regular.svg">
								<span id="relateddonationCount5">1,030</span>명 참여중
							</span> <span> <img
								src="${pageContext.request.contextPath}/resources/images/heart-regular.svg">
								<span id="relatedRecommendedCount5">102</span>명 추천
							</span>
						</div>
					</div>

				</div>
		</div>

	</section>
 --%>


	<div class="grayBox" id="grayBox">
		<div class="donationContainer" id="donationContainer">
			<span class="closeButtonArea"><i
				class="fa-solid fa-xmark closeButton" id="closeButton"></i></span>
			<div>기부자님의 소중한 마음이 세상을 아름답게 변화시킵니다.</div>
			<div>
				<input type="number" id="donationValue">
				<button id="donationConfirm" onclick="requestPay()">기부하기</button>
			</div>
		</div>
	</div>

	<footer>
		<jsp:include page="/WEB-INF/views/main/footer.jsp" />
	</footer>

	<script
		src="${pageContext.request.contextPath}/resources/js/slick/slick.js"></script>
	<script src="https://kit.fontawesome.com/144bd71f16.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/donation/donationDetail.js"></script>

	<script>

        function donationInput() {
            grayBox.style.display = "flex";
            donationContainer.style.display = "inline";
        }

        function clickPayButton() {
            if (${!empty loginMember}) {
                donationInput();
            } else {
                alert("로그인이 필요한 서비스 입니다.");
                location.href = "../../main/login";
            }
        }

        function requestPay() {
            if (donationValue.value >= 100) {
                const today = new Date();
                const hours = today.getHours();
                const minutes = today.getMinutes();
                const seconds = today.getSeconds();
                const milliseconds = today.getMilliseconds();
                const makeMerchantUid = hours + minutes + seconds + milliseconds;
                donationContainer.style.display = "none";
                console.log(donationValue.value);

                IMP.request_pay({
                    pg : 'nice.{store-25334d4e-e97d-471c-a263-d93b21592ad8}',
                    pay_method : 'card',
                    merchant_uid: "IMP2" + makeMerchantUid,
                    name : "${donationDetail.donationTitle}",
                    amount : donationValue.value,
                    buyer_email : 'Iamport@chai.finance',
                    buyer_name : '아임포트 기술지원팀',
                    buyer_tel : '010-1234-5678',
                }, function (rsp) { // callback
                    grayBox.style.display = "none";
                    if (rsp.success) {
                        console.log(rsp);
                        $.ajax({
                            type: "POST",
                            url: "../verify/" + rsp.imp_uid
                        }).done(function (data) {
                            if (rsp.paid_amount == data.response.amount) {
                                alert("성공");

                                $.ajax({
                                    type: "POST",
                                    url: "../sync",
                                    data: {"impUid" : rsp.imp_uid, "payMethod" : rsp.pay_method, "paidAmount" : rsp.paid_amount, "donationNo" : ${donationDetail.donationNo}}
                                })
                            } else {
                                alert("실패");
                            }
                        })
                    } else {
                        console.log(rsp);
                    }
                });
            } else {
                alert("기부금액이 최소 금액보다 적습니다. 기부 금액을 100원 이상 입력해주세요.")
            }
        }

    </script>
</body>
</html>