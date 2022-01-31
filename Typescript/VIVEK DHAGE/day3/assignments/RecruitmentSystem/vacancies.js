"use strict";
exports.__esModule = true;
exports.vacancy = void 0;
var vacancy = /** @class */ (function () {
    function vacancy() {
    }
    vacancy.prototype.dispVacancy = function () {
        var Vacancy = [
            { openings: 30, Technology: ".net", Experience: "1yr" },
            { openings: 20, Technology: "php", Experience: "6month" },
            { openings: 5, Technology: "java", Experience: "2year" },
            { openings: 2, Technology: "c++", Experience: "2-5year" },
            { openings: 10, Technology: "python", Experience: "0year" },
        ];
        for (var i = 0; i < Vacancy.length; i++) {
            console.log("".concat(Vacancy[i].openings, " ").concat(Vacancy[i].Technology, "  ").concat(Vacancy[i].Experience));
        }
    };
    return vacancy;
}());
exports.vacancy = vacancy;
