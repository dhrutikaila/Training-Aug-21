var result = document.getElementById("result");

      var num1 = document.getElementById("first_number");
      var num2 = document.getElementById("second_number");
      var operation = document.getElementsByName("operation");

      function check() {
          
        for (let i = 0; i < operation.length; i++) {
          if (operation[i].checked) {
              
            if (operation[i].value == "+")
              result.value = parseInt(num1.value) + parseInt(num2.value);
            if (operation[i].value == "-")
              result.value = parseInt(num1.value) - parseInt(num2.value);
            if (operation[i].value == "*")
              result.value = parseInt(num1.value) * parseInt(num2.value);
            if (operation[i].value == "/")
              result.value = parseInt(num1.value) / parseInt(num2.value);
          }
        }
        
      }
      function reset() {
        num1.value = "";
        num2.value = "";

        for (let i = 0; i < operation.length; i++) {
          operation[i].checked = false;
        }

        result.value = "";
      }