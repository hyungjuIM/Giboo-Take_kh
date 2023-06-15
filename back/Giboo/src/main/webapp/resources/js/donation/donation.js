const SubCategoryLabelTheme = document.getElementsByClassName("SubCategoryLabelTheme");
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

for (let i of item) {
    i.addEventListener("mouseenter", () => {
        i.classList.add("itemFocus");
    });

    i.addEventListener("mouseleave", () => {
        i.classList.remove("itemFocus");
    });
}

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

for (let i of button) {
    i.addEventListener("mouseenter", () => {
        i.classList.add("buttonFocus");
        i.firstElementChild.src = getContextPath() + "/resources/images/chevron-right-solid-white.svg";
    });

    i.addEventListener("mouseleave", () => {
        i.classList.remove("buttonFocus");
        i.firstElementChild.src = getContextPath() + "/resources/images/chevron-right-solid-gray.svg";
    });
}