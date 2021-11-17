var express = require("express");
var router = express.Router();
var verifytoken = require("./verifytoken");

router.get("/data", verifytoken, function (req, res, next) {
    let customerdata = [
        {
            customerid: 1,
            customername: "manav"
        },
        {
            customerid: 2,
            customername: "raj"
        },
        {
            customerid: 3,
            customername: "rahul"
        }];
    res.json(customerdata);
});

module.exports = router;