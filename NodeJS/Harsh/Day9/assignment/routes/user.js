const express = require("express");
const router = express.Router();
let jwt = require("jsonwebtoken");


router.get("/", (req, res, next) => {
    res.send("welcome to user module");
});

// post user login

router.post("/login", (req, res, next) => {
    let userData = {
        userName: req.body.userName,
        password: req.body.password,
        userRole: req.body.userRole,
        userId: req.body.userId
    }
    if (userData.userName == "admin" && userData.password == "admin") {
        const token = jwt.sign(userData, global.config.secretKey,
            {
                algorithm: global.config.algorithm,
                expiresIn: global.config.expiresIn
            });
        res.status(200).json({
            message: "login successful",
            jwtoken: token
        })
    }
    else {
        res.status(401).json({
            message: "login failed",
        });
    }
})

module.exports = router;
