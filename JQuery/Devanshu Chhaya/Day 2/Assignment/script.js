$(document).ready(function () {
    const url = "https://gorest.co.in/public-api/users";
    $.getJSON(url, function (data, status) {
        console.table(data.data);
        $("#tbldata").append($('<tr>').attr({
            id: "tdata"
        }));

        for (key in data.data[0]) {
            $("#tdata").append($('<th>').text(key));
        }

        $.each(data.data, function (index, value) {
            $("#tbldata").append(
                $('<tr>').append(
                    $('<td>').append().text(value["id"]),
                    $('<td>').append().text(value["name"]),
                    $('<td>').append().text(value["email"]),
                    $('<td>').append().text(value["gender"]),
                    $('<td>').append().text(value["status"])
                )
            )
        });
    });
});