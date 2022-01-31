function validate_form() {
    if (document.emp.emp_name.value == "") {
        alert("Please enter your Name.");
        return false;
    }
    var id = document.getElementById("emp_id").value;
    var id_regEx = /[0-9]{5}/g;
    if((id.match(id_regEx) != id)){
        alert("Invalid Employee Id");
        return false;
    }
    if (document.emp.num.value == "") {
        alert("Enter Employee Number");
        return false;
    } 


    if (!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/).test(document.emp.email_id.value)) {
        alert("You have entered an invalid email address!")
        return (false)
    }
    }
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode;
        if (charCode != 46 && charCode > 31 &&
            (charCode < 48 || charCode > 57)) {
                alert("Enter Number");
                return false;
            }
        return true;
        }
