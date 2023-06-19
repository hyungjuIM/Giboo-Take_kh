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
const signUpEmail = document.getElementById("signUpEmail");
const emailMessage = document.getElementById("emailMessage");

signUpEmail.addEventListener("input", function () {

    //입력이 되지 않은 경우
    if (signUpEmail.ariaValueMax.length == 0) {
        emailMessage.innerText = "이메일을 올바르지 않습니다."

        emailMessage.classList.remove("confirm", "error");
        checkObj.signUpEmail = false; //유효x 기록
        return;
    }

    const regExp = /^[\w\.\_\-]{4,}@[\w\-\_]+(\.\w+){1,3}$/;
    if (regExp.test(signUpEmail.value)) {
        $.ajax({
            url: "emailDupCheck",
            //현재 주소 : /comm/member/signUp
            //상대 경로 : /comm/member/emailDupCheck

            data: { "memberEmail": signUpEmail.value },
            type: "GET",

            success: function (resultult) {

                //매개변수 resultult : servlet에서 출력된 result 값이 담겨있음
                //console.log(resultult);

                if (resultult == 1) {//중복O
                    emailMessage.innerText = "이미 사용중인 이메일 입니다.";
                    emailMessage.classList.add("error");
                    emailMessage.classList.remove("confirm");
                    checkObj.signUpEmail = false; //유효 x 기록
                } else {//중복 x
                    emailMessage.innerText = "사용 가능한 이메일 입니다.";
                    emailMessage.classList.add("confirm");
                    emailMessage.classList.remove("error");
                    checkObj.signUpEmail = true; //유효 o 기록
                }
            },
            error: function () {
                console.log("에러발생");
            }
        });
    } else {
        emailMessage.innerText = "이메일 형식이 유효하지 않습니다."
        emailMessage.classList.add("error");
        emailMessage.classList.remove("confirm");

        checkObj.signUpEmail = false; //유효 x 기록
    }
});

const sendBtn = document.getElementById("cBtn");
const cMessage = document.getElementById("emailCfMessage");

//타이머
let checkInterval;
let min = 4;
let sec = 59;

sendBtn.addEventListener("click", function () {
    if (checkObj.signUpEmail) { //유효한 이메일을 작성했을 경우 인증번호 보내기

        $.ajax({
            url: "sendEmail",
            data: { "memberEmail": signUpEmail.value },
            type: "GET",
            success: function (resultult) {
                console.log("이메일 발송 성공");
                console.log(resultult);

                //인증 버튼이 클릭되어 정상적으로 메일이 보내졌음을 checkObj에 기록
                checkObj.sendEmail = true;
            },
            error: function () {
                console.log("이메일 발송 실패")
            }
        });

        //비동기 가 느리므로 지연 시간 후 함수를 수행하도록 타이머 
        cMessage.innerText = "5:00"; //초기값 5분
        min = 4;
        sec = 59;

        cMessage.classList.remove("confirm");
        cMessage.classList.remove("error");

        //변수에 저장해야 멈출 수 있음
        checkInterval = setInterval(function () {
            if (sec < 10) sec = "0" + sec;
            cMessage.innerText = min + ":" + sec;

            if (Number(sec) === 0) {
                min--;
                sec = 59;
            } else {
                sec--;
            }

            if (min === -1) {
                만료
                cMessage.classList.add("error");
                cMessage.innerText = "인증번호가 만료되었습니다.";

                clearInterval(checkInterval);
            }
        }, 1000); //1초 지연 후 수행

        alert("인증번호가 발송되었습니다. 이메일을 확인해주세요.");

    }
});

//인증번호 확인 클릭시에 대한 동작
const cNumber = document.getElementById("cNumber");
const cBtn = document.getElementById("McBtn");

cBtn.addEventListener("click", function () {
    //1.인증번호 받기 버튼이 클릭되어 이메일이 발송되었는지 확인
    if (checkObj.sendEmail) {
        //2. 입력된 인증번호가 6자리가 맞는지 확인
        if (cNumber.value.length == 6) {
            $.ajax({
                url: "checkNumber",
                data: {
                    "memberEmail": signUpEmail.value,
                    "cNumber": cNumber.value
                },
                type: "GET",
                success: function (resultult) {
                    console.log(resultult);
                    //1:인증번호 일치 O, 시간 만족 O
                    //2:인증번호 일치 O, 시간 만족 X
                    //3:인증번호 일치 X, 시간 만족 X

                    if (resultult == 1) {
                        clearInterval(checkInterval); //타이머 멈춤

                        cMessage.innerText = "인증되었습니다.";
                        cMessage.classList.add("confirm");
                        cMessage.classList.remove("error");
                        checkObj.cNumber = true;
                    } else if (resultult == 2) {
                        alert("만료된 인증 번호 입니다.");
                        checkObj.cNumber = false;
                    } else { //3
                        alert("인증 번호가 일치하지 않습니다.");
                        checkObj.cNumber = false;
                    }
                },
                error: function () {
                    console.log("이메일 인증 실패")
                    checkObj.cNumber = false
                }


            });
        } else {//6자리 아님
            alert("인증번호가 일치하지 않습니다.");
            checkObj.cNumber = false;
            cNumber.focus();
        }

    } else { //인증번호를 받지 않은 경우
        alert("인증하기 버튼을 먼저 클릭해주세요.");
        checkObj.cNumber = false;
    }
});
