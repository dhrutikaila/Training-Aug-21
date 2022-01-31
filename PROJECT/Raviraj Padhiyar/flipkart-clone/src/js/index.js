let navData = JSON.parse(localStorage.getItem("navData"));
let bannerData = JSON.parse(localStorage.getItem("bannerData"));

let currentUser = JSON.parse(localStorage.getItem("currentUser"));
let currentAdmin = JSON.parse(localStorage.getItem("currentAdmin"));
console.log(currentUser);
if (currentUser.email) {
  $(".account-nav .btn").html('<i class="fas fa-user-check"></i>');
}

//data extractions

//let dealsofday
let dealsOfDay = JSON.parse(localStorage.getItem("dealsOfDay"));

let dealData = JSON.parse(localStorage.getItem("products")).filter(
  item => dealsOfDay.includes(item.productId)
);
let groceryDeals = JSON.parse(localStorage.getItem("products")).filter(
  (item) => item.category == "grocery"
);
let MobileDeals = JSON.parse(localStorage.getItem("products")).filter(
  (item) => item.category == "mobiles"
);
let fashionDeals = JSON.parse(localStorage.getItem("products")).filter(
  (item) => item.category == "fashion"
);
let electronicsDeals = JSON.parse(localStorage.getItem("products")).filter(
  (item) => item.category == "electronics"
);
let homeDeals = JSON.parse(localStorage.getItem("products")).filter(
  (item) => item.category == "Home-decoration"
);
let appliancesDeals = JSON.parse(localStorage.getItem("products")).filter(
  (item) => item.category == "appliances"
);
let otherDeals = JSON.parse(localStorage.getItem("products")).filter(
  (item) => item.category == "other"
);

let users = JSON.parse(localStorage.getItem("users"));
let admins = JSON.parse(localStorage.getItem("admins"));
let userCart = JSON.parse(localStorage.getItem("userCart"));

let cart = JSON.parse(localStorage.getItem("cart"));

$(function () {
  $.each(navData, function (index, field) {
    $("#nav-category .nav-item a img").eq(index).attr("src", field.url);
    $("#nav-category .nav-item a p").eq(index).text(field.text);
  });
  $.each(bannerData, function (index, field) {
    $(".carousel-img").eq(index).attr("src", field);
  });

  

  $.each(dealData, function (index, product) {
    $("#deals-section .owl-carousel").append(
      `<div class="item">
                <div class="card" id=${product.productId}>
                  <div class="card-img">
                    <img class="img-fluid" src="${product.imgurl}" alt="" />
                  </div>
                  <div class="card-body">
                    <h5 class="card-title">${product.productName}</h5>
                    <p class="card-text">
                      <span class="selling-price">${
                        "₹" + product.msrp.toLocaleString()
                      }</span>
                      <span class="text-muted mrp">${
                        "₹" + product.mrp.toLocaleString()
                      }</span>
                      <span class="discount">${
                        Math.round(
                          ((product.mrp - product.msrp) * 100) / product.mrp
                        ) + "% off"
                      }</span>
                    </p>
                    <button type="button" class="btn btn-primary w-100">
                    <i class="fas fa-cart-plus"></i><span class="d-none d-sm-block"> Add to Cart</span>
                  </button>
                  </div>
                </div>
              </div>`
    );
  });


  $.each(groceryDeals, function (index, product) {
    $("#grocery-section .owl-carousel").append(
      `<div class="item">
                <div class="card" id=${product.productId}>
                  <div class="card-img">
                    <img class="img-fluid" src="${product.imgurl}" alt="" />
                  </div>
                  <div class="card-body">
                    <h5 class="card-title">${product.productName}</h5>
                    <p class="card-text">
                      <span class="selling-price">${
                        "₹" + product.msrp.toLocaleString()
                      }</span>
                      <span class="text-muted mrp">${
                        "₹" + product.mrp.toLocaleString()
                      }</span>
                      <span class="discount">${
                        Math.round(
                          ((product.mrp - product.msrp) * 100) / product.mrp
                        ) + "% off"
                      }</span>
                    </p>
                    <button type="button" class="btn btn-primary w-100">
                    <i class="fas fa-cart-plus"></i><span class="d-none d-sm-block"> Add to Cart</span>
                  </button>
                  </div>
                </div>
              </div>`
    );

    $(`.card#${product.productId} .btn`).on("click", function () {
      cart.push(product);
      localStorage.setItem("cart", JSON.stringify(cart));
      // console.log(JSON.stringify(cart));
      updateCart(product);
      calcTotalAmount();
    });
  });

  $.each(MobileDeals, function (index, product) {
    $("#mobiles-section .owl-carousel").append(
      `<div class="item">
                <div class="card" id=${product.productId}>
                  <div class="card-img">
                    <img class="img-fluid" src="${product.imgurl}" alt="" />
                  </div>
                  <div class="card-body">
                    <h5 class="card-title">${product.productName}</h5>
                    <p class="card-text">
                      <span class="selling-price">${
                        "₹" + product.msrp.toLocaleString()
                      }</span>
                      <span class="text-muted mrp">${
                        "₹" + product.mrp.toLocaleString()
                      }</span>
                      <span class="discount">${
                        Math.round(
                          ((product.mrp - product.msrp) * 100) / product.mrp
                        ) + "% off"
                      }</span>
                    </p>
                    <button type="button" class="btn btn-primary w-100">
                    <i class="fas fa-cart-plus"></i><span class="d-none d-sm-block"> Add to Cart</span>
                  </button>
                  </div>
                </div>
              </div>`
    );
    $(`.card#${product.productId} .btn`).on("click", function () {
      cart.push(product);
      localStorage.setItem("cart", JSON.stringify(cart));
      // console.log(JSON.stringify(cart));
      updateCart(product);
      calcTotalAmount();
    });
  });

  $.each(fashionDeals, function (index, product) {
    $("#fashion-section .owl-carousel").append(
      `<div class="item">
                <div class="card" id=${product.productId}>
                  <div class="card-img">
                    <img class="img-fluid" src="${product.imgurl}" alt="" />
                  </div>
                  <div class="card-body">
                    <h5 class="card-title">${product.productName}</h5>
                    <p class="card-text">
                      <span class="selling-price">${
                        "₹" + product.msrp.toLocaleString()
                      }</span>
                      <span class="text-muted mrp">${
                        "₹" + product.mrp.toLocaleString()
                      }</span>
                      <span class="discount">${
                        Math.round(
                          ((product.mrp - product.msrp) * 100) / product.mrp
                        ) + "% off"
                      }</span>
                    </p>
                    <button type="button" class="btn btn-primary w-100">
                    <i class="fas fa-cart-plus"></i><span class="d-none d-sm-block"> Add to Cart</span>
                  </button>
                  </div>
                </div>
              </div>`
    );
    $(`.card#${product.productId} .btn`).on("click", function () {
      cart.push(product);
      localStorage.setItem("cart", JSON.stringify(cart));
      // console.log(JSON.stringify(cart));
      updateCart(product);
      calcTotalAmount();
    });
  });

  $.each(electronicsDeals, function (index, product) {
    $("#electronics-section .owl-carousel").append(
      `<div class="item">
                <div class="card" id=${product.productId}>
                  <div class="card-img">
                    <img class="img-fluid" src="${product.imgurl}" alt="" />
                  </div>
                  <div class="card-body">
                    <h5 class="card-title">${product.productName}</h5>
                    <p class="card-text">
                      <span class="selling-price">${
                        "₹" + product.msrp.toLocaleString()
                      }</span>
                      <span class="text-muted mrp">${
                        "₹" + product.mrp.toLocaleString()
                      }</span>
                      <span class="discount">${
                        Math.round(
                          ((product.mrp - product.msrp) * 100) / product.mrp
                        ) + "% off"
                      }</span>
                    </p>
                    <button type="button" class="btn btn-primary w-100">
                    <i class="fas fa-cart-plus"></i><span class="d-none d-sm-block"> Add to Cart</span>
                  </button>
                  </div>
                </div>
              </div>`
    );
    $(`.card#${product.productId} .btn`).on("click", function () {
      cart.push(product);
      localStorage.setItem("cart", JSON.stringify(cart));
      // console.log(JSON.stringify(cart));
      updateCart(product);
      calcTotalAmount();
    });
  });
  $.each(homeDeals, function (index, product) {
    $("#house-section .owl-carousel").append(
      `<div class="item">
                <div class="card" id=${product.productId}>
                  <div class="card-img">
                    <img class="img-fluid" src="${product.imgurl}" alt="" />
                  </div>
                  <div class="card-body">
                    <h5 class="card-title">${product.productName}</h5>
                    <p class="card-text">
                      <span class="selling-price">${
                        "₹" + product.msrp.toLocaleString()
                      }</span>
                      <span class="text-muted mrp">${
                        "₹" + product.mrp.toLocaleString()
                      }</span>
                      <span class="discount">${
                        Math.round(
                          ((product.mrp - product.msrp) * 100) / product.mrp
                        ) + "% off"
                      }</span>
                    </p>
                    <button type="button" class="btn btn-primary w-100">
                    <i class="fas fa-cart-plus"></i><span class="d-none d-sm-block"> Add to Cart</span>
                  </button>
                  </div>
                </div>
              </div>`
    );
    $(`.card#${product.productId} .btn`).on("click", function () {
      cart.push(product);
      localStorage.setItem("cart", JSON.stringify(cart));
      // console.log(JSON.stringify(cart));
      updateCart(product);
      calcTotalAmount();
    });
  });
  $.each(appliancesDeals, function (index, product) {
    $("#appliances-section  .owl-carousel").append(
      `<div class="item">
                <div class="card" id=${product.productId}>
                  <div class="card-img">
                    <img class="img-fluid" src="${product.imgurl}" alt="" />
                  </div>
                  <div class="card-body">
                    <h5 class="card-title">${product.productName}</h5>
                    <p class="card-text">
                      <span class="selling-price">${
                        "₹" + product.msrp.toLocaleString()
                      }</span>
                      <span class="text-muted mrp">${
                        "₹" + product.mrp.toLocaleString()
                      }</span>
                      <span class="discount">${
                        Math.round(
                          ((product.mrp - product.msrp) * 100) / product.mrp
                        ) + "% off"
                      }</span>
                    </p>
                    <button type="button" class="btn btn-primary w-100">
                    <i class="fas fa-cart-plus"></i><span class="d-none d-sm-block"> Add to Cart</span>
                  </button>
                  </div>
                </div>
              </div>`
    );
    $(`.card#${product.productId} .btn`).on("click", function () {
      cart.push(product);
      localStorage.setItem("cart", JSON.stringify(cart));
      // console.log(JSON.stringify(cart));
      updateCart(product);
      calcTotalAmount();
    });
  });

  $.each(otherDeals, function (index, product) {
    $("#other-section .owl-carousel").append(
      `<div class="item">
                <div class="card" id=${product.productId}>
                  <div class="card-img">
                    <img class="img-fluid" src="${product.imgurl}" alt="" />
                  </div>
                  <div class="card-body">
                    <h5 class="card-title">${product.productName}</h5>
                    <p class="card-text">
                      <span class="selling-price">${
                        "₹" + product.msrp.toLocaleString()
                      }</span>
                      <span class="text-muted mrp">${
                        "₹" + product.mrp.toLocaleString()
                      }</span>
                      <span class="discount">${
                        Math.round(
                          ((product.mrp - product.msrp) * 100) / product.mrp
                        ) + "% off"
                      }</span>
                    </p>
                    <button type="button" class="btn btn-primary w-100">
                    <i class="fas fa-cart-plus"></i><span class="d-none d-sm-block"> Add to Cart</span>
                  </button>
                  </div>
                </div>
              </div>`
    );
    $(`.card#${product.productId} .btn`).on("click", function () {
      cart.push(product);
      localStorage.setItem("cart", JSON.stringify(cart));
      // console.log(JSON.stringify(cart));
      updateCart(product);
      calcTotalAmount();
    });
  });

  $(".owl-carousel").owlCarousel({
    loop: false,
    margin: 10,
    nav: true,
    dots: false,
    responsive: {
      0: {
        items: 1,
      },
      200: {
        items: 2,
      },
      600: {
        items: 3,
      },
      1000: {
        items: 5,
      },
    },
  });

  $(".owl-nav").hide();

  //update cart function

  function updateCart(product) {
    $("#cart-modal .modal-body").append(
      `<div class="card mb-3" id=${product.productId}>
          <div class="card-img">
            <img class="img-fluid" src="${product.imgurl}" alt="" />
          </div>
          <div class="card-body">
            <h5 class="card-title">${product.productName}</h5>
            <p class="card-text">
              <span class="selling-price">${
                "₹" + product.msrp.toLocaleString()
              }</span>
              <span class="text-muted mrp text-decoration-line-through">${
                "₹" + product.mrp.toLocaleString()
              }</span>
              <span class="discount">${
                Math.round(((product.mrp - product.msrp) * 100) / product.mrp) +
                "% off"
              }</span>
            </p>
            <button type="button" class="btn btn-warning w-100 rm-btn">
                    Remove Item
            </button>
          </div>
        </div>
        `
    );

    $(`.card#${product.productId} .btn`).on("click", function () {
      cart = cart.filter((item) => item.productId != product.productId);
      $(`#cart-modal .card#${product.productId}`).remove();
      calcTotalAmount();
    });
  }

  function calcTotalAmount() {
    let totalSum = 0;
    $.each(cart, function (index, product) {
      totalSum += parseInt(product.msrp);
    });
    $("#total-amount").text(totalSum);
  }

  //place order btn
  $("#cart-place-order").on("click", function () {
    location.reload();
    window.open("http://localhost:3000/Error404.html");

    cart = [];
    localStorage.setItem("cart", JSON.stringify(cart));
  });

  // login events

  $(".login-form .btn-signUp").on("click", function (event) {
    $(".login-form").addClass("d-none");
    $(".admin-form").addClass("d-none");
    $(".signUp-form").removeClass("d-none");
  });
  $(".login-form .btn-admin").on("click", function (event) {
    $(".login-form").addClass("d-none");
    $(".signUp-form").addClass("d-none");
    $(".admin-form").removeClass("d-none");
  });
  $(".signUp-form .btn-signIn").on("click", function (event) {
    $(".signUp-form").addClass("d-none");
    $(".admin-form").addClass("d-none");
    $(".login-form").removeClass("d-none");
  });
  $(".signUp-form .btn-admin").on("click", function (event) {
    $(".signUp-form").addClass("d-none");
    $(".login-form").addClass("d-none");
    $(".admin-form").removeClass("d-none");
  });
  $(".admin-form .btn-signIn").on("click", function (event) {
    $(".admin-form").addClass("d-none");
    $(".signUp-form").addClass("d-none");
    $(".login-form").removeClass("d-none");
  });
  $(".admin-form .btn-signUp").on("click", function (event) {
    $(".admin-form").addClass("d-none");
    $(".login-form").addClass("d-none");
    $(".signUp-form").removeleClass("d-none");
  });

  //form-validation

  $(".login-form form .btn").on("click", function (event) {
    event.preventDefault();
    let email = $("#logIn-email").val();
    let password = $("#logIn-password").val();

    //check if email password exist in users

    //linear search

    let temp = users.filter(
      (user) => user.email == email && user.password == password
    );
    console.log(temp[0]);
    if (temp.length >= 1) {
      //set current user
      currentUser = temp[0];
      localStorage.setItem("currentUser", JSON.stringify(currentUser));
      location.reload();
    } else {
      $(".login-form .failure").removeClass("d-none");
    }
  });

  $(".signUp-form form .btn").on("click", function (event) {
    // console.log("hello")
    let email = $("#signUp-email").val();
    let password = $("#signUp-password").val();
    let cpassword = $("#signUp-c-password").val();

    //check if password same as loginpassword

    if (password === cpassword) {
      let user = {
        email: email,
        password: password,
      };

      users.push(user);
      localStorage.setItem("users", JSON.stringify(users));
      $(".signUp-form .failure").addClass("d-none");

      location.reload();
    } else {
      $(".signUp-form .failure").removeClass("d-none");
    }
  });
  $(".admin-form form .btn").on("click", function (event) {
    event.preventDefault();
    let email = $("#admin-email").val();
    let password = $("#admin-password").val();

    console.log(email);
    console.log(password);

    //check if email and password exist in admins
    let temp = admins.filter(
      (admin) => admin.username == email && admin.password == password
    );
    console.log(temp);
    console.log(admins);
    if (temp.length >= 1) {
      location.reload();

      //set current admin
      currentAdmin = temp[0];
      localStorage.setItem("currentAdmin", JSON.stringify(currentAdmin));
      window.open("http://localhost:3000/admin.html", "_self");
    } else {
      $(".admin-form .failure").removeClass("d-none");
    }
  });
});
