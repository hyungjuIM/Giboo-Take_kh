const sideMenu = document.getElementsByClassName("sideMenuItem");
const menuButton = document.getElementsByClassName("menuButton");

for (const i of sideMenu) {
    i.addEventListener("mouseover", () => {
        i.classList.add("sideMenuFocus");
    });

    i.addEventListener("mouseleave", () => {
        i.classList.remove("sideMenuFocus");
    });
}

for (const i of menuButton) {
    i.addEventListener("mouseover", () => {
        i.classList.add("menuButtonFocus");
    });

    i.addEventListener("mouseleave", () => {
        i.classList.remove("menuButtonFocus");
    });
}