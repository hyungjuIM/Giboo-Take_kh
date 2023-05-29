const SubCategoryLabelTheme = document.getElementsByClassName("SubCategoryLabelTheme");
const sortingArea = document.getElementById("sortingArea");
const sortingListBox = document.getElementById("sortingListBox");
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

sortingArea.addEventListener("click", () => {
    if (sortingListBox.getAttribute("aria-hidden") == "true") {
        sortingListBox.setAttribute("aria-hidden", "false");
    } else {
        sortingListBox.setAttribute("aria-hidden", "true");
    }
})

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
    });

    i.addEventListener("mouseleave", () => {
        i.classList.remove("volunteerButtonFocus");
    });
}