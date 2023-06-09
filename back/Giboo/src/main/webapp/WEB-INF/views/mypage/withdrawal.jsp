<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴</title>

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/withdrawal.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/reset.css">

    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
        integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
    <!-- 헤더 영역 -->
    <header>
        <jsp:include page="/WEB-INF/views/main/header.jsp" />
    </header>

     <main>
        <div class="page-title">
            <span>회원탈퇴</span>
        </div>

        <div class="mypage-container">
            <div class="mypage_wrapper"> <!-- 1200*800 -->

                <!--왼쪽 네비바 틀-->
                <nav class="mypage_nav_area">
                    <div class="mypage_summary_container">
          
                      <div class="mypage_profileEmojiContainer">
                        <div class="mypage_profileEmojiTheme ">🥳</div>
                      </div>
                      <div class="mypage_hiuser">고마운분</div>
                      <div class="userName">000님, 안녕하세요🥳 </div>
          
          
                      <!--왼쪽 네비바 메뉴 -->
                      <nav class="mypage_content_container">
                        <ul class="mypage_content_first">
                          <li><a href="#">회원정보수정</a></li>
                          
                          <li><a href="#">즐겨찾기</a></li>
                          
                        </ul>
                        <hr>
                        <div class="mypage_content_second">
                          <ul>
                            <li><a href="../myPage/myactive.html">나의 활동</a></li>
                            <li><a href="../myPage/myactive.html">나의 문의</a></li>
                            <li><a href="../myPage/myask.html">나의 리뷰</a></li>
          
                          </ul>
                        </div>
                        <hr>
                        <div class="mypage_content_third">
                          <button>로그아웃</button>
                        </div>
                      </nav> <!--mypage_content_container-->
                    </div> <!-- mypage_summary_container-->
                  </nav> <!--mypage_nav_area-->

                <!--오른쪽 회원탈퇴 본문-->
                <div class="withdrawal_content_area">
                    <section class="withdrawal_mainContainer">
                        <div class="withdrawal_mainContent">
                            <section class="withdrawal_notice">

                                <!-- notice seach area -->
                                <div class="withdrawal_notice1">
                                    <div class="withdrawal_container1">
                                        <span style="color: #767676;">Giboo&Take서비스의 봉사자(기부자)님의</span><span
                                            style="color: #8071FC;">
                                            회원탈퇴</span><span style="color: #767676;">에 대해 알려드립니다 😇</span>
                                    </div>

                                    <div class="withdrawal_container">
                                        <div class="withdrawal_title1">회원탈퇴</div>
                                        <div class="withdrawal_content1">
                                            Giboo&take 를 아끼고 사랑해주신신 시간에 감사드립니다.<br>
                                            기부자(봉사자)님이 느끼셨을 점을 저희에게 공유해주시면 <br>
                                            더욱 건강한 서비스를 제공할 수 있는 Giboo&take 가 되도록 노력하겠습니다.<br>
                                        </div>
                                        <div class="withdrawal_hr">
                                            <hr>
                                        </div>
                                        <div class="withdrawal_title2">
                                            회원탈퇴를 원하시는 이유를 모두 골라주세요
                                        </div>
                                        <div class="withdrawal_content2">
                                            <fieldset>
                                                <label for="reason1">
                                                    <input type="checkbox" id="reason1" name="withdrawal_reason"
                                                        value="reason1">
                                                    사이트 방문을 잘 하지 않아요
                                                </label><br>
                                                <label for="reason2">
                                                    <input type="checkbox" id="reason2" name="withdrawal_reason"
                                                        value="reason2">
                                                    사이트 오류가 생겨서 쓸 수가 없어요
                                                </label><br>
                                                <label for="reason3">
                                                    <input type="checkbox" id="reason3" name="withdrawal_reason"
                                                        value="reason3">
                                                    개인정보 보안이 걱정돼요
                                                </label><br>
                                                <label for="reason4">
                                                    <input type="checkbox" id="reason4" name="withdrawal_reason"
                                                        value="reason4">
                                                    사이트 사용법이 어려워요
                                                </label><br>
                                                <label for="reason5">
                                                    <input type="checkbox" id="reason5" name="withdrawal_reason"
                                                        value="reason5">
                                                    다른 사이트가 더 좋아요
                                                </label><br>
                                                <label for="reason6">
                                                    <input type="checkbox" id="reason6" name="withdrawal_reason"
                                                        value="reason6">
                                                    사이트 내용이 불만이에요
                                                </label><br>
                                                <label for="reason7">
                                                    <input type="checkbox" id="reason7" name="withdrawal_reason"
                                                        value="reason7">
                                                    기타
                                                </label>
                                            </fieldset>
                                        </div>
                                        <div class="withdrawal_title3_container">
                                            <div class="withdrawal_title3">
                                                <span style="color: #000000;">회원탈퇴 전 아래</span>
                                                <span style="color: #8071FC">안내사항</span>
                                                <span style="color: #000000;">을 꼭 확인해주세요</span>
                                            </div>
                                            <div class="withdrawal_content3">
                                                회원탈퇴 후 재가입시에는 신규가입으로 처리되며, 탈퇴 시 적립된 포인트는 소멸됩니다.<br>
                                                <span style="color: #8071FC">탈퇴시점 후로부터 30일 이내 재가입이 불가합니다.</span>
                                            </div>
                                            <div class="withdrawal_content4">
                                                <button class="withdrawal_content4_button" id="back">이전으로</button>
                                                <button class="withdrawal_content4_button" id="withdrawal">회원탈퇴</button>
                                                
                                            </div>
                                        </div>

                                        <div class="popup_wrap">

                                            <div class="popup-cont01">
                                                <div class="popupMark"><i class="fa-solid fa-exclamation"></i></div>
                                                <div> 탈퇴시점으로부터 30일 이내 재가입이 불가합니다<br>
                                                    정말 Giboo & take 를 회원탈퇴 하시겠습니까?   
                                                </div>
                                                <hr>
                                                <div class="popup_cont02">
                                                    <button id="popup_close">취소</button>
                                                    <button id="popup_withdrawal">회원탈퇴</a></button>   
                                                </div>


                                            </div>

                                        </div>

                                        <div class="mask"></div>
                                    </div>




                                </div>
                        </div>
                    </section>

                </div>
                </section>

            </div> <!-- myask_content_area -->

        </div> <!-- mypage_wrapper -->
        </div> <!-- mypage-container -->
    </main>


    <!-- 푸터 영역 -->
    <header>
        <jsp:include page="/WEB-INF/views/main/footer.jsp" />
    </header>

    <script src="${pageContext.request.contextPath}/resources/js/mypage/withdrawal.js"></script>
</body>

</html>