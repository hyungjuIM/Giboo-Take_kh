const item = document.getElementsByClassName("item");
const button = document.getElementsByClassName("button");
// const favoriteButton = document.getElementsByClassName("favoriteButton");
const all = document.getElementById("all");

const searchParams = new URLSearchParams(location.search);
const category = searchParams.get('category');
const categoryNo = "category" + category;
const categoryButton = document.getElementById(categoryNo);

$(document).ready(function () {
    console.log(category)
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

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}

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

for (let i of favoriteButton) {
    i.addEventListener("mouseenter", () => {
        i.classList.add("buttonFocus");
    });

    i.addEventListener("mouseleave", () => {
        i.classList.remove("buttonFocus");
    });
}
