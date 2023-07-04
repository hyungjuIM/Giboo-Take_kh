const volunteerButton = document.getElementById("volunteerButton");
const grayBox = document.getElementById("grayBox");
const volunteerSubmitContainer = document.getElementById("volunteerSubmitContainer");

$(function(){
    $('.relatedItemList').slick({
        slide: "div",        //슬라이드 되어야 할 태그
        infinite : true,     //무한 반복 옵션
        slidesToShow : 3,        // 한 화면에 보여질 컨텐츠 개수
        slidesToScroll : 1,        //스크롤 한번에 움직일 컨텐츠 개수
        speed : 500,     // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
        arrows : true,         // 옆으로 이동하는 화살표 표시 여부
        dots : false,         // 스크롤바 아래 점으로 페이지네이션 여부
        autoplay : false,            // 자동 스크롤 사용 여부
        autoplaySpeed : 2000,         // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
        pauseOnHover : true,        // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
        vertical : false,        // 세로 방향 슬라이드 옵션
        prevArrow : $("#prev"),
        nextArrow : $("#next"),
        draggable : false,     //드래그 가능 여부
        responsive: [ // 반응형 웹 구현 옵션
            {
                breakpoint: 960, //화면 사이즈 960px
                settings: {
                    slidesToShow: 4
                }
            },
            {
                breakpoint: 768, //화면 사이즈 768px
                settings: {
                    slidesToShow: 5
                }
            }
        ]

    });
})


//봉사 참여 버튼
const volunteerButton = document.getElementById("volunteerButton");
volunteerButton.addEventListener('click',function(){
    $.ajax({
        url : "doVolunteer",
        method : 'POST',
    })
});

// 응원하기 버튼
const cheeringButton = document.getElementById("cheeringButton");
cheeringButton.addEventListener("click", function() {

    $.ajax({
        url : 'cheering',
        method: 'POST',
        data : "memberNo" : ${loginMember.memberNo},
                
    })


})


