function split_string(e) {
    const para = document.getElementById("para");
    const str = e.target.value;
    if (str.trim() === "") {
      para.innerHTML = "String is blank";
    } else {
        
      para.innerHTML =  str.trim().split(" ");
    }
  }