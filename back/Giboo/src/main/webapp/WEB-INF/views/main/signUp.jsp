<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>회원가입</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/reset.css">

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

                            <!-- 이름 -->
                            <div class="signUpName">
                                <span><i class="fa-regular fa-user"></i></span>
                                <input type="text" id="signUpName" class="int" name="memberName" max="20"
                                    placeholder="사용자 이름">
                            </div>


                            <!-- 아이디 -->
                            <div class="signUpId">
                                <span><i class="fa-regular fa-circle-user"></i></span>
                                <input type="text" id="signUpId" name="memberID" class="id" maxlength="20"
                                    placeholder="사용자 아이디">
                            </div>

                            <!-- 이메일 -->
                            <div class="messageBox">

                                <div class="signUpMessageBox">
                                    <span><i class="fa-solid fa-at"></i></span>
                                    <input type="text" id="signUpEmail" class="email" name="memberEmail" maxlength="50"
                                        placeholder="이메일">
                                    <button id="cBtn">인증받기</button>
                                </div>

                                <span class="signUpMessage" id="emailMessage"> 이메일이 올바르지 않습니다.</span>
                            </div>

                            <!-- 이메일 인증번호 -->
                            <div class="signUpMessageBox">
                                <div class="signUpMessageBoxC">
                                    <span><i class="fa-regular fa-envelope"></i></span>
                                    <input type="text" id="cNumber" class="emailCF" maxlength="20"
                                        placeholder="인증번호 확인">
                                    <button id="McBtn">인증하기</button>
                                </div>

                                <span class="signUpMessage" id="emailCfMessage">인증번호를 입력해주세요.</span>
                            </div>

                            <!-- PW1 -->
                            <div class="signUpPw1">
                                <div class="signUpPw1Box">
                                    <span><i class="fa-solid fa-fingerprint"></i></span>
                                    <input type="password" id="signUpw1" name="memberPw" class="int" maxlength="30"
                                        placeholder="비밀번호">
                                </div>
                                <span class="signUpw1Message" id="signUpw1Message">영어, 숫자, 특수문자(!,@,#,-,_) 6~30글자 사이로
                                    작성해주세요.</span>
                            </div>

                            <!-- pw2 -->
                            <div class="signUpPw2">
                                <div class="signUpPw2Box">
                                    <span><i class="fa-solid fa-lock"></i></span>
                                    <input type="text" id="signUpw2" class="int" placeholder="비밀번호 확인">
                                </div>
                                <span class="signUpw2Message" id="signUpw2Message">비밀번호가 일치하지 않습니다.</span>
                            </div>

                            <!-- 닉네임 -->
                            <div class="signUpNickname">
                                <div class="signUpNicknameBox">
                                    <span><i class="fa-regular fa-face-kiss-wink-heart"></i></span>
                                    <input type="text" id="signUpNickname" name="memberNick" class="nick" maxlength="10"
                                        placeholder="닉네임 확인">
                                </div>
                                <span class="signUpNicknameMessage" id="signUpNicknameMessage">영어/숫자/한글 2~10글자 사이로
                                    작성해주세요.</span>
                            </div>

                            <!-- 전화번호 -->
                            <div class="signUpTel">
                                <span><i class="fa-solid fa-phone"></i></span>
                                <input type="tel" id="signUpTel" name="memberTel" class="int" maxlength="12"
                                    placeholder="전화번호(-없이 숫자만 입력)">
                            </div>

                            <!-- 주소 -->
                            <div class="signUpAdd">
                                <span><i class="fa-solid fa-house"></i></span>
                                <input type="text" id="signUpAdd" name="memberAddr" class="int" maxlength="50"
                                    placeholder="주소">
                                <button id="signUpAdBtn" onclick="sample5_execDaumPostcode()">주소찾기</button>
                            </div>

                            <!-- join Btn -->
                            <div class="singUpBtnnBox">
                                <button class="singUpBtnn">회원가입</button>
                            </div>
                        </form>
                    </div>
                </section>
            </main>






            <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
            <script>
                $(function () {
                    var include1 = $('[data-include1="header"]');
                    jQuery.each(include1, function () {
                        $(this).load('/html/01.header.html');
                    });
                });
            </script>

            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

            <script>
                function sample5_execDaumPostcode() {
                    new daum.Postcode({
                        oncomplete: function (data) {
                            var addr = data.address; // 최종 주소 변수

                            // 주소 정보를 해당 필드에 넣는다.
                            document.getElementById("signUpAdd").value = addr;
                        }
                    }).open();
                }
            </script>

        </body>

        </html>