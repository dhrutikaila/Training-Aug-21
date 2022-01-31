//generics
function gene_1(arg) {
    return arg;
}
var output1 = gene_1("myString");
var output2 = gene_1(100);
console.log(output1);
console.log(output2);
function displayDataType(id, name) {
    console.log("DataType of Id: " + typeof (id) + "\nDataType of Name: " + typeof (name));
}
displayDataType(1, "Abhishek");
;
function studentData(id, value) {
    console.log('Id = ' + id + ', \nName = ' + value);
}
var std = studentData;
std(11, "Rohit Sharma");
//generics
function disp(a) {
    return a;
}
var am = disp("Five");
var am2 = disp(5);
//class generics
var students = /** @class */ (function () {
    function students() {
    }
    // constructor(ID:T,NAME:U){
    //     this.id=ID;
    //     this.name=NAME
    // }
    students.prototype.setvalue = function (ID, NAME) {
        this.id = ID;
        this.name = NAME;
    };
    students.prototype.display = function () {
        console.log("id is: ".concat(this.id, " and name is : ").concat(this.name));
    };
    return students;
}());
var st1 = new students();
st1.setvalue(33, "hello");
st1.display();
