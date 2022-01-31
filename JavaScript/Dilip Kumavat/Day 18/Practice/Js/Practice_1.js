var callback = function (event) {
    var value = event.target.value;
    document.getElementById("para").innerHTML =
      "<b>Square of "+value+" is = " +  value*value + "</b>";
  }