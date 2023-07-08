<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 스템프</title>




<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/myactive_1.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/stamp/stampMyPage.css">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
	<header>
		<jsp:include page="/WEB-INF/views/main/header.jsp" />
	</header>

	<main>
		<div class="page-title">
			<span>나의 스탬프</span>
		</div>

		<div class="mypage-container">
			<div class="mypage_wrapper">
				<header>
					<jsp:include page="/WEB-INF/views/mypage/mypage_side.jsp" />
				</header>

				<!--오른쪽 나의 문의내역 본문-->
				<div class="myask_content_area  menu_box_container">
					<section class="mainContainer main">
						<div class="mainContent">
							<section class="notice">
								<!-- notice seach area -->
								<!--  container1 -->
								<div class="notice1">
									<div class="container1">
										<span style="color: #767676;">Giboo&Take서비스의 봉사자(기부자)님의
											<span style="color: #00CA61;"> 스탬프 내역 </span>을(를) 알려드립니다 😇
										</span>
                                    </div>
                                </div>
                            </section>
                            <div class="stampWrap">
                                <div class="stampBox">
                                  <div class="stampCount">
                                    <div>총 개수</div>
                                    <div class="stampCountValue">0</div>
                                  </div>
                                    <ul class="stampUl">
                                        <li class="stampLi">
                                            <div class="stampDiv">
                                            </div>
                                        </li>         
                                    </ul>
                                </div>
                            </div>
							<div class="stampDe">
								<span>😆 이벤트 참여시 스템프 1개 적립!</span>
								<br><br>
								<span>🙆‍♀️ 스템프 10개 모으면 포인트 적립!</span>
								<br><br>
								<span>🙆 스템프 목록은 이벤트 상세 페이지와 마이페이지 '나의 스템프'에서 확인할 수 있어요.</span>
							</div>
						</div>
					</section>
				</div>
			</div>
			<%-- myask_content_area --%>
		</div>
		<%-- mypage_wrapper  --%>
		</div>
		<%-- mypage-container  --%>
	</main>

	<!-- 푸터 영역 -->
	<footer>
		<jsp:include page="/WEB-INF/views/main/footer.jsp" />
	</footer>


    <script>
        // 댓글 관련 JS 코드에 필요한 값을 전역 변수로 선언

        // jsp 파일 : html, css, js, el, jstl 사용 가능
        // js  파일 : js

        // 코드 해석 순서  :   EL == JSTL > HTML > JS

        // ** JS 코드에서 EL/JSTL을 작성하게 된다면 반드시 ""를 양쪽에 추가 **

        // 최상위 주소
        const contextPath = "${pageContext.request.contextPath}";


        // 로그인한 회원 번호
        const loginMemberNo = "${loginMember.memberNo}";
        // -> 로그인 O  : "10";
        // -> 로그인 X  : "";  (빈문자열)
        
        //이벤트페이지의 이벤트번호
        const eventNo = "${eventDetailTop.eventNo}";

    </script>

<script src="${pageContext.request.contextPath}/resources/js/mypage/stamp.js"></script>

</body>
</html>