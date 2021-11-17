var express = require("express");
var app = express();


// var mylogger = function (req, res, next) {
//     console.log("logged");
//     next();
// }
// app.use(mylogger);
// app.get("/", (req, res) => { res.send("hello"); }).listen(5000);


// var requesttime = function (req, res, next) {
//     req.requesttime = new Date();
//     next();
// }
// app.use(requesttime);

// app.get("/", (req, res) => {
//     var responsetext = "hello ";
//     responsetext += "requested at: " + req.requesttime;
//     res.send(responsetext);
// }).listen(5000);



// application level middleware

// app.use(function (req, res, next) {
//     console.log("hello");
//     next();
// })

// app.use(function (req, res, next) {
//     var date = new Date();
//     console.log("Date: ", date);
//     next();
// }).listen(5000);


// app.listen(5000);

// app.use("/user/:id", function (req, res, next) {
//     console.log("hello")
// next();
// }).listen(5000);

// app.use("/user/:id", function (req, res, next) {
//     console.log("request type: ", req.method);
//     next();
// }).listen(5000);

// app.use("/user/:id", function (req, res, next) {
//     console.log("request url: ", req.originalUrl);
//     next();
// }, function (req, res, next) {
//     console.log("request type :", req.method);
//     next();
// }).listen(5000);

// app.get("/user/:id", function (req, res, next) {
//     console.log("user id: ", req.params.id);
//     next();
// }, function (req, res, next) { res.send("user info"); });

// app.get('/user/:id', function (req, res, next) {
//     res.send(req.params.id);
// })
// app.listen(5000);

// app.get("/user/:id", function (req, res, next) {
//     if (req.params.id === "0") {
//         next("route");
//     }
//     else { next(); }
// }, function (req, res, next) {
//     res.send("regular");
// });

// app.get("/user/:id", function (req, res, next) {
//     res.send("special");
// });

// app.listen(5000);

// function logoriginalurl(req, res, next) {
//     console.log("request url: ", req.originalUrl);
//     next();
// }

// function logmethod(req, res, next) {
//     console.log("request method: ", req.method);
//     next();
// }

// var logstuff = [logoriginalurl, logmethod]
// app.get("/user/:id", logstuff, function (req, res, next) {
//     res.send("user info");
// });

// app.listen(5000);

// router - level middleware

// var router = express.Router();
// app.use("/", router);

// router.use(function (req, res, next) {
//     var date = new Date();
//     console.log(date);
//     next();
// });

app.listen(5000);

// router.use(function (req, res, next) {
//     console.log("request url: ", req.originalUrl);
//     next();
// }, function (req, res, next) {
//     console.log("request method", req.method);
//     next();
// });


// router.get('/user/:id', function (req, res, next) {
//     if (req.params.id === '0') next('route')
//     else next()
// }, function (req, res, next) {
//     res.send('regular')
// })

// router.get('/user/:id', function (req, res, next) {
//     console.log(req.params.id)
//     res.send('special')
// })

// error-handling middleware

app.use("/user", function (err, req, res, next) {
    console.log(err.stack)
    res.status(500).send('Something broke!')
})