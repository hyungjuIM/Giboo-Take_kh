const heartIcons = document.getElementsByClassName("heartIcon");

for (let i = 0; i < heartIcons.length; i++) {
    heartIcons[i].addEventListener("click", function() {
      if (this.classList.contains("far")) {
        this.classList.remove("far");
        this.classList.add("fas");
        this.style.color = "#8071fc";
      } else if (this.classList.contains("fas")) {
        this.classList.remove("fas");
        this.classList.add("far");
        this.style.color = "black";
      } else {
        this.classList.add("fas");
        this.style.color = "#8071fc";
      }
    });
  }      
  
  
  function addFavorite(mainTitle) {
    $.ajax({
        url: '/addFavorite',
        type: 'POST',
        data: {
            mainTitle: mainTitle
        },
        success: function() {
            alert('즐겨찾기에 추가되었습니다!');
        }
    });
}
