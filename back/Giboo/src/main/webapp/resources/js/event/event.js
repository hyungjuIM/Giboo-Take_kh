// 참여하기 버튼 눌렀을 때
const E_popup2 = document.getElementById("E_popup2");

popup_submit2.addEventListener("click", function(){ // 참여하기 버튼이 클릭이 되었을 때

    // 1) 로그인이 되어있나? -> 전역변수 loginMemberNo 이용
    if(loginMemberNo == ""){ // 로그인 X
        alert("로그인 후 이용해주세요.");
        return;
    }
});



// 등록
const popup_submit2 = document.getElementById("popup_submit2");
const popupContent = document.getElementById("popupContent");

popup_submit2.addEventListener("click", function(){ // 등록 버튼이 클릭이 되었을 때
    
    // 내용이 작성되어 있나?
    if(popupContent.ariaValueMax.trim().length == 0){ // 미작성인 경우
        alert("내용을 작성한 후 등록 버튼을 클릭해주세요.")

        popupContent.value = ""; // 띄어쓰기, 개행문자 제거 (?)
        popupContent.focus();
        return;
    }


    // 1) FormData 객체 생성
    const formData = new FormData();

    // 2) 데이터 추가
    formData.append("popupContent", popupContent.value);
    formData.append("memberNo", loginMemberNo);
    formData.append("eventNo", eventNo);

    // 3) 선택된 사진 파일이 있는 경우 FormData 객체에 추가
    if (popupPhoto.files.length > 0) {
        const file = popupPhoto.files[0];
        const newFileName = fileRename(file.name);
        formData.append("popupPhoto", file, newFileName);
    }


    // AJAX 이용해서 팝업 내용 DB에 저장(INSERT)
    $.ajax({
        url : contextPath + "/eventPopup/insert",
        data : {"popupContent" : popupContent.value,
                "memberNo" : loginMemberNo,
                "eventNo" : eventNo },
        type : "post",
        processData: false,
        contentType: false,
        success : function(result){

            if(result > 0){ // 등록 성공
                alert("등록되었습니다.");

            } else { // 실패
                alert("등록에 실패했습니다...");
            }

        },

        error : function(req, status, error){
            console.log("댓글 등록 실패")
            console.log(req.responseText);
        }
    });
});