<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>hunny</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/volunteer/volunteerDetail.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick/slick.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick/slick-theme.css">
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/main/header.jsp" />
    </header>
    
    <div class="mainCategoryArea">
        <div class="mainCategoryInner">
            <a href="${pageContext.request.contextPath}/volunteer/home" class="mainCategoryItem mainCategoryChecked" id="home">봉사 진행중</a>
            <a href="${pageContext.request.contextPath}/volunteer/storyList" class="mainCategoryItem" id="story">봉사이야기</a>
        </div>
    </div>

    <section class="mainContainer">
        <div class="mainContent">

            <div class="infoArea">
                <img class="thumbnail" src="${pageContext.request.contextPath}${volunteerDetail.volunteerAttachment}">

                <div class="info">
                    <div>
                        <span class="hot">HOT</span>
                        <span class="d-day">D-<span id="d-day">${volunteerDetail.DDay}</span>일</span>
                    </div>
                    <div class="title">${volunteerDetail.volunteerTitle}</div>

                    <div class="progressArea">
                        <div class="progressInfo">
                            <span class="progressPercentage">${volunteerDetail.percent}%</span>
                                <span class="goal">
                                    목표
                                    <span class="goal" id="goalValue">${volunteerDetail.targetPeople}</span>명
                            </span>
                        </div>

                        <div class="progressBar">
                            <div class="progressBarValue" style="width: ${volunteerDetail.percent}%"></div>
                        </div>

                        <div class="progressStatus">
                            <span>
                                <img src="${pageContext.request.contextPath}/resources/images/comment-regular.svg">
                                <span id="volunteerCount">${volunteerDetail.volunteerCount}</span>명 참여중</span>
                            <span>
                                <img src="${pageContext.request.contextPath}/resources/images/heart-regular.svg">
                                <span id="recommendedCount">102</span>명 추천</span>
                        </div>
                    </div>

                    <div class="description">
                        기부금 전액 올무에 패인 상처가 평생 낫지 않는 길고양이 1마리의 3개월 치료비와 1년 사료비를 지원합니다.
                    </div>


                    <button id="volunteerButton" class="volunteerButton">봉사 참여하기</button>

                </div>
            </div>

            <section class="contentArea">
                <div class="content">
                    <c:out value="${volunteerDetail.volunteerContent}" escapeXml="false" />
                </div>

                <div class="nav">
                    <div class="agencyInfoArea">
                        <div class="agencyInfo">
                            <img class="agencyImg" src="${pageContext.request.contextPath}/resources/images/dog_emoji.png">
                            <div class="agencyInfoInner">
                                <div class="division">봉사단체</div>
                                <div class="agencyName">${volunteerDetail.agencyName}</div>
                            </div>
                        </div>

                        <div class="agencyDescription">존엄한 생명으로서 그들의 본연의 삶을 영위하고,<br>
                            모든 생명의균형과 조화 속에 공존하는 세상을 지향합니다.</div>
                        <a class="agencyLink" href="">사이트 방문하기
                            <img class="agencyLinkImg" src="${pageContext.request.contextPath}/resources/images/chevron-right-solid.svg"></a>
                    </div>

					<div class="commentArea">
						<div>
							<img class="commentTitleImg" src="${pageContext.request.contextPath}/resources/images/comment-regular.svg">
							<span id="name">Marie를 위한 응원 메시지를 남겨주세요</span>
						</div>
						<c:choose>
							<c:when test="${empty reply}">
								<span>응원 메시지가 없습니다. 여러분의 응원이 필요합니다.</span>
							</c:when>
							<c:otherwise>
								<c:forEach var="reply" items="${reply}">
									<div class="commentItem">
										<div class="memberImgArea">
											<img id="memberImg1" class="memberImg" src="${pageContext.request.contextPath}/resources/images/dog_emoji.png">
										</div>
										<div class="commentInner">
											<div id="memberName1" class="memberName">User${reply.memberNo}</div>
											<div id="comment1" class="comment">${reply.replyContent}</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<textarea id="replyContent"></textarea>
						<button class="commentSubmit" id="cheeringButton">응원하기</button>
						<div class="commentInfo">
							<img src="${pageContext.request.contextPath}/resources/images/comment-regular.svg">
							<span id="commentCount">1,030</span>
							<span>명이 응원하고 있습니다｜</span>
							<img src="${pageContext.request.contextPath}/resources/images/share-from-square-regular.svg">
							<span id="shareCount">508</span>
							<span>명이 공유하였습니다</span>
						</div>
					</div>
					

                    <a href="${pageContext.request.contextPath}/volunteer/write?mode=update&no=${volunteerDetail.volunteerNo}">수정</a>

                </div>
            </section>

            <section class="relatedArea">
                <div>관련된 동물 봉사</div>

                <div class="relatedAreaInner">
                    <div class="relatedItemListButtonArea">
                        <button id="prev"><img src="${pageContext.request.contextPath}/resources/images/arrow-left-long-solid.svg"></button>
                    </div>
                    <div class="relatedItemList">

                        <div class="relatedItem">
                            <a href="">
                                <img id="relatedImg1" class="relatedImg" src="${pageContext.request.contextPath}/resources/images/220726-cat-theo-elise-ew-636p-6cd3b0.webp">
                                <div class="relatedItemTitle">타이틀</div>
                            </a>
                            <div class="relatedItemStatus">
                            <span>
                            <img src="${pageContext.request.contextPath}/resources/images/comment-regular.svg">
                            <span id="relatedVolunteerCount1">1,030</span>명 참여중</span>

                                <span>
                            <img src="${pageContext.request.contextPath}/resources/images/heart-regular.svg">
                            <span id="relatedRecommendedCount1">102</span>명 추천</span>
                            </div>
                        </div>

                        

                    </div>
                    <div class="relatedItemListButtonArea">
                        <button id="next"><img src="${pageContext.request.contextPath}/resources/images/arrow-right-long-solid.svg"></button>
                    </div>
                </div>

            </section>

            <div class="grayBox" id="grayBox">
                <div class="volunteerSubmitContainer" id="volunteerSubmitContainer">

                </div>
            </div>

        </div>
    </section>

    <footer>
        <jsp:include page="/WEB-INF/views/main/footer.jsp" />
    </footer>
    <script>
          var contextPath = "${pageContext.request.contextPath}";
        //const volunteerButton = document.getElementById("volunteerButton");
        volunteerButton.addEventListener('click', function() {
          const url = window.location.href;
          const parts = url.split('/');
          const volunteerNo = parseInt(parts[parts.length - 1]);
      
          if (${!empty loginMember}) {
            alert("봉사 참여를 하시겠습니까?");
            $.ajax({
              url: "../doVolunteer",
              type: "POST",
              data: { volunteerNo: volunteerNo },
              success: function(response) {
               
                alert(response.message); // 서버에서 반환한 message를 표시
              },
              error: function() {
                console.log("봉사참여 실패");
              }
            });
          } else {
            alert("로그인이 필요한 서비스 입니다.");
            location.href = "../../main/login";
          }
        });


    // 응원 버튼
        const cheeringButton = document.getElementById("cheeringButton");
        const replyContent1 = document.getElementById("replyContent");

        const loginMemberNo = ${loginMember.memberNo};
        const volunteerNo1 = ${volunteerDetail.volunteerNo};
        
        cheeringButton.addEventListener("click", function () {
            console.log("버튼 클릭");
            if (loginMemberNo == "") { // 로그인 X
                alert("로그인 후 사용해 주세요.");
                return;
            }

            if (replyContent1.value.trim().length == 0) {
                alert("응원 댓글을 작성하고 버튼을 클릭해 주세요.");

                replyContent1.value = "";
                replyContent1.focus();
                return;
            }

            //console.log(${reply.replyContent});
            console.log(${volunteerDetail.volunteerNo});
            // 댓글 DB에 저장
            $.ajax({
                url: contextPath + "/volunteer/insertReply",
                type: "POST",
                data: {
                    "replyContent":  replyContent1.value,
                    "memberNo": ${loginMember.memberNo},
                    "volunteerNo": ${volunteerDetail.volunteerNo}
                    
                },

                success: function (result) {
                    if (result > 0) {
                        alert("댓글이 추가되었습니다.")
                        replyContent1.value = "";
                        selectReplyList(result); // 새로운 댓글 추가
                    } else {
                        alert("댓글 등록에 실패했습니다.");
                    }
                }
            });
        });

        function selectReplyList() {
    $.ajax({
        url: contextPath + "/volunteer/selectReplyList",
        type: "GET",
        data: { volunteerNo: volunteerNo1 }, // Make sure the volunteerNo1 variable is defined

        success: function(response) {
        console.log("selectReplyList success:", response);

        // Update the HTML elements with the received data
        if (response && response.length > 0) {
            const reply = response[0]; // Assuming the first reply is sufficient

            const memberName1 = document.getElementById("memberName1");
            const comment1 = document.getElementById("comment1");

			if (memberName1 === null) {
				console.log('memberName is null');
				} else {
				memberName1.innerText = "유저" + reply.replyNo;
				}

			if (comment1 === null) {
				console.log('comment is null');
				} else {
				comment1.innerText = reply.replyContent;
				}
        }
        },

        error: function(req, status, error) {
        console.log("selectReplyList error:", error);
        }
    });
}

      </script>
      
    <script src="${pageContext.request.contextPath}/resources/js/slick/slick.js"></script>

    <script src="${pageContext.request.contextPath}/resources/js/volunteer/volunteerDetail.js"></script>
</body>
</html>