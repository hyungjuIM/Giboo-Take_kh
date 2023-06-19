<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>이벤트 디테일 사진</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/event/eventDetail.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/event/eventPopup.css">
    
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
        integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    
        <script src="https://kit.fontawesome.com/50a1d35924.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
    </head>
    <body>
    
        <main>
            <div class="edWrapBox">
                <div class="edWrap">
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
                    <div class="edWrapBar">
                        <div class="edDoBar">
                            <progress value="80" max="100"></progress>
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
                        </div>
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
                                                    <img src="${pageContext.request.contextPath}${eventDetailMember.profileImg}" alt="">
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
                    <div class="edBtn">
                        <div class="edBtnDe">
                            <span id="E_popup2">이벤트 함께하기</span>
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
    </main>     
    
    

    <div class="E_popup_wrap02">
        <div class="E_popup_container02">
            <div class="E_popup_cont03">
                <span>참여하기</span>
            </div>
            <div class="E_popup_cont04">
                <span><img src="${pageContext.request.contextPath}${eventDetailTop.attachment}" alt="사진" style="width:50px; height: auto;"></span>
                <span>${eventDetailTop.eventTitle}</span>
            </div>
            <div class="E_popup_cont05">
                
                <div class="E_imgInputInner">               
                   
                    <input id="E_imgInput" type="file" accept="image/*">
                    <div id="E_imgInputPlaceholder"></div>
                    
                    <label for="E_imgInput" class="E_imgSelectButton"><i class="fa-solid fa-camera"></i>사진 첨부</label>
                      
                </div>
            </div>
            <div class="E_popup_cont06">
                <textarea placeholder="자전거 주행 사진 및 자전거 내비게이션 이용 화면을 캡쳐 후 인증해주세요."></textarea>
            </div>
            <div class="E_popup_cont07">
                - 사진은 10MB 이내, 최대 5장까지 첨부 가능합니다.<br>
                - 이벤트 내용에 맞지 않거나 게시글 정책을 위반한 경우 삭제됩니다.
            </div>
            <div class="E_popup_cont08">
                <button id="E_popup1">취소</button>
                <button id="popup_submit2">등록</button>

            </div>

        </div>
    </div>
    <div class="E_pop_mask2"></div>




    <div class="E_popup_wrap01">
        <div class="E_popup_container01">
            <div class="E_popup_cont01">
                <span style="color: #686868;">작성중인 글 작성을</span> <br>
                <span style="color: #000000;">취소하시겠습니까? </span>
            </div>

            <div class="E_popup_cont02">
                <button id="popup_submit1">취소</button>
                <button id="popup_close1">확인</a></button>
            </div>
        </div>
    </div>
    <div class="E_pop_mask1"></div>



















<script src="${pageContext.request.contextPath}/resources/js/event/eventPopup.js"></script>
    </body>
    </html>
