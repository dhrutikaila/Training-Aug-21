$(document).ready(function () {
  var name = ["Please select", "India", "China", "Usa", "Canada", "Japan"];

  //list of city
  $.each(name, function (i, cname) {
    if (i != 0) {
      console.log(cname)
      $("ul").append("<li>" + cname + "</li>");
    }
  })

  // drop list
  $.each(name, function (i, cname) {
    $("select").append("<option value=" + i + ">" + cname + "</option>")
  })

  //display result
  $("select").click(function () {
    if (this.value == 0) {
      $("#clist").show();
      $("#ans").hide();
    }
    else {
      $("#clist").hide();
      $("#ans").show();
      $("#ans").text("Your Selected Country :" + name[this.value]);
    }
  });

});