const sideMenu = document.getElementsByClassName("sideMenuItem");
const resetSearch = document.getElementById("resetSearch");
const selectDelete = document.getElementById("selectDelete");
const crateCategory = document.getElementById("crateCategory");
const modify = document.getElementsByClassName("modify");
const deleteCategory = document.getElementsByClassName("deleteCategory");

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

selectDelete.addEventListener("mouseover", (e) => {
    e.target.classList.add("focus");
});

selectDelete.addEventListener("mouseleave", (e) => {
    e.target.classList.remove("focus");
});

crateCategory.addEventListener("mouseleave", (e) => {
    e.target.classList.remove("focus");
});

crateCategory.addEventListener("mouseover", (e) => {
    e.target.classList.add("focus");
});

for (const i of modify) {
    i.addEventListener("mouseover", () => {
        i.classList.add("focus");
    });

    i.addEventListener("mouseleave", () => {
        i.classList.remove("focus");
    });
}

for (const i of deleteCategory) {
    i.addEventListener("mouseover", () => {
        i.classList.add("focus");
    });

    i.addEventListener("mouseleave", () => {
        i.classList.remove("focus");
    });
}