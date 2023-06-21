const updateBtn = document.getElementById("updatebtn");
const rateName=document.getElementsByClassName("rateName");
const pointPrice =document.getElementsByClassName("pointPrice");



updateBtn.addEventListener("click",function(){
    $.ajax({
        url: "memberRateUpdate",
        data: {"rateName" : rateName.value,
                "pointPrice": pointPrice.value},
        type : "GET",
        success: function(result){
            console.log(result);
            location.reload(); 
        },
        error : function(){
            console.log("에러발생")
        }
    })
});

// $(document).ready(function() {
//     $("#updatebtn").click(function() {
//         var memberNos = [];

//         $(".listArea").each(function() {
//             memberNos.push($(this).find(".memberNo").text());
//         });

//         // 서버로 모든 멤버 번호들을 전송하여 등급 업데이트 실행
//         $.ajax({
//             url: "/memberRateUpdate",
//             type: "GET",
//             data: { memberNos: memberNos },
//             success: function(response) {
//                 location.reload(); 
//             },
//             error: function(xhr, status, error) {
//                 // 업데이트 실패 시 처리 로직
//             }
//         });
//     });

//     // 기타 필요한 JavaScript 로직 추가
// });
