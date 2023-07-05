const imgInput = document.getElementById("imgInput");
const imgInputPlaceholder = document.getElementById("imgInputPlaceholder");
const img1 = document.getElementById("img1");



imgInput.addEventListener("change", (e) => {
    imgInputPlaceholder.style.opacity = "0";

    img1.value = imgInput.value;
});
