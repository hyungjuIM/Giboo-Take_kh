<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

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
                                <span id="recommendedCount">${volunteerDetail.favCount}</span>명 추천</span>
                        </div>
                    </div>

                    <!-- <div class="description">
                        기부금 전액 올무에 패인 상처가 평생 낫지 않는 길고양이 1마리의 3개월 치료비와 1년 사료비를 지원합니다.
                    </div> -->


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

                        <div class="agencyDescription">존엄한 생명으로서 그들의 본연의 삶을 영위하고,<br>모든 생명의균형과 조화 속에 공존하는 세상을 지향합니다.</div>
                        <a class="agencyLink" href="">사이트 방문하기<img class="agencyLinkImg" src="${pageContext.request.contextPath}/resources/images/chevron-right-solid.svg"></a>
                    </div>

                <div class="big_Con">
                    <div class="commentHeader">
                        <img class="commentTitleImg" src="${pageContext.request.contextPath}/resources/images/comment-regular.svg">
                        <span id="name">${volunteerDetail.volunteerTitle}</span>에게 응원의 메시지를 남겨주세요
                    </div>
                    <div class="commentArea">

                        <ul class="commentUl">
                            <c:forEach var="replyList" items="${reply}">
                                <li class="commentLi">
                                    <div class="commentItem">
                                        <div class="memberImgArea">
                                            <c:choose>
                                                <c:when test="${empty replyList.profileImg}">
                                                    <img id="memberImg1" class="memberImg" src="${pageContext.request.contextPath}/resources/images/dog_emoji.png">
                                                </c:when>
                                                <c:otherwise>
                                                    <img id="memberImg1" class="memberImg" src="${pageContext.request.contextPath}${replyList.profileImg}">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                        <div class="commentInner">
                                            <div id="memberNick" class="memberNick">${replyList.memberNick}</div>
                                            <div id="comment1" class="comment">${replyList.replyContent}</div>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>

                    </div>
                    <div class="textarea-wrapper">
                        <textarea id="replyContent" placeholder="응원의 댓글을 남겨주세요"></textarea>
                    </div>
                      <button class="commentSubmit" id="cheeringButton">응원하기</button>
                    <!-- <textarea id="replyContent"></textarea>
                        <button class="commentSubmit" id="cheeringButton">응원하기</button> -->

                        <div class="commentInfo">
                            <img src="${pageContext.request.contextPath}/resources/images/comment-regular.svg">
                            <span id="commentCount">${memberCount}</span>
                            <span>명 응원중</span>
                        </div>

                    </div>


                    <div class="modify_tag_box">
						<a class="modify_tag"
							href="${pageContext.request.contextPath}/volunteer/write?mode=update&no=${volunteerDetail.volunteerNo}">수정</a>
					</div>
                </div>
                
            </section>

            <!-- <section class="relatedArea">
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

            </section> -->

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
      
          if ("${!empty loginMember}") {
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

        const volunteerNo = "${volunteerDetail.volunteerNo}"; // "500"
        const loginMemberNo = "${loginMember.memberNo}";

      </script>
      
    <script src="${pageContext.request.contextPath}/resources/js/slick/slick.js"></script>

    <script src="${pageContext.request.contextPath}/resources/js/volunteer/volunteerDetail.js"></script>
</body>
</html>