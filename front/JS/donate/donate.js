const SubCategoryLabelTheme = document.getElementsByClassName("SubCategoryLabelTheme");
const sortingArea = document.getElementById("sortingArea");
const sortingListBox = document.getElementById("sortingListBox");
const item = document.getElementsByClassName("item");
const button = document.getElementsByClassName("button");

for (let i of SubCategoryLabelTheme) {
    i.addEventListener("click", () => {
        for (let j of SubCategoryLabelTheme) {
            j.classList.remove("SubCategoryChecked");
        }
        i.classList.add("SubCategoryChecked");
    });
}

sortingArea.addEventListener("click", () => {
    if (sortingListBox.getAttribute("aria-hidden") == "true") {
        sortingListBox.setAttribute("aria-hidden", "false");
    } else {
        sortingListBox.setAttribute("aria-hidden", "true");
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
        i.firstElementChild.src = "/images/chevron-right-solid-white.svg";
    });

    i.addEventListener("mouseleave", () => {
        i.classList.remove("buttonFocus");
        i.firstElementChild.src = "/images/chevron-right-solid-gray.svg";
    });
}