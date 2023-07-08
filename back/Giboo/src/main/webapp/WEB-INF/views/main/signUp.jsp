<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">


        
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>hunny</title>
            <!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/reset.css"> -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/signUp.css">


        </head>

        <body>
            <header>
                <jsp:include page="/WEB-INF/views/main/header.jsp" />
            </header>


            <main>
                <section class="signUpSection">
                    <div class="signUpContainer">
                        <div class="signUpTitle">
                            <span>회원가입</span>
                        </div>

                        <form action="signUp" method="POST" id="signUpForm" onsubmit="return signUpValidate()"
                            autocomplete="off">
							
							<%-- memberType(사용자Y, 운영자N) --%>
							<div class="signUpInput_Container_box">

                                <div class="signUpName signUpInput_Container ">
                                    <span><i class="fa-regular fa-user"></i></span>

                                    <input class="memberTy" type="radio" name="memberType" value="user" checked> <span>사용자</span>
                                    <input class="memberTy" type="radio" name="memberType" value="admin"><span>운영자</span>
                                   

                                </div>


                            </div>
							
							
                            <!-- 이름 -->
                            <div class="signUpInput_Container_box">

                                <div class="signUpName signUpInput_Container ">
                                    <span><i class="fa-regular fa-user"></i></span>
                                    <input type="text" id="signUpName" class="int" name="memberName" max="20"
                                        placeholder="사용자 이름">
                                </div>

                            </div>


                            <!-- 아이디 -->
                            <div class="signUpInput_Container_box">
                                <div class="signUpId signUpInput_Container">
                                    <span><i class="fa-regular fa-circle-user"></i></span>
                                    <input type="text" id="signUpId" name="memberId" class="id" maxlength="20"
                                        placeholder="사용자 아이디">
                                </div>
                                <span id="idMessage">영어/숫자/한글 2~20글자 사이로 입력해주세요.</span>
                            </div>

                            <!-- 이메일 -->
                            <div class="messageBox signUpInput_Container_box">

                                <div class="signUpMessageBox signUpInput_Container">
                                    <span><i class="fa-solid fa-at"></i></span>
                                    <input type="email" id="memberEmail" class="email" name="memberEmail" maxlength="50"
                                        placeholder="이메일" required>
                                    <button type="button" id="cBtn">인증받기</button>
                                </div>

                                <span class="signUpMessage" id="emailMessage"> 인증번호를 받을 이메일을 입력해주세요.</span>
                            </div>

                            <!-- 이메일 인증번호 -->
                            <div class="signUpMessageBox signUpInput_Container_box">
                                <div class="signUpMessageBoxC signUpInput_Container">
                                    <span><i class="fa-regular fa-envelope"></i></span>
                                    <input type="text" id="cNumber" class="emailCF" maxlength="20"
                                        placeholder="인증번호 확인">
                                    <button type="button" id="McBtn">인증하기</button>
                                </div>

                                <span class="signUpMessage" id="emailCfMessage">인증번호를 입력해주세요.</span>
                            </div>



                            <!-- PW1 -->
                            <div class="signUpPw1 signUpInput_Container_box">
                                <div class="signUpPw1Box signUpInput_Container">
                                    <span><i class="fa-solid fa-fingerprint"></i></span>

                                    <input type="password" id="signUpw1" name="memberPw" class="int" maxlength="30"
                                        placeholder="비밀번호">

                                </div>
                                <span class="signUpw1Message" id="signUpw1Message">영어, 숫자, 특수문자(!,@,#,-,_) 6~30글자 사이로
                                    입력해주세요.</span>
                            </div>

                            <!-- pw2 -->
                            <div class="signUpPw2 signUpInput_Container_box">
                                <div class="signUpPw2Box signUpInput_Container">
                                    <span><i class="fa-solid fa-lock"></i></span>
                                    <input type="password" id="signUpw2" class="int" placeholder="비밀번호 확인">
                                </div>
                                <span class="signUpw2Message" id="signUpw2Message">비밀번호가 일치하지 않습니다.</span>
                            </div>

                            <!-- 닉네임 -->
                            <div class="signUpNickname signUpInput_Container_box">
                                <div class="signUpNicknameBox signUpInput_Container">
                                    <span><i class="fa-regular fa-face-kiss-wink-heart"></i></span>
                                    <input type="text" id="signUpNickname" name="memberNick" class="nick" maxlength="10"
                                        placeholder="닉네임 확인">
                                </div>
                                <span class="signUpNicknameMessage" id="signUpNicknameMessage">영어/숫자/한글 2~10글자 사이로
                                    입력해주세요.</span>
                            </div>

                            <!-- 전화번호 -->
                            <div class="signUpTel signUpInput_Container_box">
                                <div class="singUpTelBox signUpInput_Container">
                                    <span><i class="fa-solid fa-phone"></i></span>
                                    <input type="tel" id="signUpTel" name="memberTel" class="int" maxlength="12"
                                        placeholder="전화번호(-없이 숫자만 입력)">
                                </div>

                                <span id="signUpTelMessage">전화번호를 입력해주세요.(- 제외)</span>
                            </div>


                            <!--  주소 -->



                            <div class="signUpInput_addrContainer_box">
                                <div class="signUp-input-area signUpInput_addrContainer ">

                                    <div class="addr_box01">
                                        <input type="text" id="sample4_postcode" name="memberAddr" placeholder="우편번호"
                                            maxlength="6">

                                        <button type="button" onclick="return sample4_execDaumPostcode()"
                                            value="우편번호 찾기">검색</button>
                                    </div>


                                    <div class="signUp-input-area addr_box02">
                                        <input type="text" id="sample4_roadAddress" name="memberAddr"
                                            placeholder="도로명주소">
                                    </div>

                                    <div class="signUp-input-area addr_box02">
                                        <input type="text" id="sample4_detailAddress" name="memberAddr"
                                            placeholder="상세주소">

                                    </div>
                                </div>
                            </div>

                            <!-- 주소
                            <div class="signUpAdd">
                                <span><i class="fa-solid fa-house"></i></span>
                                <input type="text" id="signUpAdd" name="memberAddr" class="int" maxlength="50"
                                    placeholder="주소">
                                <button id="signUpAdBtn" onclick="sample5_execDaumPostcode()">주소찾기</button>
                            </div> -->

                            <!-- join Btn -->
                            <div class="singUpBtnnBox">
                                <button class="singUpBtnn" type="submit" id="btnJoin">회원가입</button>
                            </div>
                        </form>
                    </div>
                </section>
            </main>








            
            <script src="${pageContext.request.contextPath}/resources/js/main/signUp.js"></script>
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

        </body>

        </html>