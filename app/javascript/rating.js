document.addEventListener("DOMContentLoaded", function(event) {
  const stars = document.querySelectorAll(".star");
  
  stars.forEach(function(star) {
    star.addEventListener("click", function() {
      const rating = star.dataset.rating;
      const ratingField = star.parentNode.parentNode.querySelector("input[type='hidden']");
      ratingField.value = rating;
      updateStars(star.parentNode, rating);
    });

    star.addEventListener("mouseover", function() {
      const currentRating = star.dataset.rating;
      updateStars(star.parentNode, currentRating);
    });

    star.addEventListener("mouseout", function() {
      const ratingField = star.parentNode.parentNode.querySelector("input[type='hidden']");
      const currentRating = ratingField.value;
      updateStars(star.parentNode, currentRating);
    });
  });
});

function updateStars(container, rating = 0) {
  const stars = container.querySelectorAll(".star");

  stars.forEach(function(star) {
    if (star.dataset.rating <= rating) {
      star.classList.add("filled");
    } else {
      star.classList.remove("filled");
    }
  });
}
