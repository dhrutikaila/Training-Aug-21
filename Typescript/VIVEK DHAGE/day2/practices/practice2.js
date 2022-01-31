//enums example1
var color;
(function (color) {
    color[color["red"] = 0] = "red";
    color[color["white"] = 1] = "white";
    color[color["orange"] = 2] = "orange";
    color[color["blue"] = 3] = "blue";
})(color || (color = {}));
;
var pick;
pick = color.red;
// Heterogeneous Enum
var Status;
(function (Status) {
    Status["Active"] = "ACTIVE";
    Status[Status["Deactivate"] = 1] = "Deactivate";
    Status[Status["Pending"] = 2] = "Pending";
    Status[Status["numbers"] = 1] = "numbers";
})(Status || (Status = {}));
//enum example 2
var enum2;
(function (enum2) {
    enum2[enum2["Newspaper"] = 1] = "Newspaper";
    enum2[enum2["Newsletter"] = 2] = "Newsletter";
    enum2[enum2["Magazine"] = 3] = "Magazine";
    enum2[enum2["Book"] = 4] = "Book";
})(enum2 || (enum2 = {}));
enum2.Magazine;
enum2["Magazine"];
enum2[3];
