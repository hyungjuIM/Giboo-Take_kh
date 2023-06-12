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
