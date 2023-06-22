<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>팝업</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/event/eventPopup.css">


    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
        integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>

    <main>
        <div class="E_popup_wrap02">
            <div class="E_popup_container02">
                <div class="E_popup_cont03">
                    <span>참여하기</span>
                </div>
                <div class="E_popup_cont04">
                    <span><img src="${pageContext.request.contextPath}${eventDetailTop.attachment}" alt="사진" style="width:50px; height: auto;"></span>
                    <span>${eventDetailTop.eventTitle}</span>
                </div>
                <form action="${eventNo}" enctype="multipart/form-data" method="POST" class="eventPopup-write">
                    <div class="E_popup_cont05">
                        <div class="E_imgInputInner">               
                        
                            <input id="E_imgInput" type="file" accept="image/*" name="uploadImage">
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
                        <button id="popup_submit2" type="submit">등록</button>        
                    </div>
                </form>
            </div>
        </div>
        <div class="E_pop_mask2"></div>
    </main>


    <script>
        function redirectToEventDetail(eventNo, currentPage, sURL) {
          var url = `../event/eventDetailMain/${eventNo}?cp=${currentPage}${sURL}`;
          window.location.href = url;
        }
      </script>
      
</body>

</html>