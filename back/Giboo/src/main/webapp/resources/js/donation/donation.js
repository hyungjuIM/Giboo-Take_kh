const item = document.getElementsByClassName("item");
const button = document.getElementsByClassName("button");
const favoriteButton = document.getElementsByClassName("favoriteButton");
const all = document.getElementById("all");

const searchParams = new URLSearchParams(location.search);
const category = searchParams.get('category');
const categoryButton = document.getElementById(category);

$(document).ready(function () {
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
        console.log(getContextPath());
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

window.onload = function() {
    var favoriteButton = document.querySelector(".favoriteButton");
    var favorited = false; // State of the button

    favoriteButton.addEventListener('click', function() {
        if (favorited) {
            favoriteButton.innerHTML = '🤍'; // Set to un-favorited state
            favoriteButton.style.color = 'black'; // Change color back to original
            favorited = false;
        } else {
            favoriteButton.innerHTML = '❤️'; // Set to favorited state
            favoriteButton.style.color = 'red'; // Change color
            favorited = true;
        }
    });
}