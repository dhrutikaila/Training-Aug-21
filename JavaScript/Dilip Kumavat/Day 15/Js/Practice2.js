var arr = ["Ahmedabad", "Rajkot", "Bhavnagar", "Kutch", "Bhuj"];

for (var i = 0; i < arr.length; i++) {
  alert(arr[i]);
}
document.getElementById("city").innerHTML = arr.join(", ");