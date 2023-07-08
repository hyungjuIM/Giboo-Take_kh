const item = document.getElementsByClassName("item");
const button = document.getElementsByClassName("button");
//const favoriteButton = document.getElementsByClassName("favoriteButton");
const all = document.getElementById("all");

const searchParams = new URLSearchParams(location.search);
const category = searchParams.get('category');
const categoryNo = "category" + category;
const categoryButton = document.getElementById(categoryNo);

$(document).ready(function () {
    if (category == null) {
        all.classList.add("SubCategoryChecked");
    } else {
        categoryButton.classList.add("SubCategoryChecked");
    }
})

for (let i of item) {
    i.addEventListener("mouseenter", () => {
        i.classList.add("itemFocus");
    });

    i.addEventListener("mouseleave", () => {
        i.classList.remove("itemFocus");
    });
}

for (let i of button) {
    i.addEventListener("mouseenter", () => {
        i.classList.add("buttonFocus");
        // i.firstElementChild.src = getContextPath() + "/resources/images/chevron-right-solid-white.svg";
        // console.log(getContextPath());
    });

    i.addEventListener("mouseleave", () => {
        i.classList.remove("buttonFocus");
        // i.firstElementChild.src = getContextPath() + "/resources/images/chevron-right-solid-gray.svg";
    });
}

for (let i of favoriteButton) {
    i.addEventListener("mouseenter", () => {
        i.classList.add("buttonFocus");
    });

    i.addEventListener("mouseleave", () => {
        i.classList.remove("buttonFocus");
    });
}

// window.onload = function() {
//     var favoriteButton = document.querySelector(".favoriteButton");
//     var favorited = false; // State of the button

//     favoriteButton.addEventListener('click', function() {
//         if (favorited) {
//             favoriteButton.innerHTML = '🤍'; // Set to un-favorited state
//             favoriteButton.style.color = 'black'; // Change color back to original
//             favorited = false;
//         } else {
//             favoriteButton.innerHTML = '❤️'; // Set to favorited state
//             favoriteButton.style.color = 'red'; // Change color
//             favorited = true;
//         }
//     });
// }

$(document).ready(function(){


function selectReplyList() {
    $.ajax({
        url: contextPath + "/donation/selectReplyList2",
        type: "GET",
        data: { "donationNo": donationNo },
        dataType: "JSON",
        success: function(replyList) {
            console.log("selectReplyList2 success:", replyList);

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
});
