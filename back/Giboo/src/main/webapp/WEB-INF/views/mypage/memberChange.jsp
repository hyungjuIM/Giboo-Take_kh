<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 문자열 관련 함수(메서드) 제공 JSTL (EL형식으로 작성) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보수정</title>



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/memberChange.css">
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
			<span>회원정보수정</span>
		</div>

		<div class="mypage-container">
			<div class="mypage_wrapper">

				<header>
					<jsp:include page="/WEB-INF/views/mypage/mypage_side.jsp" />
				</header>



				<div class="myask_content_area memberChange_content_area">
					<section class="mainContainer memberChange_mainContainer">
						<div class="mainContent memberChange_mainContent">
							<section class="notice">

								<div class="memberChange_notice">
									<div class="memberChange_container1">
										<span style="color: #767676;">Giboo&Take서비스의 봉사자(기부자)님의
											<span style="color: #00CA61;"> 회원정보수정 </span>에 대해 알려드립니다 😇
										</span>
									</div>

									<form action="memberChange" method="POST" name="myPage-form"
										onsubmit="return infoValidate()">

										<div class="memberChange_Con">

											<div class="memberChange_title">

												<span class="memberChange_con1">이메일</span> <span
													class="memberChange_con2">
													<div>${loginMember.memberEmail}</div>
												</span>

											</div>
											<div class="memberChange_title">
												<span class="memberChange_con1">이름</span> <span
													class="memberChange_con2"> <input type="text"
													name="updateName" id="memberName"
													value="${loginMember.memberName}" maxlength="10">
												</span>
											</div>
											<div class="memberChange_title">
												<span class="memberChange_con1">닉네임</span> <span
													class="memberChange_con2"> <input type="text"
													name="updateNickname" id="memberNickname"
													value="${loginMember.memberNick}" maxlength="10">
												</span>
											</div>
											<div class="messageContainer">
												<span class="changeMessage">영어/숫자/한글 2~10글자 사이로
													입력해주세요.</span>
											</div>

											<div class="memberChange_title">
												<span class="memberChange_con1">휴대폰번호</span> <span
													class="memberChange_con2"> <input type="text"
													name="updateTel" id="memberTel"
													value="${loginMember.memberTel}" maxlength="11">
												</span>
											</div>

											<div class="messageContainer">
												<span class="changeMessage">전화번호를 입력해주세요.(- 제외)</span>
											</div>

										 <!-- 주소 -->
                                    <div class="memberChange_address">

                                        <div class="adderess_first">
                                            <div class="memberChange_con1 add_style">
                                                <span class="memberChange_con1">주소</span>
                                            </div>

                                            <div class="memberChange_con2_area memberChange_con2 notAddress">
                                                <input type="text" name="updateAddress" id="postcode" value="${addr[0]}"
                                                    maxlength="6" class="">

                                            </div>
                                            <button class="notInput" type="button" id="info-address-btn"
                                                onclick="execDaumPostcode()">검색</button>

                                        </div>
                                        <div class="addr_container_2">
                                            <div class="memberChange_con2">
                                                <input type="text" name="updateAddress" id="address" value="${addr[1]}">

                                            </div>

                                            <div class="memberChange_con2">
                                                <input type="text" name="updateAddress" id="detailAddress"
                                                    value="${addr[2]}">
                                            </div>
                                        </div>
                                    </div>
                                </div>


											 <div class="memberChange_bottom">
                                    <div>
                                        <button class="memberChange_b">수정완료</button>
                                        <button class="memberChange_b">이전으로</button>
                                    </div>
                                    <div>
                                        <span class="memberChange_w_c">회원탈퇴를 원하시면 회원탈퇴 버튼을 눌러주세요</span>
                                        <button class="memberChange_w">
                                            <a href="#none">회원탈퇴</a>
                                        </button> </span>
                                    </div>
                                </div>
					</section>
				</div>
				</section>
			</div>


		</div>
		</div>



	</main>


	<!-- 푸터 영역 -->
	<footer>
		<jsp:include page="/WEB-INF/views/main/footer.jsp" />
	</footer>

	<%-- 다음 주소 API --%>
	<div id="layer"
		style="display: none; position: fixed; overflow: hidden; z-index: 11; -webkit-overflow-scrolling: touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
			id="btnCloseLayer"
			style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
			onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/js/mypage/memberChange.js"></script>





</body>

</html>