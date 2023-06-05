const sideMenu = document.getElementsByClassName("sideMenuItem");
const resetSearch = document.getElementById("resetSearch");
const sendNotification = document.getElementById("sendNotification");
const memberDetail = document.getElementById("memberDetail");

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

sendNotification.addEventListener("mouseover", (e) => {
    e.target.classList.add("focus");
});

sendNotification.addEventListener("mouseleave", (e) => {
    e.target.classList.remove("focus");
});

memberDetail.addEventListener("mouseover", (e) => {
    e.target.classList.add("focus");
});

memberDetail.addEventListener("mouseleave", (e) => {
    e.target.classList.remove("focus");
});