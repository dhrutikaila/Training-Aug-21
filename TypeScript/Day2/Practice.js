//Tuple
var employee = [1, "Steve"];
var person = [1, "Steve", true];
var user; // declare tuple variable
user = [1, "Steve", true, 20, "Admin"]; // initialize tuple variable
employee[0]; // returns 1
employee.push(2, "Bill");
console.log(employee); //Output: [1, 'Steve', 2, 'Bill']
// Enum
var PrintMedia;
(function (PrintMedia) {
    PrintMedia[PrintMedia["Newspaper"] = 0] = "Newspaper";
    PrintMedia[PrintMedia["Newsletter"] = 1] = "Newsletter";
    PrintMedia[PrintMedia["Magazine"] = 2] = "Magazine";
    PrintMedia[PrintMedia["Book"] = 3] = "Book";
})(PrintMedia || (PrintMedia = {}));
function getMedia(mediaName) {
    if (mediaName === 'Forbes' || mediaName === 'Outlook') {
        return PrintMedia.Magazine;
    }
}
var mediaType = getMedia('Forbes'); // returns Magazine 
//computed enum
var PrintMedia1;
(function (PrintMedia1) {
    PrintMedia1[PrintMedia1["Newspaper"] = 1] = "Newspaper";
   // PrintMedia1[PrintMedia1["Newsletter"] = getPrintMediaCode('newsletter')] = "Newsletter";
    PrintMedia1[PrintMedia1["Magazine"] = PrintMedia1.Newsletter * 3] = "Magazine";
    PrintMedia1[PrintMedia1["Book"] = 10] = "Book";
})(PrintMedia1 || (PrintMedia1 = {}));
// function getPrintMediaCode(mediaName) {
//     if (mediaName === 'newsletter') {
//         return 5;
//     }
//}
//PrintMedia1.Newsetter; // returns 5
PrintMedia1.Magazine; // returns 15
//union
var code;
code = 123; // OK
code = "ABC"; // OK
//code = false; // Compiler Error
var empId;
empId = 111; // OK
empId = "E111"; // OK
var kv1 = { key: 1, value: "Steve" }; // OK
//var kv2 = { key: 1, val: "Steve" }; // Compiler Error: 'val' doesn't exist in type 'KeyPair'
//var kv3 = { key: 1, value: 100 }; // Compiler Error: 
;
function addKeyValue(key, value) {
    console.log('addKeyValue: key = ' + key + ', value = ' + value);
}
function updateKeyValue(key, value) {
    console.log('updateKeyValue: key = ' + key + ', value = ' + value);
}
var kvp = addKeyValue;
kvp(1, 'Bill'); //Output: addKeyValue: key = 1, value = Bill 
kvp = updateKeyValue;
kvp(2, 'Steve'); //Output: updateKeyValue: key = 2, value = Steve 
//class
var Employee = /** @class */ (function () {
    function Employee(code, name) {
        this.empName = name;
        this.empCode = code;
    } //constructor
    Employee.prototype.getSalary = function () {
        return 10000;
    };
    return Employee;
}());
var emp = new Employee(1, "Raj"); //object of class
