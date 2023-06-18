<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이벤트 디테일 참여보드 사진</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/event/eventDetail_photo.css">

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
                <div class="edCategory">
                    <div class="edCategoryWidth">
                            <div class="edEventintro">
                                <a href="/html/event/eventDetail_photo.html">
                                    <span>이벤트 소개</span>
                                </a>
                            </div>
                            <div class="edEventintro">
                                <a href="">
                                    <span>인증 방법</span>
                                </a>
                            </div>
                            <div class="edEventintro">
                                <a href="/html/event/eventDetailBoardPhoto.html">
                                    <span>참여보드</span>
                                </a>
                            </div>
                    </div>
                </div>
                <div class="edDetailWrap">
                    <div class="edDetailWrite">
                        <div class="ebpWrap">
                            <div class="ebpTitle">
                                <span>🥰</span>
                                <span>자전거로 탄소 감축 인증</span>
                                <span>67</span>
                            </div>
                            <div class="ebpPhotoWrap">
                                <ul class="ebpPhotoWrapUl">
                                    <li class="ebpPhotoWrapLi">
                                        <div class="ebpPhotoBox">
                                            <div class="ebpPhotoImg">
                                                <img src="/images/doCenter.jpg" alt="">
                                            </div>
                                            <div class="ebpPhotoPro">
                                                <span>참여자 별명</span>
                                                <div class="ebpPhotoProTime">
                                                    <span>14</span>
                                                    <span>시간 전</span>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="ebpPhotoWrapLi">
                                        <div class="ebpPhotoBox">
                                            <div class="ebpPhotoImg">
                                                <img src="/images/logo.jpg" alt="">
                                            </div>
                                            <div class="ebpPhotoPro">
                                                <span>참여자 별명</span>
                                                <div class="ebpPhotoProTime">
                                                    <span>14</span>
                                                    <span>시간 전</span>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="ebpPhotoWrapLi">
                                        <div class="ebpPhotoBox">
                                            <div class="ebpPhotoImg">
                                                <img src="/images/dog_emoji.png" alt="">
                                            </div>
                                            <div class="ebpPhotoPro">
                                                <span>참여자 별명</span>
                                                <div class="ebpPhotoProTime">
                                                    <span>14</span>
                                                    <span>시간 전</span>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="ebpPhotoWrapLi">
                                        <div class="ebpPhotoBox">
                                            <div class="ebpPhotoImg">
                                                <img src="/images/news_1486098867_610387_m_1.jpg" alt="">
                                            </div>
                                            <div class="ebpPhotoPro">
                                                <span>참여자 별명</span>
                                                <div class="ebpPhotoProTime">
                                                    <span>14</span>
                                                    <span>시간 전</span>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
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