document.body.onload = () => {
  // * Practical 1: Define a function called callback which receives an argument and prints the square of that number.
  let txtFirstNo = document.getElementById("txtFirstNo");
  let btnCalculate = document.getElementById("btnCalculate");
  let btnReset = document.getElementById("btnReset");
  let resultAlert = document.getElementById("resultAlert");

  function square(firstNo, callback) {
    callback(firstNo * firstNo);
  }

  btnReset.onclick = () => {
    resultAlert.style.display = "none";
    validateNo1.style.display = "none";
  };

  btnCalculate.onclick = () => {
    let validateNo1 = document.getElementById("validateNo1");
    if (isNaN(parseInt(txtFirstNo.value))) {
      validateNo1.style.display = "block";
      return;
    } else {
      validateNo1.style.display = "none";
    }
    square(parseInt(txtFirstNo.value), (result) => {
      resultAlert.style.display = "block";
      resultAlert.innerHTML = `
              <div class="alert alert-dismissible bg-warning bg-opacity-25">
              Square is of ${parseInt(txtFirstNo.value)}: ${result}
              <button class="btn-close" data-bs-dismiss="alert"></button>
            </div>
              `;
    });
  };
};
