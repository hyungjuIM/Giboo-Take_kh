$(document).ready(function(){

const volunteerButton = document.getElementById("volunteerButton");
const grayBox = document.getElementById("grayBox");
const volunteerSubmitContainer = document.getElementById("volunteerSubmitContainer");

// $(function(){
//     $('.relatedItemList').slick({
//         slide: "div",        //슬라이드 되어야 할 태그
//         infinite : true,     //무한 반복 옵션
//         slidesToShow : 3,        // 한 화면에 보여질 컨텐츠 개수
//         slidesToScroll : 1,        //스크롤 한번에 움직일 컨텐츠 개수
//         speed : 500,     // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
//         arrows : true,         // 옆으로 이동하는 화살표 표시 여부
//         dots : false,         // 스크롤바 아래 점으로 페이지네이션 여부
//         autoplay : false,            // 자동 스크롤 사용 여부
//         autoplaySpeed : 2000,         // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
//         pauseOnHover : true,        // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
//         vertical : false,        // 세로 방향 슬라이드 옵션
//         prevArrow : $("#prev"),
//         nextArrow : $("#next"),
//         draggable : false,     //드래그 가능 여부
//         responsive: [ // 반응형 웹 구현 옵션
//             {
//                 breakpoint: 960, //화면 사이즈 960px
//                 settings: {
//                     slidesToShow: 4
//                 }
//             },
//             {
//                 breakpoint: 768, //화면 사이즈 768px
//                 settings: {
//                     slidesToShow: 5
//                 }
//             }
//         ]

//     });
// })


//프로필 이미지 슬라이드

// new Swiper('.relatedAreaInner', {

//     slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
//     spaceBetween : 10, // 슬라이드간 간격
//     slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
  
//     // 그룹수가 맞지 않을 경우 빈칸으로 메우기
//     // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
//     loopFillGroupWithBlank : false,
//    // loopAdditionalSlides : 1,
//     loop : true, // 무한 반복
  
//     // pagination : { // 페이징
//     //    el : '.relatedAreaInner',
//     //    clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
//     // },
//     navigation : { // 네비게이션
//        nextEl : '.swiper-button-next2', // 다음 버튼 클래스명
//        prevEl : '.swiper-button-prev2', // 이번 버튼 클래스명
//     },
//   });



//봉사 참여 버튼
//const volunteerButton = document.getElementById("volunteerButton");
volunteerButton.addEventListener('click',function(){
    $.ajax({
        url : "doVolunteer",
        method : 'POST',
    })
});
// volunteerButton.addEventListener('click',function(){
//     if(${!empty loginMember}){
//         alert("봉사 참여를 하시겠습니까?")
//         $.ajax({
//             url : "doVolunteer",
//             type : "POST",
//             success : function(){
//                 console.log("봉사 참여 완료");
//                 alert("봉사 참여가 완료 되었습니다.")
//             },
//             error: function(){
//                 console.log("봉사참여 실패")
//             }
//         })
//     }else{
//         alert("로그인이 필요한 서비스 입니다.");
//         location.href = "../../main/login";
//     }
// });







function selectReplyList() {
    $.ajax({
        url: contextPath + "/volunteer/selectReplyList",
        type: "GET",
        data: { "volunteerNo": volunteerNo },
        dataType: "JSON",
        success: function(replyList) {
            console.log("selectReplyList success:", replyList);

            const commentUl = document.querySelector(".commentUl");
            commentUl.innerHTML = "";

            // 중복 제거를 위한 Set 생성
            const memberNoSet = new Set();

            for (let reply of replyList) {

                if (!memberNoSet.has(reply.memberNo)) {
                    memberNoSet.add(reply.memberNo); // 회원 번호를 Set에 추가
                }

                const replyRow = document.createElement("li");
                replyRow.classList.add("commentLi");
    
                const commentItem = document.createElement("div");
                commentItem.classList.add("commentItem");
    
                const memberImgArea = document.createElement("div");
                memberImgArea.classList.add("memberImgArea");

                const memberImg = document.createElement("img");
                memberImg.id = "memberImg1";
                memberImg.classList.add("memberImg");
                
                if (reply.profileImg && reply.profileImg.trim().length > 0) {
                    memberImg.src = contextPath + reply.profileImg;
                } else {
                    memberImg.src = contextPath + "/resources/images/dog_emoji.png";
                }

                memberImgArea.appendChild(memberImg);
                commentItem.appendChild(memberImgArea);
    
                const commentInner = document.createElement("div");
                commentInner.classList.add("commentInner");
    
                const memberNick = document.createElement("div");
                memberNick.id = "memberNick";
                memberNick.classList.add("memberNick");
                memberNick.textContent = reply.memberNick; // 수정된 부분
    
                const comment = document.createElement("div");
                comment.id = "comment1";
                comment.classList.add("comment");
                comment.textContent = reply.replyContent;
    
                commentInner.appendChild(memberNick);
                commentInner.appendChild(comment);
                commentItem.appendChild(commentInner);
    
                replyRow.appendChild(commentItem);
                commentUl.appendChild(replyRow);
            }
            const memberCount = memberNoSet.size; // 중복을 제외한 회원 수

            // 회원 수 업데이트
            const commentCount = document.getElementById("commentCount");
            commentCount.textContent = memberCount;
        },
        error: function(req, status, error) {
            console.log("selectReplyList error:", error);
        }
    });

}

const cheeringButton = document.getElementById("cheeringButton");
const replyContent = document.getElementById("replyContent");

cheeringButton.addEventListener("click", function(){ // 댓글 등록 버튼이 클릭이 되었을 때

    // 1) 로그인이 되어있나? -> 전역변수 loginMemberNo 이용
    if(loginMemberNo == ""){ // 로그인 X
        alert("로그인 후 이용해주세요.");
        return;
    }

    // 2) 댓글 내용이 작성되어있나?
    if(replyContent.value.trim().length == 0){ // 미작성인 경우
        alert("댓글을 작성한 후 버튼을 클릭해주세요.");

        replyContent.value = ""; // 띄어쓰기, 개행문자 제거
        replyContent.focus();
        return;
    }

    // 3) AJAX를 이용해서 댓글 내용 DB에 저장(INSERT)
    $.ajax({
        url : contextPath + "/volunteer/replyInsert",
        data : {"replyContent" : replyContent.value,
                "memberNo" : loginMemberNo,
                "volunteerNo" : volunteerNo },
        type : "post",
        success : function(result){

            if(result > 0){ // 등록 성공
                alert("댓글이 등록되었습니다.");

                replyContent.value = ""; // 작성했던 댓글 삭제

                selectReplyList(); // 비동기 댓글 목록 조회 함수 호출
                // -> 새로운 댓글이 추가되어짐

            } else { // 실패
                alert("댓글 등록에 실패했습니다...");
            }

        },

        error : function(req, status, error){
            console.log("댓글 등록 실패")
            console.log(req.responseText);
        }
    });

});

selectReplyList();


});

