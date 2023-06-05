const sideMenu = document.getElementsByClassName("sideMenuItem");
const resetSearch = document.getElementById("resetSearch");
const crateManager = document.getElementById("crateManager");
const managerDetail = document.getElementsByClassName("managerDetail");
const confirm = document.getElementsByClassName("confirm");
const reject = document.getElementsByClassName("reject");

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

crateManager.addEventListener("mouseover", (e) => {
    e.target.classList.add("focus");
});

crateManager.addEventListener("mouseleave", (e) => {
    e.target.classList.remove("focus");
});

for (const i of managerDetail) {
    i.addEventListener("mouseover", () => {
        i.classList.add("focus");
    });

    i.addEventListener("mouseleave", () => {
        i.classList.remove("focus");
    });
}

for (const i of confirm) {
    i.addEventListener("mouseover", () => {
        i.classList.add("focus");
    });

    i.addEventListener("mouseleave", () => {
        i.classList.remove("focus");
    });
}

for (const i of reject) {
    i.addEventListener("mouseover", () => {
        i.classList.add("focus");
    });

    i.addEventListener("mouseleave", () => {
        i.classList.remove("focus");
    });
}