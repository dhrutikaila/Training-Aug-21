document.body.onload = () => {
  let btnSubmit = document.getElementById("btnSubmit");
  let btnReset = document.getElementById("btnReset");
  let invalidFeedback = document.getElementsByClassName("invalid-feedback");
  let result = document.getElementById("result");

  // Hide all error message
  function displayNone() {
    for (let item of invalidFeedback) {
      item.style.display = "none";
    }
  }

  // check whether input or select element is empty or not
  function validateInput(input, validator) {
    if (input.value == "" || input.value == " ") {
      validator.style.display = "block";
    }
  }

  // check whether radio element is empty or not
  function validateRadio(rbList, validator) {
    if (rbList == null) {
      validator.style.display = "block";
    } else {
      validator.style.display = "none";
    }
  }

  // test pattern on input field
  function validatePattern(pattern, input, validator, message) {
    if (!pattern.test(input)) {
      validator.innerHTML = message;
      validator.style.display = "block";
    }
  }

  let txtEmpId = document.getElementById("txtEmpId");
  let validateEmpId = document.getElementById("validateEmpId");
  let txtEmpName = document.getElementById("txtEmpName");
  let validateEmpName = document.getElementById("validateEmpName");
  let txtEmpAge = document.getElementById("txtEmpAge");
  let validateEmpAge = document.getElementById("validateEmpAge");
  let rbGender = document.querySelector("input[name='rbGender']:checked");

  let validateEmpGender = document.getElementById("validateEmpGender");
  let txtEmpDesignation = document.getElementById("txtEmpDesignation");
  let validateEmpDesignation = document.getElementById(
    "validateEmpDesignation"
  );
  let txtEmpSalary = document.getElementById("txtEmpSalary");
  let validateEmpSalary = document.getElementById("validateEmpSalary");
  let selEmpCity = document.getElementById("selEmpCity");
  let validateEmpCity = document.getElementById("validateEmpCity");
  let txtEmpEmail = document.getElementById("txtEmpEmail");
  let validateEmpEmail = document.getElementById("validateEmpEmail");
  let dtEmpDate = document.getElementById("dtEmpDate");
  let validateEmpDOJ = document.getElementById("validateEmpDOJ");
  let txtEmpContact = document.getElementById("txtEmpContact");
  let validateEmpContact = document.getElementById("validateEmpContact");

  let empIdPattern = /^\w{5,}$/;
  let empAgePattern = /^\d{2}$/;
  let empSalaryPattern = /^\d{4,}$/;
  let empEmailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  let empContactPattern = /^[0-9]{10}$/;

  btnSubmit.onclick = () => {
    displayNone();
    let rbGender = document.querySelector("input[name='rbGender']:checked");

    validateInput(txtEmpId, validateEmpId);
    validateInput(txtEmpName, validateEmpName);
    validateInput(txtEmpAge, validateEmpAge);
    validateRadio(rbGender, validateEmpGender);
    validateInput(txtEmpDesignation, validateEmpDesignation);
    validateInput(txtEmpSalary, validateEmpSalary);
    validateInput(selEmpCity, validateEmpCity);
    validateInput(txtEmpEmail, validateEmpEmail);
    validateInput(dtEmpDate, validateEmpDOJ);
    validateInput(txtEmpContact, validateEmpContact);

    validatePattern(
      empIdPattern,
      txtEmpId.value,
      validateEmpId,
      "EmployeeId Should be At least 5 Char long."
    );
    validatePattern(
      empAgePattern,
      txtEmpAge.value,
      validateEmpAge,
      "Age should be a number."
    );
    validatePattern(
      empSalaryPattern,
      txtEmpSalary.value,
      validateEmpSalary,
      "Salary should be a number."
    );
    validatePattern(
      empEmailPattern,
      txtEmpEmail.value,
      validateEmpEmail,
      "Email ID should be in proper format."
    );
    validatePattern(
      empContactPattern,
      txtEmpContact.value,
      validateEmpContact,
      "Contact Should be 10-Digits."
    );

    let resultData = (result.innerHTML = `
    <strong>Employee Id:</strong> ${txtEmpId.value}<br />
    <strong>Employee Name:</strong> ${txtEmpName.value}<br />
    <strong>Employee Age:</strong> ${txtEmpAge.value}<br />
    <strong>Employee Gender:</strong> ${rbGender.value}<br />
    <strong>Employee Designation:</strong> ${txtEmpDesignation.value}<br />
    <strong>Employee Salary:</strong> ${txtEmpSalary.value}<br />
    <strong>Employee City:</strong> ${selEmpCity.value}<br />
    <strong>Employee Email:</strong> ${txtEmpEmail.value}<br />
    <strong>Date of Joining:</strong> ${dtEmpDate.value}<br />
    <strong>Contact Number:</strong> ${txtEmpContact.value}<br />
    `);

    let newWindow = window.open();
    newWindow.document.write(resultData);
  };

  btnReset.addEventListener("click", displayNone);
};
