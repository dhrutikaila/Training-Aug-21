var express = require("express");
var router = express.Router();
var verifytoken = require("../middlewares/verifytoken");
var fees = require("../data/fees.json");

router.get("/data", verifytoken, function (req, res, next) {
    res.json(fees);
});

module.exports = router;
