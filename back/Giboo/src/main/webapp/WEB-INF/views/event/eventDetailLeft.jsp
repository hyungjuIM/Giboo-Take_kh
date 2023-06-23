<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/event/eventDetail.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
    integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

    <script src="https://kit.fontawesome.com/50a1d35924.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
</head>
<body>
        <div class="edCategory">
            <div class="edCategoryWidth">
                    <div class="edEventintro">
                        <a href="../event/eventDetailMain/${eventDetailLeft.eventNo}?cp=${pagination.currentPage}${sURL}">
                            <span>이벤트 소개</span>
                        </a>
                    </div>
                    <div class="edEventintro">
                        <a href="">
                            <span>인증 방법</span>
                        </a>
                    </div>
                    <div class="edEventintro">
                        <a href="${pageContext.request.contextPath}/eventDetailBoardPhoto">
                            <span>참여보드</span>
                        </a>
                    </div>
            </div>
        </div>
        <div class="edDetailWrap">
            <div class="edDetailWrite">
                <!-- 그냥 글 예시 -->
                <span>
                    ${eventDetailLeft.eventContent}
                </span>
            </div>
        </div>
</body>
</html>