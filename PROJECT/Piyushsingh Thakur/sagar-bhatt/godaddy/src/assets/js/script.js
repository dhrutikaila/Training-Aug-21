$(function () {
  $(".product-grid .cloud").on({
    mouseenter: function () {
      $(".product-grid .cloud img").attr("src", "./images/svg/cloud-white.svg");
    },
    mouseleave: function () {
      $(".product-grid .cloud img").attr("src", "./images/svg/cloud-black.svg");
    },
  });
});

document.body.onload = () => {
  var modal = document.getElementById("myModal");

  // Get the image and insert it inside the modal - use its "alt" text as a caption
  var img = document.getElementById("myImg");
  var modalImg = document.getElementById("img01");
  var captionText = document.getElementById("caption");
  img.onclick = function () {
    modal.style.display = "flex";
    modal.style.justifyContent = "center";
    modal.style.alignItems = "center";
  };

  // Get the <span> element that closes the modal
  var span = document.getElementsByClassName("close")[0];

  // When the user clicks on <span> (x), close the modal
  span.onclick = function () {
    modal.style.display = "none";
  };
};
