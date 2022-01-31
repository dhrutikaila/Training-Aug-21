//namespace example
var namespace1;
(function (namespace1) {
    function ToUpper(str) {
        return str.toUpperCase();
    }
    namespace1.ToUpper = ToUpper;
    function ToLower(str) {
        return str.toLowerCase();
    }
    namespace1.ToLower = ToLower;
    function AnnualCalc(fee, term) {
        return fee * term;
    }
    namespace1.AnnualCalc = AnnualCalc;
})(namespace1 || (namespace1 = {}));
