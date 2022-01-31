// Assignment1 Day17


// Regex for User inputs
var empId_Regex = /^[A-za-z0-9]{5,}$/;
var empName_Regex = /^[a-zA-Z]{3,}$/;
var age_Regex = /^[1-9]{2}$/;
var designation_Regex = /[A-Za-z]/;
var salary_Regex = /^[0-9]{4,6}$/;
var email_Regex = /^[a-z0-9]{1,}[@][a-z]{1,}[.][a-z]{1,3}$/;
var contact_Regex = /^[0-9]{10}$/;

//Function for checking validation
function checkValidation(pattern, value, errorLine) {
  var para = document.getElementById(errorLine);
  var result = pattern.test(value);
  para.style.display = pattern.test(value) ? "none" : "block";
  return result;
}

//function for getting input
function getInput(title) {
  return document.getElementById(title).value;
}

//function which is called on submit button
function submitAction(event) {
  event.preventDefault();
  var Id = checkValidation(empId_Regex, getInput("empId"), "id_para");

  var name = checkValidation(empName_Regex, getInput("empName"), "name_para");

  var age = checkValidation(age_Regex, getInput("empAge"), "age_para");

  var designation = checkValidation(designation_Regex, getInput("empDesignation"), "designation_para");

  var salary = checkValidation(salary_Regex, getInput("empSalary"), "salary_para");

  var email = checkValidation(email_Regex, getInput("empEmail"), "email_para");

  var contact = checkValidation(contact_Regex, getInput("empContact"), "contact_para");

  var genderNodeList = document.getElementsByName("gender");
  var gender;
  for (var i = 0; i < genderNodeList.length; i++) {
    if (genderNodeList[i].checked) {
      gender = genderNodeList[i].value;
    }
  }
  if (!gender) {
    document.getElementById("gender_para").style.display = "block";
  }
  var location = getInput("empLocation");
  if (!location) {
    document.getElementById("location_para").style.display = "block";
  }


  if (!Id || !contact || !name || !salary || !email || !contact || !designation || !age || !gender || !location) {
    return;
  } else {
    var newWindow = window.open();
    newWindow.document.write(
      "<label>Employee Id: </label>" +
      getInput("empId") +
      "<br><br><label>Name : </label>" +
      getInput("empName") +
      "<br><br><label>Age: </label>" +
      getInput("empAge") +
      "<br><br><label>Gender : </label>" +
      gender +
      "<br><br><label>Designation: </label>" +
      getInput("empDesignation") +
      "<br><br><label>Salary: </label>" +
      getInput("empSalary") +
      "<br><br><label>Location : </label>" +
      location +
      "<br><br><label>Email: </label>" +
      getInput("empEmail") +
      "<br><br><label>Date of Joining: </label>" +
      getInput("empDoj") +
      "<br><br><label>Contact No: </label>" +
      getInput("empContact")  
    );
  }
}
