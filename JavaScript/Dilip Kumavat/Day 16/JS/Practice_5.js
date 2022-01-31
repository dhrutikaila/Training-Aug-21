
var arr = ["Banana", "Apple", "Orange", "Mango"];
var para = document.getElementById("para");
var Initial_array = document.getElementById("initial_array");
Initial_array.innerHTML = arr;

function push_element(element) {
  if (element.trim() !== "") {
    arr.push(element);
    Initial_array.innerHTML = arr;
  } else {
    para.classList += "text-danger";
    para.innerHTML = "Do not try to add blank space";
  }
}
function pop_element() {
  if (arr.length !== 0) {
    arr.pop();
    Initial_array.innerHTML = arr;
  } else {
    para.classList += "text-danger";
    para.innerHTML = "Array is blank can't perform pop operation";
  }
}
function unshift_element(element) {
  if (element.trim() !== "") {
    arr.unshift(element);
    Initial_array.innerHTML = arr;
  } else {
    para.classList += "text-danger";
    para.innerHTML = "Do not try to add blank space";
  }
}
function shift_element() {
  if (arr.length !== 0) {
    arr.shift();
    Initial_array.innerHTML = arr;
  } else {
    para.classList += " text-danger ";
    para.innerHTML = "Array is blank can't perform shift operation";
  }
}
