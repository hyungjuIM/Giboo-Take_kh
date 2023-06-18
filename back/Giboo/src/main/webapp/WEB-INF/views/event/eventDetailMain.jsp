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
    </body>
    </html>
