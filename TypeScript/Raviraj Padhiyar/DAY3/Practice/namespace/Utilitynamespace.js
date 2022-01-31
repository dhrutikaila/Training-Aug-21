//namespace
var Utility;
(function (Utility) {
    let Fees;
    (function (Fees) {
        function CalculateLateFees(dayslate) {
            return dayslate * 0.25;
        }
        Fees.CalculateLateFees = CalculateLateFees;
    })(Fees = Utility.Fees || (Utility.Fees = {}));
    function MaxBookAllowed(age) {
        if (age < 12) {
            return 3;
        }
        else {
            return 10;
        }
    }
    Utility.MaxBookAllowed = MaxBookAllowed;
    function privateFun() {
        console.log("This is private");
    }
})(Utility || (Utility = {}));
