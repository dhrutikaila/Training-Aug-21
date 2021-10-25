var employeeId_pattern = /^[0-9]{5}$/g;
var email_pattern = /^[A-z0-9]{1,}[@][A-z]{1,}[.][a-z]{1,3}$/gi;
var name_pattern = /^[a-zA-Z]{3,}$/;
var age_pattern = /^[1-9]{2}$/;
var designation_pattern = /[A-Za-z]/;
var contact_pattern = /^[0-9]{10}$/;
var salary_pattern = /^[0-9]{4,6}$/;

var todaysDate = new Date(); //
var year = todaysDate.getFullYear(); // YYYY
var month = ("0" + (todaysDate.getMonth() + 1)).slice(-2); // MM
var day = ("0" + todaysDate.getDate()).slice(-2); // DD
var maxDate = year + "-" + month + "-" + day;
document.getElementsByName("doj")[0].setAttribute("max", maxDate);

function globalMatch(pattern, value) {
  return pattern.test(value);
}

function testPattern(pattern, value, paratitle) {
  var para = document.getElementById(paratitle);
  var result = globalMatch(pattern, value);
  para.style.display = result ? "none" : "block";

  return result;
}

function getValue(title) {
  return document.getElementsByName(title)[0].value;
}

function submitAction(event) {
  event.preventDefault();
  console.log("submited");
  var Id = testPattern(
    employeeId_pattern,
    document.getElementsByName("employeeId")[0].value,
    "id_para"
  );
  var name = testPattern(
    name_pattern,
    document.getElementsByName("employeeName")[0].value,
    "name_para"
  );
  var age = testPattern(
    age_pattern,
    document.getElementsByName("age")[0].value,
    "age_para"
  );
  var designation = testPattern(
    designation_pattern,
    document.getElementsByName("designation")[0].value,
    "designation_para"
  );
  var salary = testPattern(
    salary_pattern,
    document.getElementsByName("salary")[0].value,
    "salary_para"
  );
  var contact = testPattern(
    contact_pattern,
    document.getElementsByName("contactno")[0].value,
    "contact_para"
  );

  var email = testPattern(
    email_pattern,
    document.getElementsByName("email")[0].value,
    "email_para"
  );

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

  var location = document.getElementsByName("location")[0].value;
  if (!location) {
    document.getElementById("location_para").style.display = "block";
  }

  if (
    !Id ||
    !contact ||
    !name ||
    !salary ||
    !email ||
    !contact ||
    !designation ||
    !age ||
    !gender ||
    !location
  ) {
    console.log("returning", Id, contact, name);
    return;
  } else {
    // window.location.href = "./Assignment.html";

    var newwin = window.open();
    newwin.document.write(
      "<label>Name :</label>" +
        getValue("employeeName") +
        "<br><label>Designation:</label>" +
        getValue("designation") +
        "<br><label>Contact:</label>" +
        getValue("contactno") +
        "<br><label>Employee Id:</label>" +
        getValue("employeeId") +
        "<br><label>Email:</label>" +
        getValue("email") +
        "<br><label>Age:</label>" +
        getValue("age") +
        "<br><label>Location : </label>" +
        location +
        "<br><label>Gender : </label>" +
        gender
    );
  }
}
