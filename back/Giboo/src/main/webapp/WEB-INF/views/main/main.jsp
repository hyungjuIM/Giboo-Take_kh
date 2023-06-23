<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/reset.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />


</head>

<body>
      <!-- 헤더 영역 -->
            <header>
                <jsp:include page="/WEB-INF/views/main/header.jsp" />
            </header>



    <main>
    	 
    
        <div class="container">
            <section class="welcome">
                <img src="#none" alt="">
              
            </section>

            <section class="contentCount">
                <div class="inner title_style">
                    <h3 class="sub_title">아름다운 사회를 위해
                        <br> Giboo&Take가 함께 합니다.
                    </h3>
                    <div class="count_box1">
                        <img src="${pageContext.request.contextPath}/resources/images/main_img/board.png" alt="#">
                        <div class="count_box1_container">
                            <h3>이웃을 향한 아름다운 도움의 손길을<br> 실천하는 Giboo&Take</h3>
                            <p>봉사 1회에 행복지수 10%가 상승하는 사실 알고 계셨나요?<br>Giboo&Take와 함께 나와 우리 이웃의 행복지수를 높여보아요!</p>
                        </div>
                    </div>
                    <div class="count_box2">
                        <div class="vol_count_person">
                            <h3><span>425</span>명</h3>
                            <p>2023년 Giboo&Take를 통해 이웃들을 위한<br>봉사활동에 참여한 봉사자들 입니다.</p>
                        </div>
                        <div class="vol_count_money">
                            <h3><span>5,248,002</span>원</h3>
                            <p>2023년 Giboo&Take에 진행된 기부 활동에<br>모여진 기부금액 입니다.</p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ***************** 봉사 section ***************** -->
            <section class="volContainer">

                <div class="main_sub_title">
                    <p>Volunteer</p>
                    <h3 class="sub_title">이웃을 향한 아름다운 도움의 손길</h3>
                </div>
                <div class="vol_box_container">
                    <div class="vol_box">
                        <div class="vol_day"><span>9</span>D-day</div>
                        <div><img src="${pageContext.request.contextPath}/resources/images/childimg.jpeg"></div>
                        <div class="vol_content_part">
                            <div class="vol_content_per_container">
                                <span class="vol_con_bar">
                                    <span class="vol_con_bar_per"></span>
                                </span>
                                <span class="tooltip"><span>14</span>/20</span>
                            </div>
                            <div class="vol_content">
                                <h3>아동 놀이 치료 봉사자 및 보조 봉사자 모집</h3>
                                <div><i class="xi-time-o"></i> <span>2023. 06. 12 ~ 06. 17</span></div>
                            </div>
                            <div class="vol_tag">
                                <div>
                                    <span class="vol_tag_child">어린이</span>
                                    <span class="vol_tag_applyPlay">놀이지원</span>
                                </div>
                                <div class="vol_like">
                                    <i class="xi-heart-o"></i>
                                    <p>102</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="vol_box">
                        <div class="vol_day"><span>9</span>D-day</div>
                        <div><img src="${pageContext.request.contextPath}/resources/images/childimg.jpeg"></div>
                        <div class="vol_content_part">
                            <div class="vol_content_per_container">
                                <span class="vol_con_bar">
                                    <span class="vol_con_bar_per"></span>
                                </span>
                                <span class="tooltip"><span>14</span>/20</span>
                            </div>
                            <div class="vol_content">
                                <h3>아동 놀이 치료 봉사자 및 보조 봉사자 모집</h3>
                                <div><i class="xi-time-o"></i> <span>2023. 06. 12 ~ 06. 17</span></div>
                            </div>
                            <div class="vol_tag">
                                <div>
                                    <span class="vol_tag_child">어린이</span>
                                    <span class="vol_tag_applyPlay">놀이지원</span>
                                </div>
                                <div class="vol_like">
                                    <i class="xi-heart-o"></i>
                                    <p>102</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="vol_box">
                        <div class="vol_day"><span>9</span>D-day</div>
                        <div><img src="${pageContext.request.contextPath}/resources/images/childimg.jpeg"></div>
                        <div class="vol_content_part">
                            <div class="vol_content_per_container">
                                <span class="vol_con_bar">
                                    <span class="vol_con_bar_per"></span>
                                </span>
                                <span class="tooltip"><span>14</span>/20</span>
                            </div>
                            <div class="vol_content">
                                <h3>아동 놀이 치료 봉사자 및 보조 봉사자 모집합니다.</h3>
                                <div><i class="xi-time-o"></i> <span>2023. 06. 12 ~ 06. 17</span></div>
                            </div>
                            <div class="vol_tag">
                                <div>
                                    <span class="vol_tag_child">어린이</span>
                                    <span class="vol_tag_applyPlay">놀이지원</span>
                                </div>
                                <div class="vol_like">
                                    <i class="xi-heart-o"></i>
                                    <p>102</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
 
            </section>

            <!-- ***************** 기부 section ***************** -->
            <section class="donationContainer">
                <div class="main_sub_title title_style">
                    <p>Donation</p>
                    <h3 class="sub_title">이웃을 향한 아름다운 도움의 손길</h3>
                </div>
                <div class="vol_box_container">
                    <div class="vol_box">
                        <div class="vol_day"><span>9</span>D-day</div>
                        <div><img src="${pageContext.request.contextPath}/resources/images/childimg.jpeg"></div>
                        <div class="vol_content_part">
                            <div class="vol_content_per_container">
                                <span class="vol_con_bar">
                                    <span class="vol_con_bar_per"></span>
                                </span>
                                <span class="tooltip"><span>14</span>/20</span>
                            </div>
                            <div class="vol_content">
                                <h3>아동 놀이 치료 봉사자 및 보조 봉사자 모집</h3>
                                <div><i class="xi-time-o"></i> <span>2023. 06. 12 ~ 06. 17</span></div>
                            </div>
                            <div class="vol_tag">
                                <div>
                                    <span class="vol_tag_child">어린이</span>
                                    <span class="vol_tag_applyPlay">놀이지원</span>
                                </div>
                                <div class="vol_like">
                                    <i class="xi-heart-o"></i>
                                    <p>102</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="vol_box">
                        <div class="vol_day"><span>9</span>D-day</div>
                        <div><img src="${pageContext.request.contextPath}/resources/images/childimg.jpeg"></div>
                        <div class="vol_content_part">
                            <div class="vol_content_per_container">
                                <span class="vol_con_bar">
                                    <span class="vol_con_bar_per"></span>
                                </span>
                                <span class="tooltip"><span>14</span>/20</span>
                            </div>
                            <div class="vol_content">
                                <h3>아동 놀이 치료 봉사자 및 보조 봉사자 모집</h3>
                                <div><i class="xi-time-o"></i> <span>2023. 06. 12 ~ 06. 17</span></div>
                            </div>
                            <div class="vol_tag">
                                <div>
                                    <span class="vol_tag_child">어린이</span>
                                    <span class="vol_tag_applyPlay">놀이지원</span>
                                </div>
                                <div class="vol_like">
                                    <i class="xi-heart-o"></i>
                                    <p>102</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="vol_box">
                        <div class="vol_day"><span>9</span>D-day</div>
                        <div><img src="${pageContext.request.contextPath}/resources/images/childimg.jpeg"></div>
                        <div class="vol_content_part">
                            <div class="vol_content_per_container">
                                <span class="vol_con_bar">
                                    <span class="vol_con_bar_per"></span>
                                </span>
                                <span class="tooltip"><span>14</span>/20</span>
                            </div>
                            <div class="vol_content">
                                <h3>아동 놀이 치료 봉사자 및 보조 봉사자 모집합니다.</h3>
                                <div><i class="xi-time-o"></i> <span>2023. 06. 12 ~ 06. 17</span></div>
                            </div>
                            <div class="vol_tag">
                                <div>
                                    <span class="vol_tag_child">어린이</span>
                                    <span class="vol_tag_applyPlay">놀이지원</span>
                                </div>
                                <div class="vol_like">
                                    <i class="xi-heart-o"></i>
                                    <p>102</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </section>
            <section class="userReview">
                <div class="main_sub_title">
                    <p>Review</p>
                    <h3 class="sub_title">참여자 후기</h3>
                </div>

                <div class="re_box_container">

                    <div class="re_box">
                        <div class="re_tag_sticky"><span><i class="xi-user-o"></i>어르신</span></div>
                        <img src="/images/main_img/01_상체.png">
                        <div class="re_content_container">
                            <span class="re_content">

                                갈 때 마다 어르신들이 너무 반겨 주셔서 제가 힐링받고
                                오는 곳입니다. 정말 어르신들 너무 좋으시고 추천합니다!

                            </span>
                            <span class="re_user_name">유정(우리동네 지킴이)</span>
                        </div>
                        <div class="re_active_info">
                            <span>활동</span>
                            <span>요양원 입소 어르신 나들이 활동 이동 보조 및 말벗 지원</span>
                        </div>

                    </div>
                    <div class="re_box">
                        <div class="re_tag_sticky"><span><i class="xi-user-o"></i>어르신</span></div>
                        <img src="${pageContext.request.contextPath}/resources/images/main_img/book.png" class="main_book">
                        <div class="re_content_container">
                            <span class="re_content">

                                갈 때 마다 어르신들이 너무 반겨 주셔서 제가 힐링받고
                                오는 곳입니다. 정말 어르신들 너무 좋으시고 추천합니다!

                            </span>
                            <span class="re_user_name">유정(우리동네 지킴이)</span>
                        </div>
                        <div class="re_active_info">
                            <span>활동</span>
                            <span>요양원 입소 어르신 나들이 활동 이동 보조 및 말벗 지원</span>
                        </div>

                    </div>
                    <div class="re_box">
                        <div class="re_tag_sticky"><span><i class="xi-user-o"></i>어르신</span></div>
                        <img src="${pageContext.request.contextPath}/resources/images/main_img/upperBody.png">
                        <div class="re_content_container">
                            <span class="re_content">

                                갈 때 마다 어르신들이 너무 반겨 주셔서 제가 힐링받고
                                오는 곳입니다. 정말 어르신들 너무 좋으시고 추천합니다!

                            </span>
                            <span class="re_user_name">유정(우리동네 지킴이)</span>
                        </div>
                        <div class="re_active_info">
                            <span>활동</span>
                            <span>요양원 입소 어르신 나들이 활동 이동 보조 및 말벗 지원</span>
                        </div>

                    </div>
                </div>
            </section>
        </div>
		 <jsp:include page="/WEB-INF/views/main/qnaBtn.jsp" />
		 
    </main>
    <!-- 푸터 영역 -->
    <footer>
        <jsp:include page="/WEB-INF/views/main/footer.jsp" />
    </footer>
<script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "759276e8-069a-4d4a-b4f9-73deebd841e5"
  });
</script>
<script src="${pageContext.request.contextPath}/resources/js/main/main.js"></script>
</body>

</html>