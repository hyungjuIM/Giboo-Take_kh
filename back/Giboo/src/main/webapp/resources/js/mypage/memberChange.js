//내정보 수정 유효성 검사
function infoValidate() {
    const memberNick = document.getElementById("MemberNick");
    const memberTel = document.getElementById("MemberTel");
    const currentPw = document.getElementById("currentPw")[0];
    const newPw = document.getElementById("newPw")[0];
    const newPwConfirm = document.getElementById("newPwConfirm")[0];

    const regExp1 = /^[a-zA-Z0-9가-힣]{2,10}$/; //닉네임 정규식
    const regExp2 = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/; //전화번호 정규식
    const regExp3 =  /^[\w\!\@\#\-\_]{6,30}/; //비밀번호 정규식

    // 닉네임 유효성 검사
    if(memberNick.ariaValueMax.length == 0) { //미작성시 : 닉네임을 입력해주세요.
        alert("닉네임을 입력해주세요");
        memberNick.focus();
        return false;
    }

    if(!regExp1.test(memberNick.value)) { //유효하지 않은 닉네임
        alert("닉네임은 영어/숫자/한글 2~10 글자 사이로 입력해주세요.");
        memberNick.focus();
        return false;
    }

    //전화번호 유효성 검사
    if(memberTel.vlaue.length == 0){ //미작성 시
        return printAlert(memberTel, "전화번호를 입력해주세요.(- 제외)");
    }

    if(!regExp2.test(memberTel.value)) { //유효하지 않은 경우
        return printAlert(memberTel, "전화번호가 올바르지 않습니다.");

    }

    // 비밀번호 변경 제출 시 유효성 검사
    if(currentPw.value.trim().length == 0){
        return printAlert(currentPw, "현재 비밀번호를 입력해주세요.");
    }

    //새 비밀번호
    //미작성
    if(newPw.value.trim().length == 0){
        return(newPW, "새 비밀번호를 입력해주세요.");
    }

    //유효하지 않은 경우
    if(!regExp3.test(newPw.value)){
        return(newPw, "영어/숫자/특수문자(!,@,#,-,_) 6~30 글자 사이로 작성해주세요.");
    }

    //새 비밀번호 확인
    //미작성
    if(newPwConfirm.vlaue.trim().length == 0){
        return printAlert(newPwConfirm, "새 비밀번호 확인을 입력해주세요.");
    }

    //새 비밀번호 != 새 비밀번호 확인
    if(newPw.value != newPwConfirm.value){
        return printAlert(newPwConfirm, "새 비밀번호가 일치하지 않습니다.");
    }

    return true; //true를 반환해서 form 제출

}


//경고 출력 _ 포커스 +  false 반환 함수
function printAlert(el, message){ //매개변수 el은 요소
    alert(message);
    el.focus();
    return false;
}


