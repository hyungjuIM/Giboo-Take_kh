const SubCategoryLabelTheme = document.getElementsByClassName("SubCategoryLabelTheme");
const volunteerItem = document.getElementsByClassName("volunteerItem");
const volunteerButton = document.getElementsByClassName("volunteerButton");

for (let i of SubCategoryLabelTheme) {
    i.addEventListener("click", () => {
        for (let j of SubCategoryLabelTheme) {
            j.classList.remove("SubCategoryChecked");
        }
        i.classList.add("SubCategoryChecked");
    });
}

for (let i of volunteerItem) {
    i.addEventListener("mouseenter", () => {
        i.classList.add("volunteerItemFocus");
    });

    i.addEventListener("mouseleave", () => {
        i.classList.remove("volunteerItemFocus");
    });
}

for (let i of volunteerButton) {
    i.addEventListener("mouseenter", () => {
        i.classList.add("volunteerButtonFocus");
        i.firstElementChild.src = "/images/chevron-right-solid-white.svg";
    });

    i.addEventListener("mouseleave", () => {
        i.classList.remove("volunteerButtonFocus");
        i.firstElementChild.src = "/images/chevron-right-solid-gray.svg";
    });
}

