const express = require("express");
const router = express.Router();
const fees = require("../data/fees.json");
const results = require("../data/result.json");
const verifytoken = require("../middlewares/verifytoken");
const { authpage, authPermission } = require("../middlewares/middleware");
router.get("/", (req, res, next) => {
    res.send("welcome to students module");
});

router.get("/fees", verifytoken, authpage(["student"]), (req, res, next) => {
    res.send(fees);
});

router.get("/results", verifytoken, authpage(["student"]), (req, res, next) => {
    res.send(results);
});

router.get("/fees/:id", verifytoken, authpage(["student"]), authPermission, (req, res, next) => {
    const f = fees.find((c) => c.id === parseInt(req.params.id))
    res.send(f);
});

router.get("/results/:id", verifytoken, authpage(["student"]), authPermission, (req, res, next) => {
    const result = results.find((c) => c.id === parseInt(req.params.id))
    res.send(result);
});

module.exports = router;