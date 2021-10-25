function getCharacters() {
    var str = document.getElementById("strId").value.trim();
    var num = document.getElementById("num").value;
    var para = document.getElementById("para");

    if (str.length < num) {
      para.innerHTML =
        "Please enter a number less than or equal to string input";
      return;
    }

    if (str === "" || num === "") {
      para.innerHTML = "Please enter both input";
    } else {
      para.innerHTML =
        "characters of your String = " + str.slice(0, num).split("");
    }
  }