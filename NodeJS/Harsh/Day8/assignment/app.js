const express = require("express");
const app = express();
require("dotenv").config();
const port = process.env.PORT;
app.use(express.json());
global.config = require("./config");

app.listen(port, () => { console.log(`server started on port: ${port}`); })

// import routes

const userroute = require("./routes/user");
const indexroute = require("./routes/index");
const resultroute = require("./routes/result");
const feesroute = require("./routes/fees");
app.use("/", indexroute);
app.use("/user", userroute);
app.use("/result", resultroute);
app.use("/fees", feesroute);

