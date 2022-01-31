var express = require("express");
var router = express.Router();
var verifytoken = require("../middlewares/verifytoken");
var result = require("../data/result.json");

router.get("/data", verifytoken, function (req, res, next) {
    res.json(result);
});

module.exports = router;
