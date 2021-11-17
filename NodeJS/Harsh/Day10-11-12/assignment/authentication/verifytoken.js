let jwt = require("jsonwebtoken");

function verifyToken(req, res, next) {
    // accessing token
    var token = req.headers["x-access-token"];
    // verifying token
    jwt.verify(token, global.config.secretKey, { algorithm: global.config.algorithm }, function (err, decoded) {
        if (err) {
            var errordata = {
                message: err.message,
                expiredAt: err.expiredAt
            };
            console.error(errordata);
            res.status(401).json({ message: "unauthorized access" });
        }
        else {
            req.decoded = decoded;
            console.log(decoded);
            next();
        }
    })

}

module.exports = verifyToken;