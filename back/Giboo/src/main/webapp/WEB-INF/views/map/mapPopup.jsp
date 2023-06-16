<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>맵 마커 팝업</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/map/mapPopup.css">

    <!-- jQuery 라이브러리 추가(CDN) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
    
    <div class="mpopWrap">
        <div class="mpopBox">
            <div class="mpopup">
                <a href="">
                    <div class="mpopImg">
                        <img src="/images/doCenter.jpg" alt="">
                    </div>
                    <div class="mpopContent">
                        <div class="mpopTi">
                                <div class="mpopTitle">
                                    <span>서울시립장애인행복플러스센터
                                        서울시립장애인행복플러스센터
                                    </span>
                                </div>
                            <div class="mpopCa">
                                <span>장애인</span>
                            </div>
                        </div>
                        <div class="mpopAd">
                            <span>서울 강남구 도곡로 416</span>
                        </div>
                        <div class="mpopFoot">
                            <div class="mpopBtn">
                                <a href="">
                                    <div class="mpopBs">
                                        <span>🏠</span>
                                    </div>
                                </a>
                                <a href="">
                                    <div class="mpopBl">
                                        <span>📞</span>
                                    </div>
                                </a>
                            </div>
                            <div class="mpopV">
                                <div class="mpopVr">
                                    <span>봉사자 리뷰</span>
                                    <span>135</span>
                                </div>
                                <span>|</span>
                                <div class="mpopVn">
                                    <span>봉사자</span>
                                    <span>432</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <!-- 공유 팝업 -->
    <div class="mpWrap">
        <div class="mpBox">
            <div class="mpBtn">
                <div class="mpBtnWrap">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
            <div class="mpUrlWrap">
                <div class="mpUrlBox">
                    <div class="mpUrlInput">
                        <input type="text">
                    </div>
                    <a href="">
                        <div class="mpUrlP">
                            <span>url복사</span>
                        </div> 
                    </a>
                </div>
            </div>
        </div>
    </div>
    </div>



   

    <!-- 임시 마커 -->
    <div class="Marker" id="Marker" >
        <div class="MarkerMarker">
            <img src="/images/profile.jpeg" alt="">
        </div>
    </div>


    <script>
        // $('.Marker').on('click', function() {
        // $('.mpopWrap').toggleClass('show');
        // });

        // 찐
        $(document).on('click', function(event) {
        if (!$(event.target).closest('.Marker').length && !$(event.target).closest('.mpopWrap').length) {
            $('.mpopWrap').removeClass('show');
        }
        });

        $('.Marker').on('click', function() {
        $('.mpopWrap').toggleClass('show');
        });





        // 공유팝업
        // $(document).on('click', function(event) {
        // if (!$(event.target).closest('.mpopBs').length && !$(event.target).closest('.mpWrap').length) {
        //     $('.mpWrap').removeClass('show');
        // }
        // });

        // $('.mpopBs').on('click', function() {
        // $('.mpWrap').toggleClass('show');
        // });
        
      </script>
</body>
</html>