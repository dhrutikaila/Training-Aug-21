// *  2. Write a Nodejs server that serves as a RESTFUL API that takes two parameters in a GET call and produces their sum.
// TODO: http://localhost:3001/product?param1=5&param2=10

require("dotenv").config({ path: "../.env" });
const http = require("http");
const url = require("url");
const chalk = require("chalk");

const port = process.env.PORT || 3001;

http
  .createServer(async (req, res) => {
    // res.writeHead(200, { "Content-Type": "text/html" });
    const objUrl = url.parse(req.url, true);
    // console.log(objUrl);
    // console.log(objUrl.pathname);
    // console.log(objUrl.query.param1);
    // console.log(objUrl.query.param2);
    // console.log(Object.keys(objUrl.query)[0]);
    if (
      objUrl.pathname == "/product" &&
      Object.keys(objUrl.query)[0] === "param1" &&
      Object.keys(objUrl.query)[1] === "param2"
    ) {
      param1 = parseInt(objUrl.query.param1);
      param2 = parseInt(objUrl.query.param2);
      const sum = `Sum of ${param1} and ${param2}: ${param1 + param2}`;
      console.log(chalk.blue(sum));
      res.end(`<h1 style="color:blue;">${sum}</h1>`);
    } else {
      console.log(chalk.red(`Please Enter proper query.`));
      res.end(
        `<h1 style="color:red;">Please Enter proper route or query.</h1>`
      );
    }
  })
  .listen(port, () => {
    console.log(chalk.green(`Server started on port: ${port}`));
  });
