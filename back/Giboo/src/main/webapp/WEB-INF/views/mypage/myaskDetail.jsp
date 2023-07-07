<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>hunny</title>



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/myaskDetail.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/reset.css">


<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
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
			<span>나의 문의내역 상세페이지</span>
		</div>

		<div class="mypage-container">
			<div class="mypage_wrapper">
				<!-- 1200*800 -->

				<!--왼쪽 네비바 틀-->
				<header>
					<jsp:include page="/WEB-INF/views/mypage/mypage_side.jsp" />
				</header>
				<!-- ---------------------------------------------------------------------- -->
				<!--오른쪽 나의 문의내역 본문-->
				<div class="myaskdetail_content_area">
					<section class="myaskdetail_mainContainer">
						<div class="myaskdetail_mainContent">
							<section class="myaskdetail_notice">

								<!-- myaskDetail area -->
								<div class="myaskdetail_notice1">
									<div class="myaskdetail_container1">
										<span style="color: #767676;">Giboo&Take에</span><span
											style="color: #00CA61;"> 문의한 내역</span><span
											style="color: #767676;">에 대한 상세페이지 입니다 😇</span>
									</div>
								</div>

								<!-- 제목 area -->
								<div class="myaskdetail_title-date-container">
									<div class="myaskdetail_1_detailTitle">유기견 봉사활동은 언제
										진행되나요?</div>
									<div class="myaskdetail_title-date-container_2">
										<div class="myaskdetail_1_nupdateN">작성일</div>
										<div class="myaskdetail_1_nupdateDT">2023.05.04</div>
									</div>
								</div>

								<!-- 질문 컨테이너 -->
								<div class="myaskdetail_detailContent">
									<div class="myask_replyContent">
										<div class="myask_detailContent_title">문의내용</div>
									</div>
									<div class="myask_detailContent_content">
										안녕하세요 <br> 유기견 봉사활동은 장소, 일정, 내용에 대해서 궁금해요
									</div>
								</div>

								<!-- 답글 부분 컨테이너 -->
								<div class="replyContent">
									<div class="myask_replyContent">
										<div class="myask_detailContent_title">
											<i class="fa-solid fa-check"></i> &nbsp&nbsp 답변
										</div>
										<div class="myask_detailContent_title_2">유기견 봉사 활동 단체</div>
									</div>
									<div class="myask_detailContent_content2">
										안녕하세요 Giboo&Take 봉사자님! <br> 유기견 봉사활동은 매주 일요일 오전
										10:00~16:00까지 진행됩니다.<br> 해당 내용은 봉사활동 상세내역을 통해 확인할 수 있으며<br>
										추가 문의사항 있으시면 언제든지 연락주세요.<br> 관심가져주셔서 감사합니다.
									</div>

								</div>

								<!-- 다른도움이 필요하신가요 영역 -->
								<div class="myaskdetail_submitContainer">
									<div class="myask_help">
										<span class="myask_otherhelp">다른 도움이 필요하신가요? 💁‍♀️</span>
									</div>
									<button class="myask_newask">새 문의 남기기</button>
									<button class="myask_chat">채팅 상담하기</button>
								</div>
						</div>

					</section>
				</div>
				</section>

			</div>
			<!-- myask_content_area -->

		</div>
		<!-- mypage_wrapper -->
		</div>
		<!-- mypage-container -->
	</main>



	<!-- 푸터 영역 -->
<footer>
    <jsp:include page="/WEB-INF/views/main/footer.jsp" />
</footer>

</body>

</html>