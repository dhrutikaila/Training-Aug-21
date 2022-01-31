const UserDomain = require("../../domain/user.domain");

const express = require("express");
const router = express.Router();

class UserController {
    // create user
    static createUser(req, res) {
        const user = new UserDomain();
        user.createUser(req, res);
    }
    static userLogin(req, res) {
        const user = new UserDomain();
        user.userLogin(req, res)
    }
}

router.post("/create", UserController.createUser);
router.post("/login", UserController.userLogin);

module.exports = router;

