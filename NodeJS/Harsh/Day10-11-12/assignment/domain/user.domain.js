const UserModel = require("../model/user.model");
const jwt = require("jsonwebtoken");
class UserDomain {
    // create an user
    async createUser(req, res) {
        try {
            const data = req.body;
            const user = new UserModel(data);
            const result = await user.save();
            res.send(result);
        }
        catch (err) { res.send(err) }
    }
    // get all users
    getAllUsers() {
        const result = UserModel.find();
        return result; se
    }

    // user login
    async userLogin(req, res) {
        try {
            const data = req.body;
            const allUsers = await this.getAllUsers();
            const result = await allUsers.find((elem) => elem.userName === data.userName && elem.password === data.password);
            if (result) {
                const token = jwt.sign(data, global.config.secretKey, {
                    algorithm: global.config.algorithm,
                    expiresIn: global.config.expiresIn,
                });
                res.status(200).json({ message: "login successfully", token: token });
            }

            else { res.status(401).json({ message: "login failed" }); }


        }
        catch (err) { res.send(err.message) }
    }

}


module.exports = UserDomain;
