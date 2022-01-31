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
  displayNone();

  btnSubmit.onclick = () => {
    displayNone();
    let txtEmpId = document.getElementById("txtEmpId").value;
    let validateEmpId = document.getElementById("validateEmpId");
    let txtEmpName = document.getElementById("txtEmpName").value;
    let validateEmpName = document.getElementById("validateEmpName");
    let txtEmpAge = document.getElementById("txtEmpAge").value;
    let validateEmpAge = document.getElementById("validateEmpAge");
    let rbGender = document.querySelector(
      "input[name='rbGender']:checked"
    ).value;

    let validateEmpGender = document.getElementById("validateEmpGender");
    let txtEmpDesignation = document.getElementById("txtEmpDesignation").value;
    let validateEmpDesignation = document.getElementById(
      "validateEmpDesignation"
    );
    let txtEmpSalary = document.getElementById("txtEmpSalary").value;
    let validateEmpSalary = document.getElementById("validateEmpSalary");
    let selEmpCity = document.getElementById("selEmpCity").value;
    let validateEmpCity = document.getElementById("validateEmpCity");
    let txtEmpEmail = document.getElementById("txtEmpEmail").value;
    let validateEmpEmail = document.getElementById("validateEmpEmail");
    let dtEmpDate = document.getElementById("dtEmpDate").value;
    let validateEmpDOJ = document.getElementById("validateEmpDOJ");
    let txtEmpContact = document.getElementById("txtEmpContact").value;
    let validateEmpContact = document.getElementById("validateEmpContact");

    let empIdPattern = /^\w{5,}$/;
    let empAgePattern = /^\d{2}$/;
    let empSalaryPattern = /^\d{4,}$/;
    let empEmailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    let empContactPattern = /^[0-9]{10}$/;

    if (txtEmpId == "") {
      validateEmpId.style.display = "block";
      return;
    }
    if (!empIdPattern.test(txtEmpId)) {
      validateEmpId.innerHTML = "EmployeeId Should be At least 5 Char long.";
      validateEmpId.style.display = "block";
      return;
    }

    if (txtEmpName == "") {
      validateEmpName.style.display = "block";
      return;
    }
    if (txtEmpAge == "") {
      validateEmpAge.style.display = "block";
      return;
    }
    if (!empAgePattern.test(txtEmpAge)) {
      validateEmpAge.innerHTML = "Age should be a number.";
      validateEmpAge.style.display = "block";
      return;
    }

    if (rbGender == "") {
      validateEmpGender.style.display = "block";
      return;
    }
    if (txtEmpDesignation == "") {
      validateEmpDesignation.style.display = "block";
      return;
    }
    if (txtEmpSalary == "") {
      validateEmpSalary.style.display = "block";
      return;
    }
    if (!empSalaryPattern.test(txtEmpSalary)) {
      validateEmpSalary.innerHTML = "Salary should be a number.";
      validateEmpSalary.style.display = "block";
      return;
    }

    if (selEmpCity == "") {
      validateEmpCity.style.display = "block";
      return;
    }
    if (txtEmpEmail == "") {
      validateEmpEmail.style.display = "block";
      return;
    }
    if (!empEmailPattern.test(txtEmpEmail)) {
      validateEmpEmail.innerHTML = "Email ID should be in proper format.";
      validateEmpEmail.style.display = "block";
      return;
    }

    if (dtEmpDate == "") {
      validateEmpDOJ.style.display = "block";
      return;
    }
    if (txtEmpContact == "") {
      validateEmpContact.style.display = "block";
      return;
    }
    if (!empContactPattern.test(txtEmpContact)) {
      validateEmpContact.innerHTML = "Contact Should be 10-Digits.";
      validateEmpContact.style.display = "block";
      return;
    }

    let resultData = (result.innerHTML = `
    <div>
      <h2>Employee Details</h2>
      <strong>Employee Id:</strong> ${txtEmpId}<br />
      <strong>Employee Name:</strong> ${txtEmpName}<br />
      <strong>Employee Age:</strong> ${txtEmpAge}<br />
      <strong>Employee Gender:</strong> ${rbGender}<br />
      <strong>Employee Designation:</strong> ${txtEmpDesignation}<br />
      <strong>Employee Salary:</strong> ${txtEmpSalary}<br />
      <strong>Employee City:</strong> ${selEmpCity}<br />
      <strong>Employee Email:</strong> ${txtEmpEmail}<br />
      <strong>Date of Joining:</strong> ${dtEmpDate}<br />
      <strong>Contact Number:</strong> ${txtEmpContact}<br />
    </div>
    `);

    let newWindow = window.open();
    newWindow.document.write(resultData);
  };

  btnReset.addEventListener("click", displayNone);
};
