const imgInput = document.getElementById("imgInput");
const imgInputPlaceholder = document.getElementById("imgInputPlaceholder");

imgInput.addEventListener("change", () => {
    imgInputPlaceholder.style.opacity = "0";
});