/// <reference path="Utilitynamespace.ts" />
var util = Utility.Fees;
// let fee = Utility.Fees.CalculateLateFees(10);
let fee = util.CalculateLateFees(10);
console.log(`Fees : ${fee}`);
