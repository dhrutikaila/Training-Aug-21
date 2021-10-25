document.body.onload = () => {
  // ? Create an application for performing basic math operations like Addition, Subtraction, Multiplication and Division.
  let txtFirstNo = document.querySelector("#txtFirstNo");
  let txtSecondNo = document.querySelector("#txtSecondNo");
  let radioList = document.getElementsByName("radio");

  let validateNo1 = document.querySelector("#validateNo1");
  let validateNo2 = document.querySelector("#validateNo2");
  let validateRadio = document.querySelector("#validateRadio");
  let result = document.querySelector("#result");

  // * validate Input
  validateText = (input, validator) => {
    if (isNaN(input.value)) {
      validator.style.display = "block";
    } else if (input.value == "" || input.value == " ") {
      validator.style.display = "block";
    } else {
      validator.style.display = "none";
    }
  };

  // * check whether radio element is empty or not
  function validateInputRadio(nodeList, validator) {
    let isSelected = false;
    for (let i of nodeList) {
      if (i.checked == true) {
        isSelected = true;
      }
    }
    if (!isSelected) {
      validator.style.display = "block";
    } else {
      validator.style.display = "none";
    }
  }

  // * calculate()
  calculate = () => {
    let checkedRadio = document.querySelector("input[name='radio']:checked");

    validateText(txtFirstNo, validateNo1);
    validateText(txtSecondNo, validateNo2);
    validateInputRadio(radioList, validateRadio);

    checkedRadio = parseInt(checkedRadio.value);
    switch (checkedRadio) {
      case 1:
        result.style.display = "block";
        result.innerText = `Result is : ${
          parseInt(txtFirstNo.value) + parseInt(txtSecondNo.value)
        }`;
        break;
      case 2:
        result.style.display = "block";
        result.innerText = `Result is : ${
          parseInt(txtFirstNo.value) - parseInt(txtSecondNo.value)
        }`;
        break;
      case 3:
        result.style.display = "block";
        result.innerText = `Result is : ${
          parseInt(txtFirstNo.value) * parseInt(txtSecondNo.value)
        }`;
        break;
      case 4:
        result.style.display = "block";
        result.innerText = `Result is : ${
          parseInt(txtFirstNo.value) / parseInt(txtSecondNo.value)
        }`;
        break;
      default:
        result.style.display = "block";
        result.innerText = `Something went wrong.`;
        break;
    }
  };

  let btnCalculate = document.querySelector("#btnCalculate");
  btnCalculate.addEventListener("click", calculate);

  // * reset()
  let btnReset = document.querySelector("#btnReset");
  btnReset.addEventListener("click", () => {
    validateNo1.style.display = "none";
    validateNo2.style.display = "none";
    validateRadio.style.display = "none";
    result.style.display = "none";

    let checkedRadio = document.querySelector("input[name='radio']:checked");
    result.style.display = "none";
    txtFirstNo.value = "";
    txtSecondNo.value = "";
    checkedRadio.checked = false;
  });
};
