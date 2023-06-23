const updateBtn = document.getElementById("updatebtn");
// const rateName = document.getElementsByClassName("rateName").textContent;

// const pointPrice =document.getElementsByClassName("pointPrice").textContent;

// const pointPrice ="<c:out value='${member.pointPrice}'/>";
// const rateName = "<c:out value='${member.rateName}'/>";

const rateNameElements = document.getElementsByClassName("rateName");
const pointPriceElements = document.getElementsByClassName("pointPrice");

const rateName = [];
const pointPrice = [];

// rateName 값들을 가져와서 배열에 추가
for (let i = 0; i < rateNameElements.length; i++) {
    const rateNames = rateNameElements[i].textContent;
    rateName.push(rateNames);
}

// pointPrice 값들을 가져와서 배열에 추가
for (let i = 0; i < pointPriceElements.length; i++) {
    const pointPrices = pointPriceElements[i].textContent;
    pointPrice.push(pointPrices);
}

updateBtn.addEventListener("click",function(){
    var requestData = {
        rateName: rateName,
        pointPrice: pointPrice
    };
    $.ajax({
        url: "memberRateUpdate",
        data: requestData,
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
