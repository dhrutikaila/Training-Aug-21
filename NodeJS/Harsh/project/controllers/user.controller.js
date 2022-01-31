const UserDomain = require("../domains/user.domain");
const express = require("express");
const router = express.Router();

class UserController {
    static createUser(req, res) {
        const user = new UserDomain();
        user.createUser();
    }
}

// user routes
router.post("/", UserController.createUser);

module.exports = router;
