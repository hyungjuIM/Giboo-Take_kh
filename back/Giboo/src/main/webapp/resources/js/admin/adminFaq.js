const sideMenu = document.getElementsByClassName("sideMenuItem");
const resetSearch = document.getElementById("resetSearch");
const crateFaq = document.getElementById("crateFaq");
const detail = document.getElementsByClassName("detail");
const remove = document.getElementsByClassName("remove");

for (const i of sideMenu) {
    i.addEventListener("mouseover", () => {
        i.classList.add("sideMenuFocus");
    });

    i.addEventListener("mouseleave", () => {
        i.classList.remove("sideMenuFocus");
    });
}

resetSearch.addEventListener("mouseover", (e) => {
    e.target.classList.add("focus");
});

resetSearch.addEventListener("mouseleave", (e) => {
    e.target.classList.remove("focus");
});

crateFaq.addEventListener("mouseover", (e) => {
    e.target.classList.add("focus");
});

crateFaq.addEventListener("mouseleave", (e) => {
    e.target.classList.remove("focus");
});

for (const i of detail) {
    i.addEventListener("mouseover", () => {
        i.classList.add("focus");
    });

    i.addEventListener("mouseleave", () => {
        i.classList.remove("focus");
    });
}

for (const i of remove) {
    i.addEventListener("mouseover", () => {
        i.classList.add("removeFocus");
    });

    i.addEventListener("mouseleave", () => {
        i.classList.remove("removeFocus");
    });

    i.addEventListener("click", () => {
        const id = i.id.replace(/[^0-9]/g, "");
        $.ajax({
            url : "faq/removeFaq",
            data: {"id": id},
            success: function (result) {
                if (result == 1) {
                    alert("자주 찾는 질문이 삭제되었습니다.");
                    location.reload();
                } else {
                    alert("자주 찾는 질문 삭제에 실패했습니다. 잠시후 다시 시도해주세요.");
                    location.reload();
                }
            },

            error: function () {
                console.log("AJAX Error");
                console.log("code : " + request.status);
            }
        })
    });
}