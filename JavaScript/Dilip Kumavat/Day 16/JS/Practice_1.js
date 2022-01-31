function check_length(e) {
        
    const para = document.getElementById("para");

    const str = e.target.value;
    if (str.trim() === "") {
      para.innerHTML = "String is blank";
    } else {
      para.innerHTML = "Length of your String = " + str.trim().length;
    }
  }