
// 게시글 작성 유효성 검사
function noticeWriteValidate(){
    const noticeTitle = document.getElementsByName("noticeTitle")[0];
    const noticeContent = document.querySelector("[name='noticeContent']");

    if(noticeTitle.value.trim().length == 0){
        alert("제목을 입력해주세요!!!");
        noticeTitle.value = "";
        noticeTitle.focus();
        return false;
    }

    if(noticeContent.value.trim().length == 0){
        alert("내용을 입력해주세요!!!");
        noticeContent.value = "";
        noticeContent.focus();
        return false;
    }



    return true;
}