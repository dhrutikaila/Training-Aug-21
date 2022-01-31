const authPage = (permissions) => {
    return (req, res, next) => {
        const role = req.headers["role"];
        if (permissions.includes(role)) {
            next();
        } else {
            return res.status(401).json({
                message: "Unauthorized Access.",
            });
        }
    };
};

module.exports = { authPage };