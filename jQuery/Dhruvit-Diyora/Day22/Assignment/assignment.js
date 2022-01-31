// – Put a droplist with 5 country name from list object using jquery

//                   (Eg. India, United Kingdom..). Default value should “Please select”.

//                 – Bellow droplist all country name which are in the dropdown that should display with Label :

//                   “Your Selected Country : “.

//                 – By default all country name should display.

//                 – Only that country name should appear which are you select from dropdown.

//                   All other label should be disappear.

//                 – When i select ‘Please select’, all countries name should get displayed.
Country = {
  c1: "india",
  c2: "United Kingdom",
  c3: "United States",
  c4: "China",
  c5: "Russia",
};
$.each(Country, function (val, text) {
  $("#myCountry").append($("<option></option>").val(val).html(text));
});
$("#myCountry").change(function () {
  if ($(this).val() == "c0") {
    $("#coun").html(
      " <span> India, United Kingdom, United States, China, Russia </span>"
    );
  } else {
    ans = $("#myCountry option:selected").text();
    $("#coun").html(" <span>" + ans + "</span>");
  }
});
