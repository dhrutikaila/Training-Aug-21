document.body.onload = () => {
  // ? Declare array with 5 city names and iterate these values with the help of loop and display it with alert.
  let cityList = document.querySelector("#cityList");
  let arrCity = ["Ahmedabad", "Surat", "Vadodara", "Gandhinagar", "Rajkot"];
  for (let val of arrCity) {
    alert(val);
    cityList.innerHTML += `<div class="alert alert-dismissible bg-warning bg-opacity-25">
                              ${val}
                              <button class="btn-close" data-bs-dismiss="alert"></button>
                            </div>`;
  }
};
