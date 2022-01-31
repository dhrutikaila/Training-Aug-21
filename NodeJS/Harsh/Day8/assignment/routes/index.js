const express = require("express");
const router = express.Router();

router.get("/", (req, res, next) => {
    res.json({
        message: "welcome to user module",
        link: "http://localhost:3000/user"
    });
});

module.exports = router;