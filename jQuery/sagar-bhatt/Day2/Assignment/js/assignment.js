$(function () {
  const url = "https://gorest.co.in/public-api/users";
  $.getJSON(url, function (data, status) {
    console.table(data.data);
    $("#apiData").append(
      $("<table>")
        .prop({
          id: "apiTable",
          class: "table table-responsive",
        })
        .append($("<tr>").prop({ id: "tableHeading" }))
    );

    for (key in data.data[0]) {
      $("#tableHeading")
        .prop({ class: "text-capitalize" })
        .append($("<th>").text(key));
    }

    $.each(data.data, function (index, value) {
      $("#apiTable").append(
        $("<tr>").append(
          $("<td>").text(value["id"]),
          $("<td>").text(value["name"]),
          $("<td>").text(value["email"]),
          $("<td>").text(value["gender"]),
          $("<td>").text(value["status"])
        )
      );
    });
  });
});
