document.body.onload = () => {
  txtDate = document.querySelector("#txtDate");
  validateDate = document.querySelector("#validateDate");

  fnValidateDate = () => {
    console.log(txtDate.value);
    // let dateRegex = /^(0?[1-9]|1[012])[-](0?[1-9]|[12][0-9]|3[01])[-]\d{4}$/;
    let dateRegex =
      /^((0[13578]|1[02])[/-](0[1-9]|[12][0-9]|3[01])[/-](18|19|20)[0-9]{2})|((0[469]|11)[/-](0[1-9]|[12][0-9]|30)[/-](18|19|20)[0-9]{2})|((02)[/-](0[1-9]|1[0-9]|2[0-8])[/-](18|19|20)[0-9]{2})|((02)[/-]29[/-](((18|19|20)(04|08|[2468][048]|[13579][26]))|2000))$/;
    // arr[2] % 400 == 0 || (arr[2] % 4 == 0 && arr[2] % 100 != 0);
    if (!dateRegex.test(txtDate.value)) {
      validateDate.innerHTML = "Invalid Date";
    } else {
      validateDate.innerHTML = new Date(txtDate.value).toDateString();
    }
  };
  txtDate.onkeyup = fnValidateDate;
};
