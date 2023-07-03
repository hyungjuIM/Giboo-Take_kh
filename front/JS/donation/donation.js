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


// 페이지네이션

$(document).ready(function(){
    $('.next').click(function(){
        $('.pagination').find('.num.active').next().addClass('active');
        $('.pagination').find('.num.active').prev().removeClass('active');

    })

    $('.prev').click(function(){
        $('.pagination').find('.num.active').prev().addClass('active');
        $('.pagination').find('.num.active').next().removeClass('active');

    })

})