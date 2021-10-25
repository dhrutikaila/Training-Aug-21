$(function () {
  const countries = ["India", "USA", "Japan", "South Africa", "Russia"];

  $("#country")
    .append(
      $("<form>").append(
        $("<select>")
          .prop({
            id: "selCountry",
            name: "selCountry",
            class: "form-select",
          })
          .append(
            $("<option>")
              .prop({
                value: "",
                selected: true,
              })
              .text("Please Select Country")
          )
      )
    )
    .append(
      $("<div></div>")
        .text("Your Selected Country:")
        .addClass("text-center")
        .prop("id", "countryList")
      // .append($("span").text(value))
    );

  $.each(countries, function (index, value) {
    $("#countryList").append($("<div>").html(value));
    let a = $("#countryList").html();
    $("#selCountry")
      .append(
        $("<option>")
          .prop({
            id: `selCountry${index}`,
            value: value,
          })
          .text(value)
      )
      .on("change", function () {
        var str = "Your Selected Country:<br /> ";
        if ($("#selCountry option:selected").val() !== "") {
          str += $("#selCountry option:selected").val();
          $("#countryList").html(str);
        } else {
          $("#countryList").html(a);
        }
      });
  });
});
