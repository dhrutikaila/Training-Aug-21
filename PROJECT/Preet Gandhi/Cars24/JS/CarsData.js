//Select City in modal
$(document).ready(function(){
  $(document).on("click",".city",function(){
    var selectCity = $("#selectedCity");
    selectCity.text($(this).attr("value"));
    console.log($(this).attr("value"))
  })
})
// Other Cities (Modal)
$(document).ready(function () {
  $.getJSON("http://127.0.0.1:5500/cities.json", function (result) {
      console.log(result.cities);
      $.each(result.cities, function (index, value) {
          $(".otherCities").append($(`<li class="p-2 m-2 border border-secondary rounded city" data-bs-dismiss="modal"
          value=${value}>${value}
      </li>`));
      })
  })
})

//cars details
$(document).ready(function () {
    $.getJSON("http://127.0.0.1:5500/cars.json", function (result) {
        console.log(result.carsData);
        $.each(result.carsData, function (index, value) {
            $("#myTable").append($("<tr></tr>").append($(`<td><img src=${value.image}></td>`))
                .append($("<td></td>").text(value.name)).append($("<td></td>").text(value.owner))
                .append($("<td></td>").text(value.kms)).append($("<td></td>").text(value.type))
                .append($("<td></td>").text(value.amount)).append($("<td></td>").text(value.downpayment)));
        })
    })
})