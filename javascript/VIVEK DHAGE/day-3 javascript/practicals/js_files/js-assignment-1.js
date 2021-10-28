// script for form creation
var paragraph = document.getElementById("para");
var div = document.querySelector('div');
var br = document.createElement("br");


function fun(){



  // -------- creates a form



  var form = document.createElement("form");
  form.setAttribute("method", "post");
  form.setAttribute("action","#");


  // 1 creates input for emp_id element
  var emp_id_label = document.createElement("label");
  var emp_id_label_txt = document.createTextNode("Enter id");
  emp_id_label.setAttribute("class","form-label");



  var emp_id = document.createElement("input");
  emp_id.setAttribute("class","form-control");
  emp_id.setAttribute("type","text");
  emp_id.setAttribute("name","emp_id");
  emp_id.setAttribute("placeholder","enter id,atleast 5 char");
  emp_id.setAttribute("required","");

  // 2 creates input emp_name elements
  var emp_name_label = document.createElement("label");
  var emp_name_label_txt = document.createTextNode("Enter name");
  emp_name_label.setAttribute("class","form-label");

  var emp_name = document.createElement("input");
  emp_name.setAttribute("class","form-control");
  emp_name.setAttribute("type","text");
  emp_name.setAttribute("name","emp_name");
  emp_name.setAttribute("placeholder","enter name");
  emp_name.setAttribute("required","");

  // 3 creates input for emp_age element
  var emp_age_label = document.createElement("label");
  var emp_age_label_txt = document.createTextNode("Enter age");
  emp_age_label.setAttribute("class","form-label");

  var emp_age = document.createElement("input");
  emp_age.setAttribute("class","form-control");
  emp_age.setAttribute("type","number");
  emp_age.setAttribute("name","emp_age");
  emp_age.setAttribute("placeholder","enter age");
  emp_age.setAttribute("required","");

  //creates input for emp_gender element
  var emp_gender_label = document.createElement("label");
  var emp_gender_label_txt = document.createTextNode("Select Gender");
  emp_gender_label.setAttribute("class","form-check-label");

  // creates radio for male
  var emp_gender_label1 = document.createElement("label");
  var emp_gender_label1_txt1 = document.createTextNode("Male");
  emp_gender_label1.setAttribute("class","form-check-label");

  var emp_gender1 = document.createElement("input");
  emp_gender1.setAttribute("type","radio");
  emp_gender1.setAttribute("name","emp_gender");
  emp_gender1.setAttribute("class","form-check-input");

  // creates radio for female
  var emp_gender_label2 = document.createElement("label");
  var emp_gender_label2_txt2 = document.createTextNode("Female");
  emp_gender_label2.setAttribute("class","form-check-label");

  var emp_gender2 = document.createElement("input");
  emp_gender2.setAttribute("type","radio");
  emp_gender2.setAttribute("name","emp_gender");
  emp_gender2.setAttribute("class","form-check-input");

  //  creates radio for others
  var emp_gender_label3 = document.createElement("label");
  var emp_gender_label3_txt3 = document.createTextNode("Others");
  emp_gender_label3.setAttribute("class","form-check-label");

  var emp_gender3 = document.createElement("input");
  emp_gender3.setAttribute("type","radio");
  emp_gender3.setAttribute("name","emp_gender");
  emp_gender3.setAttribute("class","form-check-input");

  // creates input for designation
  var emp_des_label = document.createElement("label");
  var emp_des_label_txt = document.createTextNode("Designation");
  emp_des_label.setAttribute("class","form-label");

  var emp_des = document.createElement("input");
  emp_des.setAttribute("class","form-control");
  emp_des.setAttribute("type","text");
  emp_des.setAttribute("name","emp_des");
  emp_des.setAttribute("placeholder","designation");
  emp_des.setAttribute("required","");

  // creates input for salary
  var emp_sal_label = document.createElement("label");
  var emp_sal_label_txt = document.createTextNode("Salary");
  emp_sal_label.setAttribute("class","form-label");

  var emp_sal = document.createElement("input");
  emp_sal.setAttribute("class","form-control");
  emp_sal.setAttribute("type","number");
  emp_sal.setAttribute("name","emp_sal");
  emp_sal.setAttribute("placeholder","salary");
  emp_sal.setAttribute("required","");


  // creates input for emp_email
  var emp_email_label = document.createElement("label");
  var emp_email_label_txt = document.createTextNode("email");
  emp_email_label.setAttribute("class","form-label");

  var emp_email = document.createElement("input");
  emp_email.setAttribute("type","text");
  emp_email.setAttribute("name","emp_email");
  emp_email.setAttribute("placeholder","email");
  emp_email.setAttribute("required","");
  emp_email.setAttribute("pattern","/^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/");
  emp_email.setAttribute("class","form-control");

  // creates input for emp_doj
  var emp_doj_label = document.createElement("label");
  var emp_doj_label_txt = document.createTextNode("Date of Joining");
  emp_doj_label.setAttribute("class","form-label");

  var emp_doj = document.createElement("input");
  emp_doj.setAttribute("type","date");
  emp_doj.setAttribute("name","emp_doj");
  emp_doj.setAttribute("required","");
  emp_doj.setAttribute("class","form-control");

  // creates input for contact
  var emp_con_num_label = document.createElement("label");
  var emp_con_num_label_txt = document.createTextNode("Contact Number");
  emp_con_num_label.setAttribute("class","form-label");

  var emp_con_num = document.createElement("input");
  emp_con_num.setAttribute("type","number");
  emp_con_num.setAttribute("name","emp_num");
  emp_con_num.setAttribute("placeholder","contact number");
  emp_con_num.setAttribute("required","");
  emp_con_num.setAttribute("class","form-control");

  // create a submit button
  var submit = document.createElement("input");
  submit.setAttribute("type", "submit");
  submit.setAttribute("value", "Submit");
  submit.setAttribute("class","btn btn-primary");

  // creates back button

  var back = document.createElement("input");
  back.setAttribute("type", "button");
  back.setAttribute("value", "back");
  back.setAttribute("onclick", "goBack()");
  back.setAttribute("class","btn btn-primary");

// for dropdownlist of location
// creates input for emp_location
var emp_loc_label = document.createElement("label");
var emp_loc_label_txt = document.createTextNode("location");


var select = document.createElement("select");
select.setAttribute("class","form-select form-select-lg mb-3");
select.setAttribute("aria-label",".form-select-lg example")


var emp_loc_opt0 = document.createElement("option");
var emp_loc_opt0_val = document.createTextNode("--select--");
emp_loc_opt0.setAttribute("selected","");
emp_loc_opt0.setAttribute("value","0");
emp_loc_opt0.setAttribute("disabled","");

var emp_loc_opt1 = document.createElement("option");
var emp_loc_opt1_val = document.createTextNode("Ahmedabad");
emp_loc_opt1.setAttribute("value","1");


var emp_loc_opt2 = document.createElement("option");
var emp_loc_opt2_val = document.createTextNode("Delhi");
emp_loc_opt2.setAttribute("value","2");

var emp_loc_opt3 = document.createElement("option");
var emp_loc_opt3_val = document.createTextNode("Jalgaon");
emp_loc_opt3.setAttribute("value","3");

var emp_loc_opt4 = document.createElement("option");
var emp_loc_opt4_val = document.createTextNode("Chandigadh");
emp_loc_opt4.setAttribute("value","4");

var emp_loc_opt5 = document.createElement("option");
var emp_loc_opt5_val = document.createTextNode("Kolkata");
emp_loc_opt5.setAttribute("value","5");

var emp_loc_opt6 = document.createElement("option");
var emp_loc_opt6_val = document.createTextNode("Shimla");
emp_loc_opt6.setAttribute("value","6");

var emp_loc_opt7 = document.createElement("option");
var emp_loc_opt7_val = document.createTextNode("Chennai");
emp_loc_opt7.setAttribute("value","7");



  // ======================inserting(appending) elements in a form
  // for id
  form.appendChild(emp_id_label);
  emp_id_label.appendChild(emp_id_label_txt);
  form.appendChild(br.cloneNode());
  form.appendChild(emp_id);
  form.appendChild(br.cloneNode());
  form.appendChild(br.cloneNode());

  // for name
  form.appendChild(emp_name_label);
  emp_name_label.appendChild(emp_name_label_txt);
  form.appendChild(br.cloneNode());
  form.appendChild(emp_name);
  form.appendChild(br.cloneNode());
  form.appendChild(br.cloneNode());

  // for age
  form.appendChild(emp_age_label);
  emp_age_label.appendChild(emp_age_label_txt);
  form.appendChild(br.cloneNode());
  form.appendChild(emp_age);
  form.appendChild(br.cloneNode());
  form.appendChild(br.cloneNode());

  // for Gender
  form.appendChild(emp_gender_label);
  emp_gender_label.appendChild(emp_gender_label_txt);
  form.appendChild(br.cloneNode());

  form.appendChild(emp_gender1);
  form.appendChild(emp_gender_label1);
  emp_gender_label1.appendChild(emp_gender_label1_txt1);
  form.appendChild(br.cloneNode());

  form.appendChild(emp_gender2);
  form.appendChild(emp_gender_label2);
  emp_gender_label2.appendChild(emp_gender_label2_txt2);
  form.appendChild(br.cloneNode());

  form.appendChild(emp_gender3);
  form.appendChild(emp_gender_label3);
  emp_gender_label3.appendChild(emp_gender_label3_txt3);
  form.appendChild(br.cloneNode());

  form.appendChild(br.cloneNode());
  form.appendChild(br.cloneNode());

  // for designation
  form.appendChild(emp_des_label);
  emp_des_label.appendChild(emp_des_label_txt);
  form.appendChild(br.cloneNode());
  form.appendChild(emp_des);
  form.appendChild(br.cloneNode());
  form.appendChild(br.cloneNode());

  // for Salary
  form.appendChild(emp_sal_label);
  emp_sal_label.appendChild(emp_sal_label_txt);
  form.appendChild(br.cloneNode());
  form.appendChild(emp_sal);
  form.appendChild(br.cloneNode());
  form.appendChild(br.cloneNode());





  // for location
  form.appendChild(emp_loc_label);
  emp_loc_label.appendChild(emp_loc_label_txt);
  form.appendChild(br.cloneNode());
  form.appendChild(br.cloneNode());

  emp_loc_opt0.appendChild(emp_loc_opt0_val);
  emp_loc_opt1.appendChild(emp_loc_opt1_val);
  emp_loc_opt2.appendChild(emp_loc_opt2_val);
  emp_loc_opt3.appendChild(emp_loc_opt3_val);
  emp_loc_opt4.appendChild(emp_loc_opt4_val);
  emp_loc_opt5.appendChild(emp_loc_opt5_val);
  emp_loc_opt6.appendChild(emp_loc_opt6_val);
  emp_loc_opt7.appendChild(emp_loc_opt7_val);


  form.appendChild(select);
  select.append(emp_loc_opt0,emp_loc_opt1,emp_loc_opt2,emp_loc_opt3,emp_loc_opt4,emp_loc_opt5,emp_loc_opt6,emp_loc_opt7);
  form.appendChild(br.cloneNode());





  form.appendChild(br.cloneNode());
  form.appendChild(br.cloneNode());

  // for email
  form.appendChild(emp_email_label)
  emp_email_label.appendChild(emp_email_label_txt)
  form.appendChild(br.cloneNode());
  form.appendChild(emp_email);
  form.appendChild(br.cloneNode());
  form.appendChild(br.cloneNode());

  // for date of joining
  form.appendChild(emp_doj_label)
  emp_doj_label.appendChild(emp_doj_label_txt)
  form.appendChild(br.cloneNode());
  form.appendChild(emp_doj);
  form.appendChild(br.cloneNode());
  form.appendChild(br.cloneNode());

  // for contact number
  form.appendChild(emp_con_num_label)
  emp_con_num_label.appendChild(emp_con_num_label_txt)
  form.appendChild(br.cloneNode());
  form.appendChild(emp_con_num);
  form.appendChild(br.cloneNode());
  form.appendChild(br.cloneNode());

  // for submit button
  form.appendChild(submit)
  form.appendChild(br.cloneNode());
  form.appendChild(br.cloneNode());




  // for back button
  form.appendChild(back)
  form.appendChild(br.cloneNode());



  document.getElementById("frm").appendChild(form);

  // to hide create button at form
  document.getElementById("btn1").style="display:none";

  alert("form is formed successfully..!")

}


// --------------------logic for back button


var myWindow;

function openwin() {
  myWindow = window.open("", "", "width=105, height=80");
}

function resizewin() {
  myWindow.resizeTo(1000, 2000);
  myWindow.focus();
}

function goBack() {
  window.history.back()
}
function goForward() {
  window.history.forward()
}
function f(){
  alert("working")
}
function win() {
  window.location.assign("https://www.uefa.com")
}
