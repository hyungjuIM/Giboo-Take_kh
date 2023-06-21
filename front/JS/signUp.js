// 유효성 검사 요부를 기록할 객체 생성

const checkObj = {
    // "signUpName" : false, 
    "signUpId": false,
    "signUpEmail": false,
    "signUpw1": false, //영어, 숫자, 특수문자(!,@,#,-,_) 6~30
    "signUpw2": false,
    "signUpNickname": false, //영어, 숫자, 한글 2~10
    "signUpTel": false, //(-) 제외 -> 숫자만
    "cNumber": false,
    "sendEmail": false
};

//이메일 유효성 검사 
const signUpEmail = document.getElementById("memberEmail");
const emailMessage = document.getElementById("emailMessage");

signUpEmail.addEventListener("input", function () {

    //입력이 되지 않은 경우
    if (signUpEmail.value.length == 0) {
        emailMessage.innerText = "이메일을 입력해주세요.";
        emailMessage.classList.remove("confirm", "error");
        checkObj.signUpEmail = false; //유효 x 기록
        return;
    }

    const regExp = /^[\w\.\_\-]{4,}@[\w\-\_]+(\.\w+){1,3}$/;
    if (regExp.test(signUpEmail.value)) {
        $.ajax({
            url: "emailDupCheck",
            data: { "memberEmail": signUpEmail.value },
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
                    checkObj.signUpEmail = true;
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

        checkObj.signUpEmail = false;

    }
});

// 이메일 인증하기
const sendBtn = document.getElementById("McBtn");
const cMessage = document.getElementById("emailCfMessage");

//타이머에 사용될 변수
let checkInterval;
let min = 4;
let sec = 59;

sendBtn.addEventListener("click", function(){

    if(checkObj.memberEmail){ //유효한 이메일이 작성되어 있을 경우에만 메일 보내기

        $.ajax({
            url: "sendEmail",
            data: {"memberEmail": memberEmail.value},
            type: "GET",
            success: function(result){
                console.log("이메일 발송 성공");
                console.log(result);

                //인증 버튼이 클릭되어 정상적으로 메일이 보내졌음을 checkobj에 기록
                checkObj.sendEmail = true;
            },
            error:function(){
                console.log("이메일 발송 실패")
            }
        });

        cMessage.innerText = "5:00";
        min = 4;
        sec = 59;

        cMessage.classList.remove("confirm");
        cMessage.classList.remove("error");

        checkInterval = setInterval(function(){
            if(sec < 10) sec = "0" + sec;
            cMessage.innerText = min + ":" + sec;

            if(Number(sec) === 0){
                min--;
                sec = 59;
            }else{
                sec--;
            }
            if(min === -1){ //만료
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

cBtn.addEventListener("click", function(){
    //1. 인증번호 받기 버튼이 클릭되어 이메일 발송되었는지 확인
    if(checkObj.sendEmail){
        //2.입력된 인증번호가 6자리인지 확인
        if(cNumber.value.length == 6) {

            $.ajax({
                url: "checkNumber",
                data: {
                    "memberEmail": memberEmail.value,
                    "cNumber" : cNumber.value
                },
                type: "GET",
                success: function(result){
                    console.log(result);
                    //1: 인증번호 O, 시간 만족 O
                    //2: 인증번호 O, 시간 만족 X
                    //3: 인증번호 x, 시간 만족 X

                    if(result == 1){
                        clearInterval(checkInterval); //타이머 멈춤

                        cMessage.innerText = "인증되었습니다.";
                        cMessage.classList.add("confirm");
                        cMessage.classList.remove("error");
                        checkObj.cNumber = true;
                    } else if (result == 2){
                        alert("완료된 인증 번호 입니다.");
                        checkObj.cNumber = false;
                    } else {
                        alert("인증 번호가 일치하지 않습니다.");
                        checkObj.cNumber = false;
                    }
                },

                error:function(){
                    console.log("이메일 인증 실패");
                    checkObj.cNumber = false;
                }
            });
        } else { //6자리 아님
            alert("인증번호를 정확하게 입력해주세요.");
            checkObj.cNumber = false;
            cNumber.focus();

        }
    } else { //인증번호를 안받은 경우
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
        checkObj.memberPw = false; //유효 x 기록
    }

    //입력조건 
    const pwExp = /^[\w\!\@\#\-\_]{6,30}/;
    if (pwExp.test(memberPw.value)) {
        console.log("올바른 형식");
        pwMessage.classList.remove("error");
        pwMessage.innerText = "올바른 비밀번호 형식입니다.";
        pwMessage.classList.add("confirm");
        checkObj.memberPw = true;
    } else {
        console.log("비밀번호 입력 실패");
        pwMessage.classList.remove("confirm");
        pwMessage.innerText = "잘못된 비밀번호 형식입니다.";
        pwMessage.classList.add("error");
        checkObj.memberPw = false;
    }
});

//비밀번호 확인
memberPwConfirm.addEventListener("input", function () {
    if (memberPw.value == memberPwConfirm.value) {
        pwConfirmMessage.innerText = "비밀번호 일치";
        pwConfirmMessage.classList.add("confirm");
        pwConfirmMessage.classList.remove("error");
        checkObj.memberPwConfirm = true;
    } else {
        pwConfirmMessage.innerText = "비밀번호 입력 실패";
        pwConfirmMessage.classList.remove("confirm");
        pwConfirmMessage.classList.add("error");
        checkObj.memberPwConfirm = false;
    }
})

// 닉네임
const memberNickname = document.getElementById("signUpNickname");
const nicknameMessage = document.getElementById("signUpNicknameMessage");

memberNickname.addEventListener("input", function () {
    if (memberNickname.value.length == 0) {
        nicknameMessage.innerText = "영어/숫자/한글 2~10글자 사이로 입력해주세요."
        nicknameMessage.classList.remove("confirm", "error");
        checkObj.memberNickname = false; //유효 x 기록
        return;
    }

    //정규식 생성
    const nickExp = /^[a-zA-Z0-9가-힣]{2,10}$/;
    if (nickExp.test(memberNickname.value)) { //유효한 경우

        nicknameMessage.innerText = "사용 가능한 닉네임 입니다.";
        nicknameMessage.classList.add("confirm");
        nicknameMessage.classList.remove("error");
        checkObj.memberNickname = true; //유효 o  기록
    } else {

        nicknameMessage.innerText = "닉네임 형식이 유효하지 않습니다.";
        nicknameMessage.classList.add("error");
        nicknameMessage.classList.remove("confirm");
        checkObj.memberNickname = false; //유효 x 기록

    }

})

//전화번호
const memberTel = document.getElementById("signUpTel");
const telMessage = document.getElementById("signUpTelMessage");

memberTel.addEventListener("input", function () {
    if (memberTel.value.length == 0) {
        telMessage.innerText = "전화번호를 입력해주세요.(- 제외)";
        telMessage.classList.remove("confirm", "error");
        checkObj.memberTel = false;
        return;
    }

    const telExp = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

    if (telExp.test(memberTel.value)) {
        telMessage.innerText = "사용 가능한 전화번호입니다.";
        telMessage.classList.remove("error");
        telMessage.classList.add("confirm");
        checkObj.memberTel = true;
    } else {
        telMessage.innerText = "올바른 전화번호가 아닙니다.";
        telMessage.classList.add("error");
        telMessage.classList.remove("confirm");
        checkObj.memberTel = false;
    }
});

// 아이디
const memberId = document.getElementById("signUpId");
const idMessage = document.getElementById("idMessage");

memberId.addEventListener("input", function () {
    if (memberId.value.length == 0) {
        idMessage.innerText = "영어/숫자/한글 2~20글자 사이로 입력해주세요.";
        idMessage.classList.remove("confirm", "error");
        checkObj.memberId = false;
        return;
    }
    //정규식 생성
    const idExp = /^[a-zA-Z0-9가-힣]{2,20}$/;
    if (idExp.test(memberId.value)) {
        idMessage.innerText = "사용 가능한 아이디 입니다.";
        idMessage.classList.add("confirm");
        idMessage.classList.remove("error");
        checkObj.memberId = true;

    } else {
        idMessage.innerText = "아이디 형식이 유효하지 않습니다.";
        idMessage.classList.add("error");
        idMessage.classList.remove("confirm");
        checkObj.memberId = false;
    }
})

// 주소

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if (data.userSelectedType === 'R') {
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                //     // 건물명이 있고, 공동주택일 경우 추가한다.
                //     if(data.buildingName !== '' && data.apartment === 'Y'){
                //         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                //     }
                //     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                //     if(extraAddr !== ''){
                //         extraAddr = ' (' + extraAddr + ')';
                //     }
                //     // 조합된 참고항목을 해당 필드에 넣는다.
                //     document.getElementById("sample6_extraAddress").value = extraAddr;

                // } else {
                //     document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}