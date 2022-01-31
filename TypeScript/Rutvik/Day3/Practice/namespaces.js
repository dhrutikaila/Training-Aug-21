var employees;
(function (employees) {
    var salary;
    (function (salary) {
        function DisplaySalary(value) { console.log("Display Salary " + value); }
        salary.DisplaySalary = DisplaySalary;
    })(salary = employees.salary || (employees.salary = {}));
    function displayDataType(id) {
        console.log("DataType of Id: " + typeof (id));
    }
    employees.displayDataType = displayDataType;
})(employees || (employees = {}));
