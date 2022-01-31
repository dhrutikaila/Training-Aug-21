/// <reference path="Utilitynamespace.ts" />

import util = Utility.Fees;



// let fee = Utility.Fees.CalculateLateFees(10);
let fee = util.CalculateLateFees(10);

console.log(`Fees : ${fee}`);

