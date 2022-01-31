const express = require("express");
const router = express.Router();
let jwt = require("jsonwebtoken");


router.get("/", (req, res, next) => {
    res.send("welcome to user module");
});

// post user login

router.post("/login", (req, res, next) => {
    let userdata = {
        username: req.body.username,
        password: req.body.password
    }
    if (userdata.username == "admin" && userdata.password == "admin") {
        const token = jwt.sign(userdata, global.config.secretkey,
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
