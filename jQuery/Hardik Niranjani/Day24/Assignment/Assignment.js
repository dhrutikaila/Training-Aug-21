$(document).ready(function () {
  $("#button").click(function () {
    $.getJSON("https://gorest.co.in/public-api/users", function (result) {
      $.each(result.data, function (i, value) {
        $("#table_data").append(
          $("<tr></tr>")
            .append($("<td></td>").text(value.id))
            .append($("<td></td>").text(value.name))
            .append($("<td></td>").text(value.email))
            .append($("<td></td>").text(value.gender))
            .append($("<td></td>").text(value.status))
        );
      });
    });
  });
});
