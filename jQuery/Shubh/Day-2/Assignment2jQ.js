//Use getJSON method access this web api  https://gorest.co.in/public-api/users and display the result in one table.
$(document).ready(function () {
  $.getJSON("https://gorest.co.in/public-api/users", function (result) {
    console.log(result.data);
    $.each(result.data, function (i, field) {
      var row = getElement(field);
      table.appendChild(row);
    });
  });
});
function getElement(obj) {
  var row = document.createElement("tr");
  var td1 = document.createElement("td");
  var td2 = document.createElement("td");
  var td3 = document.createElement("td");
  var td4 = document.createElement("td");
  var td5 = document.createElement("td");
  var td1Text = document.createTextNode(obj.id);
  var td2Text = document.createTextNode(obj.name);
  var td3Text = document.createTextNode(obj.email);
  var td4Text = document.createTextNode(obj.gender);
  var td5Text = document.createTextNode(obj.status);

  td1.appendChild(td1Text);
  td2.appendChild(td2Text);
  td3.appendChild(td3Text);
  td4.appendChild(td4Text);
  td5.appendChild(td5Text);
  row.appendChild(td1);
  row.appendChild(td2);
  row.appendChild(td3);
  row.appendChild(td4);
  row.appendChild(td5);
  return row;
}
