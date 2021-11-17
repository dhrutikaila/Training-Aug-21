const authpage = (permissions) => {
    return (req, res, next) => {
        const userRole = req.body.userRole
        if (permissions.includes(userRole)) {
            next();
        }
        else {
            return res.status(401).send("you don't have permission");
        }
    }
};

const authPermission = (req, res, next) => {
    const id = parseInt(req.params.id);
    if (req.body.userId == id) {
        next();
    }
    else {
        return res.status(401).send("you don't have permission");
    }
}

module.exports = { authpage, authPermission };