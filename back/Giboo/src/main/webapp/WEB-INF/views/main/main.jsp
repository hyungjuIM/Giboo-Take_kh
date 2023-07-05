
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
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/reset.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/main.css" />


</head>
<!-- style="overflow-x:hidden; overflow-y:auto;" -->
<body style="overflow-x: hidden; overflow-y: auto;">
	<!-- 헤더 영역 -->
	<header>
		<jsp:include page="/WEB-INF/views/main/header.jsp" />
	</header>






	<main>


		<div class="container">

			<section class="welcome">

				<div class="main_swiper">



					<div class="mainImg_wrapper">
						<%-- <div class="mainImg_slide active"><img src="${pageContext.request.contextPath}/resources/images/main_img/main_img.png" alt=""></div>
                        <div class="mainImg_slide"><img src="#none" alt=""></div>
                        <div class="mainImg_slide"><img src="${pageContext.request.contextPath}/resources/images/main_img/main_img.png" alt=""></div>
                     --%>


						<div class="mainImg_slide active">
							<h1 class="sec1_h1_style">
								바쁜 현대 사회에서 <br> 혼자라는 느낌이 들 때,
							</h1>
							<p class="sec1_p_style">
								세상에 혼자만 남겨진 것 같은 느낌, <br>
								사람의 온기가 필요할 때,
								
							 </p>
							<video class="main_video"
								src="${pageContext.request.contextPath}/resources/images/video/seoul.mp4"
								autoplay muted loop></video>

						</div>

						<div class="mainImg_slide">
						
							<h1 class="sec2_h1_style">우리는 함께 할 때 행복합니다.</h1>
							<p class="sec2_p_style">
								외로움을 이기고 새로운 친구와 소중한 인연을 만들기 위해 봉사에 참여합니다.
								<br>나의 따뜻한 마음과 관심을 나누며 함께하는 봉사 활동은 외로움을 극복하는데 큰 도움이 됩니다.
							</p>
							<video class="main_video"
								src="${pageContext.request.contextPath}/resources/images/video/summer.mp4"
								autoplay muted loop></video>
						</div>
						
						<div class="mainImg_slide">
						
						<h1 class="sec3_h1_style">우리는 언제나<br> 당신과 함께합니다.</h1>
						<p class="sec3_p_style">Hunny는 다양한 기부, 봉사 프로그램이 준비되어 있습니다. <br>
						우리는 언제나 가까운 곳에서 여러분을 기다립니다.</p>
							<video class="main_video"
								src="${pageContext.request.contextPath}/resources/images/video/hug.mp4"
								autoplay muted loop></video>
						</div>

					</div>
					<!-- 
                    <div class="swiper_pagination">
                        <div class="step active-step"></div>
                        <div class="step"></div>
                        <div class="step"></div>
                    </div> -->

					<!-- <div class="vol_next_prev_btn">
                        <button class="vol_swiper_button_prev">prev</button>
                        <button class="vol_swiper_button_next">next</button>
                    </div> -->



                </div>







            </section>


            <section class="contentCount">
                <div class="inner title_style">
                    <h3 class="sub_title">아름다운 사회를 위해
                        <br> Hunny가 함께 합니다.
                    </h3>



                    <div class="count_box1">
                        <img src="${pageContext.request.contextPath}/resources/images/main_img/bunny_01.png">
                        <div class="count_box1_container">
                            <h3>이웃을 향한 아름다운 도움의 손길을<br> 실천하는 Hunny :)</h3>
                            <p>봉사 1회에 행복지수 10%가 상승하는 사실 알고 계셨나요?<br>Hunny와 함께 나와 우리 이웃의 행복지수를 높여보아요!</p>
                        </div>
                    </div>
                    <div class="count_box2">
                        <div class="vol_count_person">
                            <h3><span id="volCount"></span>명</h3>
                            <p>2023년 Hunny를 통해 이웃들을 위한<br>봉사활동에 참여한 봉사자들 입니다.</p>
                        </div>
                        <div class="vol_count_money">
                            <h3><span id="volMoney"></span>원</h3>
                            <p>2023년 Hunny에 진행된 기부 활동에<br>모여진 기부금액 입니다.</p>
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

                    <ul class="allSlides slidesStyle">
                        <c:forEach var="volunteer" items="${mVolunteerList}" varStatus="status" begin="0" end="5">
                            <c:set var="volunteerDetail" value="${volunteerDetails[status.index]}" />
                        <li class="vol_box_style vol_box">
                            <div class="vol_day"><span>${volunteerDetail.DDay}</span>D-day</div>
                            <div><img src="${pageContext.request.contextPath}${volunteerDetail.volunteerAttachment}"></div>

                            <div class="vol_content_part">
                                <div class="vol_content_per_container">
                                    <div class="progressBar">
                                        <div class="progressBarValue"
                                            style="width: ${volunteerDetail.percent}%"></div>
                                    </div>

                                    <!-- <span class="vol_con_bar" style="width: ${volunteerDetail.percent}%"> -->
                                        <!-- <span class="vol_con_bar_per"></span> -->
                                        <span class="tooltip"><span>${volunteerDetail.volunteerCount}</span>/${volunteerDetail.targetPeople}</span>
                                    <!-- </span> -->
                                </div>

                                <div class="vol_content">
                                    <h3>${volunteer.volunteerTitle}</h3>
                                    <div><span>모집</span><span>${volunteer.startRecruitDate}~${volunteer.endRecruitDate}</span></div>
                                </div>
                                <div class="vol_tag">
                                    <div>
                                        
                                        <span class="vol_tag_child">${volunteer.parentCategoryName}</span>
                                        
                                    </div>
                                    <div class="vol_like">
                                        <i class="xi-heart-o"></i>
                                        <p>102</p>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                       




                    </ul>








                </div>
                <div class="vol_next_prev_btn">
                    <span class="vol_prev">prev</span>
                    <span class="vol_next">next</span>
                </div>



            </section>

            <!-- ***************** 기부 section ***************** -->
            <section class="donationContainer">
                <div class="main_sub_title title_style">
                    <p>Donation</p>
                    <h3 class="sub_title">이웃을 향한 아름다운 도움의 손길</h3>
                </div>
                <div class="do_blur_box1"></div>
                <div class="do_blur_box2"></div>

                <div class="do_bigContainer">
                    <div class="best_img">
                        <span>Best</span>
                        <div class="beeImg"><img src="${pageContext.request.contextPath}/resources/images/main_img/img_bee.png" alt=""></div>
                    </div>

                    <div class="swiper-container do_box_container">



                        <ul class="swiper-wrapper doAllSlides">

                            <li class="swiper-slide do_box">


                                <div class="do_right">
                                    <div class="do_tag_container">
                                        <div class="do_tag">
                                            <span>#어린이 👧🏻</span>
                                        </div>
                                        <div class="do_like">
                                            <div><img src="${pageContext.request.contextPath}/resources/images/main_img/star_icon.png" alt=""></div>
                                            <span>5.0</span>추천해요!
                                        </div>
                                    </div>
                                    <div class="doTitle">
                                        <h3>1초등학생 방과 후 학습 멘토링 모집합니다.</h3>
                                        <div> 모집 <span>2023. 06. 12 ~ 2023. 06. 17</span> </div>
                                    </div>

                                    <div class="do_content_per">
                                        <span class="do_con_bar">
                                            <span class="do_con_bar_per"></span>
                                        </span>
                                        <span class="doTooltip"><span>14</span>/20
                                        </span>
                                    </div>

                                    <div class="percent_content">
                                        <div><img src="${pageContext.request.contextPath}/resources/images/main_img/check_icon.png" alt=""></div>곧 봉사 모집이 마감됩니다.
                                    </div>
                                </div>



                                <div class="do_left">
                                    <div class="divImg"><img src="${pageContext.request.contextPath}/resources/images/childimg.jpeg" alt=""></div>
                                </div>

                            </li>

                            <li class="swiper-slide do_box">


                                <div class="do_right">
                                    <div class="do_tag_container">
                                        <div class="do_tag">
                                            <span>#어린이 👧🏻</span>
                                        </div>
                                        <div class="do_like">
                                            <div><img src="${pageContext.request.contextPath}/resources/images/main_img/star_icon.png" alt=""></div>
                                            <span>5.0</span>추천해요!
                                        </div>
                                    </div>
                                    <div class="doTitle">
                                        <h3>2초등학생 방과 후 학습 멘토링 모집합니다.</h3>
                                        <div> 모집 <span>2023. 06. 12 ~ 2023. 06. 17</span> </div>
                                    </div>

                                    <div class="do_content_per">
                                        <span class="do_con_bar">
                                            <span class="do_con_bar_per"></span>
                                        </span>
                                        <span class="doTooltip"><span>14</span>/20
                                        </span>
                                    </div>

                                    <div class="percent_content">
                                        <div><img src="${pageContext.request.contextPath}/resources/images/main_img/check_icon.png" alt=""></div>곧 봉사 모집이 마감됩니다.
                                    </div>
                                </div>



                                <div class="do_left">
                                    <div class="divImg"><img src="${pageContext.request.contextPath}/resources/images/childimg.jpeg" alt=""></div>
                                </div>

                            </li>
                            <li class="swiper-slide do_box">


                                <div class="do_right">
                                    <div class="do_tag_container">
                                        <div class="do_tag">
                                            <span>#어린이 👧🏻</span>
                                        </div>
                                        <div class="do_like">
                                            <div><img src="${pageContext.request.contextPath}/resources/images/main_img/star_icon.png" alt=""></div>
                                            <span>5.0</span>추천해요!
                                        </div>
                                    </div>
                                    <div class="doTitle">
                                        <h3>3초등학생 방과 후 학습 멘토링 모집합니다.</h3>
                                        <div> 모집 <span>2023. 06. 12 ~ 2023. 06. 17</span> </div>
                                    </div>

                                    <div class="do_content_per">
                                        <span class="do_con_bar">
                                            <span class="do_con_bar_per"></span>
                                        </span>
                                        <span class="doTooltip"><span>14</span>/20
                                        </span>
                                    </div>

                                    <div class="percent_content">
                                        <div><img src="${pageContext.request.contextPath}/resources/images/main_img/check_icon.png" alt=""></div>곧 봉사 모집이 마감됩니다.
                                    </div>
                                </div>



                                <div class="do_left">
                                    <div class="divImg"><img src="${pageContext.request.contextPath}/resources/images/childimg.jpeg" alt=""></div>
                                </div>

                            </li>
                            <li class="swiper-slide do_box">


                                <div class="do_right">
                                    <div class="do_tag_container">
                                        <div class="do_tag">
                                            <span>#어린이 👧🏻</span>
                                        </div>
                                        <div class="do_like">
                                            <div><img src="${pageContext.request.contextPath}/resources/images/main_img/star_icon.png" alt=""></div>
                                            <span>5.0</span>추천해요!
                                        </div>
                                    </div>
                                    <div class="doTitle">
                                        <h3>4초등학생 방과 후 학습 멘토링 모집합니다.</h3>
                                        <div> 모집 <span>2023. 06. 12 ~ 2023. 06. 17</span> </div>
                                    </div>

                                    <div class="do_content_per">
                                        <span class="do_con_bar">
                                            <span class="do_con_bar_per"></span>
                                        </span>
                                        <span class="doTooltip"><span>14</span>/20
                                        </span>
                                    </div>

                                    <div class="percent_content">
                                        <div><img src="${pageContext.request.contextPath}/resources/images/main_img/check_icon.png" alt=""></div>곧 봉사 모집이 마감됩니다.
                                    </div>
                                </div>



                                <div class="do_left">
                                    <div class="divImg"><img src="${pageContext.request.contextPath}/resources/images/childimg.jpeg" alt=""></div>
                                </div>

                            </li>
                            <li class="swiper-slide do_box">


                                <div class="do_right">
                                    <div class="do_tag_container">
                                        <div class="do_tag">
                                            <span>#어린이 👧🏻</span>
                                        </div>
                                        <div class="do_like">
                                            <div><img src="${pageContext.request.contextPath}/resources/images/main_img/star_icon.png" alt=""></div>
                                            <span>5.0</span>추천해요!
                                        </div>
                                    </div>
                                    <div class="doTitle">
                                        <h3>5초등학생 방과 후 학습 멘토링 모집합니다.</h3>
                                        <div> 모집 <span>2023. 06. 12 ~ 2023. 06. 17</span> </div>
                                    </div>

                                    <div class="do_content_per">
                                        <span class="do_con_bar">
                                            <span class="do_con_bar_per"></span>
                                        </span>
                                        <span class="doTooltip"><span>14</span>/20
                                        </span>
                                    </div>

                                    <div class="percent_content">
                                        <div><img src="${pageContext.request.contextPath}/resources/images/main_img/check_icon.png" alt=""></div>곧 봉사 모집이 마감됩니다.
                                    </div>
                                </div>



                                <div class="do_left">
                                    <div class="divImg"><img src="${pageContext.request.contextPath}/resources/images/childimg.jpeg" alt=""></div>
                                </div>

                            </li>
                            <li class="swiper-slide do_box">


                                <div class="do_right">
                                    <div class="do_tag_container">
                                        <div class="do_tag">
                                            <span>#어린이 👧🏻</span>
                                        </div>
                                        <div class="do_like">
                                            <div><img src="${pageContext.request.contextPath}/resources/images/main_img/star_icon.png" alt=""></div>
                                            <span>5.0</span>추천해요!
                                        </div>
                                    </div>
                                    <div class="doTitle">
                                        <h3>6초등학생 방과 후 학습 멘토링 모집합니다.</h3>
                                        <div> 모집 <span>2023. 06. 12 ~ 2023. 06. 17</span> </div>
                                    </div>

                                    <div class="do_content_per">
                                        <span class="do_con_bar">
                                            <span class="do_con_bar_per"></span>
                                        </span>
                                        <span class="doTooltip"><span>14</span>/20
                                        </span>
                                    </div>

                                    <div class="percent_content">
                                        <div><img src="${pageContext.request.contextPath}/resources/images/main_img/check_icon.png" alt=""></div>곧 봉사 모집이 마감됩니다.
                                    </div>
                                </div>



                                <div class="do_left">
                                    <div class="divImg"><img src="${pageContext.request.contextPath}/resources/images/childimg.jpeg" alt=""></div>
                                </div>

                            </li>
                        </ul>
                    </div>





                </div>



                <div class="do_next_prev_btn">
                    <span class="swiper-button-prev do_prev">prev</span>
                    <span class="swiper-button-next do_next">next</span>
                </div>

            </section>


            <!-- 리뷰 -->
            <section class="userReview">
                <div class="main_sub_title">
                    <p>Review</p>
                    <h3 class="sub_title">참여자 후기</h3>
                </div>

                <div class="re_box_container">

                    <div class="re_box">

                        <div class="re_char">
                            <img src="${pageContext.request.contextPath}/resources/images/main_img/re_img.png" alt="">
                        </div>

                        <div class="tag_box">
                            <div><img class="imgback" src="${pageContext.request.contextPath}/resources/images/main_img/tag_box.png"></div>
                            
                        </div>
                        <div class="tag_box_context">
                            <div><img src="${pageContext.request.contextPath}/resources/images/main_img/star_icon.png"></div>
                            <span>5.0</span>
                            <span>매우 만족해요!</span>
                        </div>

                        <div class="re_content_container">
                            <span>완전 추천합니다!</span>
                            <span class="re_content">

                                갈 때 마다 어르신들이 너무 반겨 주셔서 제가 힐링받고
                                오는 곳입니다. 정말 어르신들 너무 좋으시고 추천합니다!

                            </span>
                            <div>
                                <span class="re_user_name">유정</span>
                                <span>2023. 04. 01 방문 · 재방문 2회</span>
                            </div>
                        </div>
                        <div class="re_active_info">
                            <span>활동</span>
                            <span>요양원 입소 어르신 나들이 활동 이동 보조 및 말벗 지원</span>
                        </div>

                    </div>

                    <div class="re_box">

                        <div class="re_char">
                            <img src="${pageContext.request.contextPath}/resources/images/main_img/re_img.png" alt="">
                        </div>

                        <div class="tag_box">
                            <div><img class="imgback" src="${pageContext.request.contextPath}/resources/images/main_img/tag_box.png"></div>
                            
                        </div>
                        <div class="tag_box_context">
                            <div><img src="${pageContext.request.contextPath}/resources/images/main_img/star_icon.png"></div>
                            <span>5.0</span>
                            <span>매우 만족해요!</span>
                        </div>

                        <div class="re_content_container">
                            <span>완전 추천합니다!</span>
                            <span class="re_content">

                                갈 때 마다 어르신들이 너무 반겨 주셔서 제가 힐링받고
                                오는 곳입니다. 정말 어르신들 너무 좋으시고 추천합니다!

                            </span>
                            <div>
                                <span class="re_user_name">유정</span>
                                <span>2023. 04. 01 방문 · 재방문 2회</span>
                            </div>
                        </div>
                        <div class="re_active_info">
                            <span>활동</span>
                            <span>요양원 입소 어르신 나들이 활동 이동 보조 및 말벗 지원</span>
                        </div>

                    </div>

                    <div class="re_box">

                        <div class="re_char">
                            <img src="${pageContext.request.contextPath}/resources/images/main_img/re_img.png" alt="">
                        </div>

                        <div class="tag_box">
                            <div><img class="imgback" src="${pageContext.request.contextPath}/resources/images/main_img/tag_box.png"></div>
                            
                        </div>
                        <div class="tag_box_context">
                            <div><img src="${pageContext.request.contextPath}/resources/images/main_img/star_icon.png"></div>
                            <span>5.0</span>
                            <span>매우 만족해요!</span>
                        </div>

                        <div class="re_content_container">
                            <span>완전 추천합니다!</span>
                            <span class="re_content">

                                갈 때 마다 어르신들이 너무 반겨 주셔서 제가 힐링받고
                                오는 곳입니다. 정말 어르신들 너무 좋으시고 추천합니다!

                            </span>
                            <div>
                                <span class="re_user_name">유정</span>
                                <span>2023. 04. 01 방문 · 재방문 2회</span>
                            </div>
                        </div>
                        <div class="re_active_info">
                            <span>활동</span>
                            <span>요양원 입소 어르신 나들이 활동 이동 보조 및 말벗 지원</span>
                        </div>

                    </div>
                </div>
            </section>
        </div>

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

<script>
    function getVolMoney() {
        var xhr2 = new XMLHttpRequest();
        xhr2.onreadystatechange = function() {
            if (xhr2.readyState === 4 && xhr2.status === 200) {
                var volMoney = xhr2.responseText;
                document.getElementById("volMoney").textContent = volMoney;
            }
        };
        xhr2.open("GET", "${pageContext.request.contextPath}/volMoney", true);
        xhr2.send();
    }

    getVolMoney();
    </script>
<script>
    function getVolCount() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var volCount = JSON.parse(xhr.responseText);
                document.getElementById("volCount").textContent = volCount;
            }
        };
        xhr.open("GET", "${pageContext.request.contextPath}/volCount", true);
        xhr.send();
    }

    getVolCount();
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main/main.js"></script>

</body>

</html>