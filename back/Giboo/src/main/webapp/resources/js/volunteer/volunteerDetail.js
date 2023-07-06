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

new Swiper('.relatedAreaInner', {

    slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
    spaceBetween : 10, // 슬라이드간 간격
    slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
  
    // 그룹수가 맞지 않을 경우 빈칸으로 메우기
    // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
    loopFillGroupWithBlank : false,
   // loopAdditionalSlides : 1,
    loop : true, // 무한 반복
  
    // pagination : { // 페이징
    //    el : '.relatedAreaInner',
    //    clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
    // },
    navigation : { // 네비게이션
       nextEl : '.swiper-button-next2', // 다음 버튼 클래스명
       prevEl : '.swiper-button-prev2', // 이번 버튼 클래스명
    },
  });



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


});





