// 아이디 저장 체크박스가 체크 되었을 때 이벤트 처리

// radio, checkbox 체크 시 change 이벤트 발생
if(document.getElementById("saveId")  != null){ 
    document.getElementById("saveId").addEventListener("change", function(){
    
        // 체크 여부 확인
        console.log(this.checked)
        // this : change 이벤트가 발생한 요소(체크박스)
        // 체크박스요소.checked   :  체크 여부 반환(true/false)
    
        // 체크박스요소.checked = true;  : 체크박스 체크
        // 체크박스요소.checked = false; : 체크박스 체크 해제
    
    
        if( this.checked ){ // 체크박스가 체크된 경우
    
            const str = "개인 정보 보호를 위해 개인 PC에서의 사용을 권장합니다. 개인 PC가 아닌 경우 취소를 눌러주세요.";
    
            //confirm(str) // 확인(true) / 취소(false) 대화상자
    
            if( !confirm(str)  ){ // 취소를 눌렀을 때
                this.checked = false; // 체크 해제
            }
        }
    
    
    });
}    
