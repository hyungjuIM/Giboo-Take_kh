<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <header>
            <jsp:include page="/WEB-INF/views/main/header.jsp" />
        </header>
    
    <main>
        <div class="edWrap">
            <jsp:include page="/WEB-INF/views/event/eventDetailTop.jsp" />

            <div class="edDetail">
                <div class="edDetailLeft">
                    <jsp:include page="/WEB-INF/views/event/eventDetailLeft.jsp" />
                </div>

                <div class="edDetailRight">
                    <div class="edInBar">
                        <jsp:include page="/WEB-INF/views/event/eventStickerBar.jsp" />
                    </div>
                </div>
            </div>
        </div>
    </main>     

    <footer>
        <jsp:include page="/WEB-INF/views/main/footer.jsp" />
    </footer>
    
    <div class="E_popup_wrap02">
        <div class="E_popup_container02">
            <div class="E_popup_cont03">
                <span>참여하기</span>
            </div>
            <div class="E_popup_cont04">
                <span><img src="${pageContext.request.contextPath}${eventDetailTop.attachment}" alt="사진" style="width:50px; height: auto;"></span>
                <span>${eventDetailTop.eventTitle}</span>
            </div>
            <form action="${pageContext.request.contextPath}/event/eventDetailMain/${eventNo}" enctype="multipart/form-data" method="POST" 
            class="eventPopup-write" onsubmit="return writeValidate(event)">
                <div class="E_popup_cont05">
                    <div class="E_imgInputInner">               
                    
                        <input id="E_imgInput" type="file" accept="image/*" name="uploadImage" onchange="handleImagePreview()">
                        <div type="text" name="uploadImage" id="E_imgInputPlaceholder"></div>
                        
                        <label for="E_imgInput" class="E_imgSelectButton"><i class="fa-solid fa-camera"></i>사진 첨부</label>
                        
                    </div>
                </div>
                <div class="E_popup_cont06">
                    <img src="" id="preview-image" name="preview-image">
                </div>                    
                <div class="E_popup_cont07">
                    - 사진은 10MB 이내, 최대 5장까지 첨부 가능합니다.<br>
                    - 이벤트 내용에 맞지 않거나 게시글 정책을 위반한 경우 삭제됩니다.
                </div>
                <div class="E_popup_cont08">
                    <button id="E_popup1">취소</button>
                    <button id="popup_submit2" type="submit">등록</button>        
                </div>
            </form>
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
                <button id="popup_close1">취소</button>
                <button id="popup_submit1">확인</a></button>
            </div>
        </div>
    </div>
    <div class="E_pop_mask1"></div>


    <div class="E_popup_wrap03">
        <div class="E_popup_container03">
            <div class="E_popup_cont09">
                <i class="fa-solid fa-x"></i>
            </div>
            <div class="E_popup_bottom">
                <div class="E_popup_cont10">
                    <div class="outCircle">
                        
                    </div>
                </div>
                <div class="E_popup_cont11">
                    함께 참여해주셔서<br>
                    감사합니다.
                </div>
                <div class="E_popup_cont12">친구들에게 나의 참여를 공유해보세요.</div>
                <div class="E_popup_cont13">
                    <div class="smallCircle"></div>
                    <div class="smallCircle"></div>
                    <div class="smallCircle"></div>
                    <div class="smallCircle"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="E_pop_mask3"></div>



    <script src="${pageContext.request.contextPath}/resources/js/event/eventPopup.js"></script>

    </body>
    </html>
