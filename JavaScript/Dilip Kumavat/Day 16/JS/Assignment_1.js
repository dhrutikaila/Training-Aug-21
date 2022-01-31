var date1 = document.getElementById("myDate");

      var para = document.getElementById("para");

      function check_leap_year(year) {
        if ((year % 4 === 0 && year % 100 !== 0) || year % 400 === 0) {
          return true;
        }
        return false;
      }

      function check_days(DD, MM, YYYY) {
        if (check_leap_year(YYYY)) {
          if ((MM == 4 || MM == 6 || MM == 9 || MM == 11)) {
            return DD <= 30;
          } else if (MM == 2) {
            return DD <= 29;
          } else {
            return DD <= 31;
          }
        } else {
          if ((MM == 4 || MM == 6 || MM == 9 || MM == 11)) {
            return DD <= 30;
          } else if (MM == 2) {
            return DD <= 28;
          } else {
            return DD <= 31;
          }
        }
      }

      function check_date() {
        var flag = false;

        var arr = date1.value.split("-");
        var MM = arr[0];
        var DD = arr[1];
        var YYYY = arr[2];
        
        var checking = check_days(DD, MM, YYYY);

        if (MM < 1 || MM > 12) {
          flag = true;
          document.getElementById("month_element").classList +=
            "text-danger fs-4";
        }
        if (DD < 1 || DD > 31 || !checking) {
          flag = true;
          document.getElementById("date_element").classList +=
            "text-danger fs-4";
        }
        if (!flag) {
          para.innerText = "Date is valid!";
          para.style.visibility = "visible";
          para.classList += "text-success text-center fs-4 mx-auto";
        } else {
          para.innerText = "Date is Invalid!";
          para.style.visibility = "visible";
          para.classList += "text-danger text-center fs-4 mx-auto";
        }
      }
