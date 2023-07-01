<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


			<!DOCTYPE html>
			<html lang="en">

			<head>
				<meta charset="UTF-8">
				<meta http-equiv="X-UA-Compatible" content="IE=edge">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<title>noticeDtail</title>
				<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/reset.css" />
				<link rel="stylesheet"
					href="${pageContext.request.contextPath}/resources/css/notice/noticeDetail.css" />


				<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
					integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
					crossorigin="anonymous" referrerpolicy="no-referrer" />

				<!-- jQuery 라이브러리 추가(CDN) -->
				<script src="https://code.jquery.com/jquery-3.6.0.min.js"
					integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>


				<script src="https://kit.fontawesome.com/50a1d35924.js" crossorigin="anonymous"></script>
			</head>

			<body>
				<header>
					<jsp:include page="/WEB-INF/views/main/header.jsp" />
				</header>

				<main>
					<div class="page-title">
						<span>공지사항</span>
					</div>
					<section class="mainContainer">
						<div class="mainContent">
							<section class="notice">

								<!-- notice area -->
								<div class="notice">
									<div class="container1">
										<span style="color: #767676;">Giboo&Take 서비스의</span><span
											style="color: #8071FC;"> 신규</span><span style="color: #767676;">
											및</span> <span style="color: #8071FC;"> 업데이트 소식</span><span
											style="color: #767676;">을 알려드립니다 😇</span>
									</div>

									<!-- 제목 area -->
									<div class="title-date-container">
										<div class="detailTitle">${noticeDetail.noticeTitle}</div>
										<div class="nupdateDT">작성일 ${noticeDetail.enrollDt}</div>
									</div>

									<!-- 본문 -->
									<div class="detailContent">
										<!-- ${noticeDetail.noticeContent} -->
										<c:out value="${noticeDetail.noticeContent}" escapeXml="false" />

									</div>

									<!-- 이전 부분 컨테이너 -->
									<div class="nextContentContainer">
										<div class="next">이전</div>
										<div class="nextTitle">
											<a href="#">2023년 기부금 영수증 발급을 위해 꼭 확인하세요!</a>
										</div>
										<div class="nextDate">2023.05.05</div>
									</div>
									<div class="nextContentContainer">
										<div class="next">다음</div>
										<div class="nextTitle">
											<a href="#">Giboo&Take DB작업으로 인한 서비스 일시 중단 안내 (4/30 23시 ~
												10/6 03시)</a>
										</div>
										<div class="nextDate">2023.04.29</div>
									</div>

									<!-- 목록 알림 등록 취소 영역 -->
									<div class="submitContainer">
										<button class="listBack" onclick="history.back();" >목록으로</button>
										<c:choose>
											<c:when test="${!empty sessionScope.loginManager}">
												<button class="update"
													onclick="location.href='${pageContext.request.contextPath}/notice/noticeWrite?mode=update&cp=${cp}&no=${noticeDetail.noticeNo}'">수정</button>
												<button id="deleteBtn" class="delete">삭제</button>
											</c:when>
										</c:choose>
									</div>

								</div>
							</section>
						</div>
					</section>

				</main>
				<!-- 푸터 영역 -->
				<footer>
					<jsp:include page="/WEB-INF/views/main/footer.jsp" />
				</footer>
				<script>
					// 최상위 주소
					const contextPath = "${contextPath}";

					// 게시글 번호
					const noticeNo = "${noticeDetail.noticeNo}"; // "500"


					const cp = "${cp}";

					// 로그인한 회원 번호
					const loginManagerNo = "${loginManager.managerNo}";
				</script>
				<script src="${pageContext.request.contextPath}/resources/js/notice/noticeDetail.js"></script>
			</body>

			</html>