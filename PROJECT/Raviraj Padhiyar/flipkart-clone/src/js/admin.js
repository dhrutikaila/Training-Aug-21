$(function () {
  let myLocalStorage = window.localStorage;
  // console.log(myLocalStorage.getItem("products"));
  let products = JSON.parse(myLocalStorage.getItem("products"));
  let currentAdmin = JSON.parse(myLocalStorage.getItem("currentAdmin"));

  //set name of admin 
  $(".firstName").text(currentAdmin.firstname);
  $(".LastName").text(currentAdmin.lastName)

  // console.log(products);

  $.each(products, function (index, product) {
    $("tbody").append(`
      <tr id=${product.productId}>
        <th>${product.productId}</th>
        <td>${product.category}</td>
        <td>${product.productName}</td>
        <td>${product.brand}</td>
        <td>${product.mrp}</td>
        <td>${product.msrp}</td>
        <td><img class="img-thumbnail" src="${product.imgurl}" alt="${product.productName}"></td>
        <td>${product.stock}</td>
        <td><button type="button" class="btn btn-warning" value=${product.productId}>Update</button></td>
      </tr>
      `);

    $(`tr#${index} .btn`).on("click", function () {
      // console.log("hello");
      // insert value in update form
      $("#upd-productName").val(product.productName);
      $("#upd-productBrand").val(product.brand);
      $("#upd-category-select").val(product.category);
      $("#upd-product-img-url").val(product.imgurl);
      $("#upd-product-mrp").val(product.mrp);
      $("#upd-product-msrp").val(product.msrp);
      $("#upd-product-stock").val(product.stock);

      $("#updProductForm-modal").modal("toggle");

      $("#upd-product-btn").on("click", function () {
        product.productName = $("#upd-productName").val();
        product.brand = $("#upd-productBrand").val();
        product.category = $("#upd-category-select").val();
        product.imgurl = $("#upd-product-img-url").val();
        product.mrp = $("#upd-product-mrp").val();
        product.msrp = $("#upd-product-msrp").val();
        product.stock = $("#upd-product-stock").val();

        // console.log(products);

        myLocalStorage.setItem("products", JSON.stringify(products));

        console.log("hello from inside");
      });
    });
  });

  // $("#deals-section .item .btn").on("click",function() {
  //   console.log(dealData[parseInt($(this).attr("id")) - 1]);
  // });

  $("#add-product-form").on("submit", function (event) {
    // event.preventDefault();

    let idCnt;
    if (products.length == 0) {
      idCnt = 0;
    } else {
      idCnt = products[products.length - 1].productId + 1;
    }
    let productName = $("#productName").val();
    let brandName = $("#productBrand").val();
    let category = $("#category-select option:selected").val();
    let imgurl = $("#product-img-url").val();
    let mrp = $("#product-mrp").val();
    let msrp = $("#product-msrp").val();
    let stock = $("#product-stock").val();

    let product = {
      productId: idCnt,
      productName: productName,
      brand: brandName,
      category: category,
      imgurl: imgurl,
      mrp: mrp,
      msrp: msrp,
      stock: stock,
    };

    products.push(product);

    myLocalStorage.setItem("products", JSON.stringify(products));
  });
});
