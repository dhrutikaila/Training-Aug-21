const UserModel = require("../model/user.model");
const { validateUser } = require("../utils/joi.validation");


class UserDomain {
    // create an user
    async createUser(req, res) {
        const data = req.body;
        const { error } = validateUser(data);
        if (error) { res.status(400).json({ message: error.details[0].message }) }

        let user = await UserModel.findOne({ email: req.body.email })
        if (user) { res.status(400).send("user already registered") }

        user = new UserModel(data);
        const result = await user.save();
        res.send(result);
    }
}


module.exports = UserDomain;
