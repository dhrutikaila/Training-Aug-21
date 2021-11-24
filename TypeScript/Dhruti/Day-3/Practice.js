"use strict";
exports.__esModule = true;
function color(arg) {
    return arg;
}
//generic class
var studinfo = /** @class */ (function () {
    function studinfo() {
    }
    studinfo.prototype.setvalue = function (id, name) {
        this.ID = id;
        this.name = name;
    };
    studinfo.prototype.display = function () {
        console.log("id=".concat(this.ID, ",name=").concat(this.name));
    };
    return studinfo;
}());
var st = new studinfo();
st.setvalue(101, "dhruti");
st.display();
var std = new studinfo();
std.setvalue("1", "meet");
std.display();
;
function studentData(id, value) {
    console.log('id= ' + id + ',\nName=' + value);
}
var std1 = studentData;
std1(11, "dhruti patel");
//NameSpacing 
//Namespace validartors
var Validation;
(function (Validation) {
    var lettersRegexp = /^[A-Za-z]+$/;
    var numberRegexp = /^[0-9]+$/;
    var LettersOnlyValidator = /** @class */ (function () {
        function LettersOnlyValidator() {
        }
        LettersOnlyValidator.prototype.isAcceptable = function (s) {
            return lettersRegexp.test(s);
        };
        return LettersOnlyValidator;
    }());
    Validation.LettersOnlyValidator = LettersOnlyValidator;
    var ZipCodeValidator = /** @class */ (function () {
        function ZipCodeValidator() {
        }
        ZipCodeValidator.prototype.isAcceptable = function (s) {
            return s.length === 5 && numberRegexp.test(s);
        };
        return ZipCodeValidator;
    }());
    Validation.ZipCodeValidator = ZipCodeValidator;
})(Validation || (Validation = {}));
// Some samples to try
var strings = ["Hello", "98052", "101"];
// Validators to use
var validators = {};
validators["ZIP code"] = new Validation.ZipCodeValidator();
validators["Letters only"] = new Validation.LettersOnlyValidator();
// Show whether each string passed each validator
for (var _i = 0, strings_1 = strings; _i < strings_1.length; _i++) {
    var s = strings_1[_i];
    for (var name_1 in validators) {
        console.log("\"".concat(s, "\" - ").concat(validators[name_1].isAcceptable(s) ? "matches" : "does not match", " ").concat(name_1));
    }
}
