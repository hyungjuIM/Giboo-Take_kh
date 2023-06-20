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

        },
        error : function(){
            console.log("에러발생")
        }
    })
});