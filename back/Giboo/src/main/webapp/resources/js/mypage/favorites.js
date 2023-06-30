const heartIcons = document.getElementsByClassName("heartIcon");

for (let i = 0; i < heartIcons.length; i++) {
  heartIcons[i].addEventListener("click", function() {
    const mainTitle = this.dataset.mainTitle;
    const memberNo = this.dataset.memberNo;
    const donationNo = this.dataset.donationNo;
    const volunteerNo = this.dataset.volunteerNo;

    addFavorite(mainTitle, memberNo, donationNo, volunteerNo);

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

function addFavorite(mainTitle, memberNo, donationNo, volunteerNo) {
  $.ajax({
    url: '/addFavorite',
    type: 'POST',
    data: {
      mainTitle: mainTitle,
      memberNo: memberNo,
      donationNo: donationNo,
      volunteerNo: volunteerNo
    },
    success: function() {
      alert('Added to favorites!');
    },
    error: function() {
      alert('Failed to add to favorites!');
    }
  });
}