// 유효성 검사 요부를 기록할 객체 생성

const checkObj = {
    // "signUpName" : false, 
    "signUpId": false,
    "memberEmail": false,
    "signUpw1": false, //영어, 숫자, 특수문자(!,@,#,-,_) 6~30
    "signUpw2": false,
    "signUpNickname": false, //영어, 숫자, 한글 2~10
    "signUpTel": false, //(-) 제외 -> 숫자만
    "cNumber": false,
    "sendEmail": false
};

//이메일 유효성 검사 
const memberEmail = document.getElementById("memberEmail");
const emailMessage = document.getElementById("emailMessage");

memberEmail.addEventListener("input", function () {

    //입력이 되지 않은 경우
    if (memberEmail.value.length == 0) {
        emailMessage.innerText = "이메일을 입력해주세요.";
        emailMessage.classList.remove("confirm", "error");
        checkObj.memberEmail = false; //유효 x 기록
        return;
    }

    const regExp = /^[\w\.\_\-]{4,}@[\w\-\_]+(\.\w+){1,3}$/;
    if (regExp.test(memberEmail.value)) {
        $.ajax({
            url: "emailDupCheck",
            data: { "memberEmail": memberEmail.value },
            type: "GET",
            success: function (result) {
                if (result == 1) { //중복 O
                    emailMessage.innerText = "이미 사용 중인 이메일입니다.";
                    emailMessage.classList.remove("confirm");
                    emailMessage.classList.add("error");
                    checkObj.log(result);
                } else {
                    emailMessage.innerText = "사용 가능한 이메일입니다.";
                    emailMessage.classList.remove("error");
                    emailMessage.classList.add("confirm");
                    checkObj.memberEmail = true;
                }
            },
            error: function () {
                console.log("에러 발생");

            }
        });
    } else {
        emailMessage.innerText = "유효한 이메일 형식이 아닙니다.";
        emailMessage.classList.remove("confirm");
        emailMessage.classList.add("error");

        checkObj.memberEmail = false;

    }
});

// 이메일 인증하기
const sendBtn = document.getElementById("cBtn");
const cMessage = document.getElementById("emailCfMessage");

//타이머에 사용될 변수
let checkInterval;
let min = 4;
let sec = 59;

sendBtn.addEventListener("click", function () {

    if (checkObj.memberEmail) { //유효한 이메일이 작성되어 있을 경우에만 메일 보내기

        $.ajax({
            url: "sendEmail",
            data: { "memberEmail": memberEmail.value },
            type: "GET",
            success: function (result) {
                console.log("이메일 발송 성공");
                console.log(result);

                //인증 버튼이 클릭되어 정상적으로 메일이 보내졌음을 checkobj에 기록
                checkObj.sendEmail = true;
            },
            error: function () {
                console.log("이메일 발송 실패")
            }
        });

        cMessage.innerText = "5:00";
        min = 4;
        sec = 59;

        cMessage.classList.remove("confirm");
        cMessage.classList.remove("error");

        checkInterval = setInterval(function () {
            if (sec < 10) sec = "0" + sec;
            cMessage.innerText = min + ":" + sec;

            if (Number(sec) === 0) {
                min--;
                sec = 59;
            } else {
                sec--;
            }
            if (min === -1) { //만료
                cMessage.classList.add("error");
                cMessage.innerText = "인증번호가 만료되었습니다.";

                clearInterval(checkInterval);
            }
        }, 1000);

        alert("인증번호가 발송되었습니다. 이메일을 확인해주세요.")
    }
});

//인증번호 확인 클릭시에 대한 동작
const cNumber = document.getElementById("cNumber");
const cBtn = document.getElementById("McBtn");

cBtn.addEventListener("click", function () {
    // 1. 인증번호 받기 버튼이 클릭되어 이메일 발송되었는지 확인
    if (checkObj.sendEmail) {
        // 2. 입력된 인증번호가 6자리인지 확인
        if (cNumber.value.length == 6) {
            $.ajax({
                url: "checkNumber",
                data: {
                    "memberEmail": memberEmail.value,
                    "cNumber": cNumber.value
                },
                type: "GET",
                success: function (result) {
                    console.log(result);
                    // 1: 인증번호 O, 시간 만족 O
                    // 2: 인증번호 O, 시간 만족 X
                    // 3: 인증번호 x, 시간 만족 X

                    if (result == 1) {
                        clearInterval(checkInterval); // 타이머 멈춤

                        cMessage.innerText = "인증되었습니다.";
                        cMessage.classList.add("confirm");
                        cMessage.classList.remove("error");
                        checkObj.cNumber = true;
                    } else if (result == 2) {
                        alert("만료된 인증 번호입니다.");
                        checkObj.cNumber = false;
                    } else {
                        alert("인증 번호가 일치하지 않습니다.");
                        checkObj.cNumber = false;
                    }
                },
                error: function () {
                    console.log("이메일 인증 실패");
                    checkObj.cNumber = false;
                }
            });
        } else { // 6자리 아님
            alert("인증번호를 정확하게 입력해주세요.");
            checkObj.cNumber = false;
            cNumber.focus();
        }
    } else { // 인증번호를 안받은 경우
        alert("인증번호 받기 버튼을 먼저 클릭해주세요.");
        checkObj.cNumber = false;
    }
});


//비밀번호 확인

//필요한 요소 name=memberPw id=signUpw1 / id=signUpw1Message / id=signUpw2 / id=signUpw2Message

const pwMessage = document.getElementById("signUpw1Message");
const pwConfirmMessage = document.getElementById("signUpw2Message");
const memberPw = document.getElementById("signUpw1");
const memberPwConfirm = document.getElementById("signUpw2");

memberPw.addEventListener("input", function () {
    if (memberPw.value.length == 0) {
        pwMessage.innerText = "영어, 숫자, 특수문자(!,@,#,-,_) 6~30글자 사이로 입력해주세요.";

        pwMessage.classList.remove("confirm", "error");
        checkObj.signUpw1 = false; //유효 x 기록
    }

    //입력조건 
    const pwExp = /^[\w\!\@\#\-\_]{6,30}/;
    if (pwExp.test(memberPw.value)) {
        console.log("올바른 형식");
        pwMessage.classList.remove("error");
        pwMessage.innerText = "올바른 비밀번호 형식입니다.";
        pwMessage.classList.add("confirm");
        checkObj.signUpw1 = true;
    } else {
        console.log("비밀번호 입력 실패");
        pwMessage.classList.remove("confirm");
        pwMessage.innerText = "잘못된 비밀번호 형식입니다.";
        pwMessage.classList.add("error");
        checkObj.signUpw1 = false;
    }
});

//비밀번호 확인
memberPwConfirm.addEventListener("input", function () {
    if (memberPw.value == memberPwConfirm.value) {
        pwConfirmMessage.innerText = "비밀번호 일치";
        pwConfirmMessage.classList.add("confirm");
        pwConfirmMessage.classList.remove("error");
        checkObj.signUpw2 = true;
    } else {
        pwConfirmMessage.innerText = "비밀번호 입력 실패";
        pwConfirmMessage.classList.remove("confirm");
        pwConfirmMessage.classList.add("error");
        checkObj.signUpw2 = false;
    }
})

// 닉네임
const memberNickname = document.getElementById("signUpNickname");
const nicknameMessage = document.getElementById("signUpNicknameMessage");

memberNickname.addEventListener("input", function () {
    if (memberNickname.value.length == 0) {
        nicknameMessage.innerText = "영어/숫자/한글 2~10글자 사이로 입력해주세요."
        nicknameMessage.classList.remove("confirm", "error");
        checkObj.signUpNickname = false; //유효 x 기록
        return;
    }

    //정규식 생성
    const nickExp = /^[a-zA-Z0-9가-힣]{2,10}$/;
    if (nickExp.test(memberNickname.value)) { //유효한 경우

        // 닉네임 중복 검사(ajax)
        //member/nicknameDupCheck

        $.ajax({

            url: "nicknameDupCheck",
            data: { "memberNick": memberNickname.value },
            type: "GET",

            success: function (result) {

                if (result == 0) {// 닉네임 중복 x

                    nicknameMessage.innerText = "사용 가능한 닉네임 입니다.";
                    nicknameMessage.classList.add("confirm");
                    nicknameMessage.classList.remove("error");
                    checkObj.signUpNickname = true; //유효 o  기록

                } else {// 닉네임 중복 o

                    nicknameMessage.innerText = "이미 사용중인 닉네임 입니다.";
                    nicknameMessage.classList.add("error");
                    nicknameMessage.classList.remove("confirm");
                    checkObj.signUpNickname = false; //유효 o  기록

                }
            },
            error: function () { //비동기 통신 에러
                console.log("에러 발생");
            }
        });


    } else {

        nicknameMessage.innerText = "닉네임 형식이 유효하지 않습니다.";
        nicknameMessage.classList.add("error");
        nicknameMessage.classList.remove("confirm");
        checkObj.signUpNickname = false; //유효 x 기록

    }

});

//전화번호
const memberTel = document.getElementById("signUpTel");
const telMessage = document.getElementById("signUpTelMessage");

memberTel.addEventListener("input", function () {
    if (memberTel.value.length == 0) {
        telMessage.innerText = "전화번호를 입력해주세요.(- 제외)";
        telMessage.classList.remove("confirm", "error");
        checkObj.signUpTel = false;
        return;
    }

    const telExp = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

    if (telExp.test(memberTel.value)) {
        telMessage.innerText = "사용 가능한 전화번호입니다.";
        telMessage.classList.remove("error");
        telMessage.classList.add("confirm");
        checkObj.signUpTel = true;
    } else {
        telMessage.innerText = "올바른 전화번호가 아닙니다.";
        telMessage.classList.add("error");
        telMessage.classList.remove("confirm");
        checkObj.signUpTel = false;
    }
});

// 아이디
const memberId = document.getElementById("signUpId");
const idMessage = document.getElementById("idMessage");

memberId.addEventListener("input", function () {
    if (memberId.value.length == 0) {
        idMessage.innerText = "영어/숫자/한글 2~20글자 사이로 입력해주세요.";
        idMessage.classList.remove("confirm", "error");
        checkObj.signUpId = false;
        return;
    }
    //정규식 생성
    const idExp = /^[a-zA-Z0-9가-힣]{2,20}$/;
    if (idExp.test(memberId.value)) {

        // 아이디 중복 검사 
        $.ajax({
            url: "IdDupCheck",
            data: { "memberId": memberId.value },
            type: "GET",

            success: function (result) {

                if (result == 0) { //닉네임중복 x
                    idMessage.innerText = "사용 가능한 아이디 입니다.";
                    idMessage.classList.add("confirm");
                    idMessage.classList.remove("error");
                    checkObj.signUpId = true;

                } else { //닉네임중복 o
                    idMessage.innerText = "이미 사용중인 아이디입니다.";
                    idMessage.classList.add("error");
                    idMessage.classList.remove("confirm");
                    checkObj.signUpId = false;
                }
            },

            error: function () {
                console.log("에러 발생")
            }
        });


    } else {
        idMessage.innerText = "아이디 형식이 유효하지 않습니다.";
        idMessage.classList.add("error");
        idMessage.classList.remove("confirm");
        checkObj.signUpId = false;
    }
});

// 주소

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수


            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
        }
    }).open();
}

// 회원가입 버튼 클릭 시 유효성 검사가 완료 되었는지 확인하는 함수
function signUpValidate() {

    // checkObj에 있는 모든 속성 반복 접근
    //false가 하나라도 있는 경우 form태그 기본 이벤트 제거

    let str;

    for (let key in checkObj) { //객체용 향상된 for문

        //현재 접근 중인 key의 value가  false인 경우
        if (!checkObj[key]) {

            //현재 접근 중인 key의  value가 false인 경우
            if (!checkObj[key]) {

                switch (key) {
                    case "signUpId": str = "아이디가"; break;
                    case "memberEmail": str = "이메일이"; break;
                    case "signUpw1": str = "비밀번호가"; break;
                    case "signUpw2": str = "비밀번호 확인이"; break;
                    case "signUpNickname": str = "닉네임이"; break;
                    case "signUpTel": str = "전화번호가"; break;
                    case "cNumber": str = "인증번호가"; break;
                    case "sendEmail": str = "인증번호 전송이"; break;
                }

                str += "유효하지 않습니다.";

                alert(str);

                document.getElementById(key).focus();
                return false;
            }



        }

        alert("회원가입이 완료되었습니다. 로그인을 진행해주세요 :)");
        return true;

    }

}
