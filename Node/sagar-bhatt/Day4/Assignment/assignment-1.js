// * 1.Write a Nodejs server that listen on port 3001 and which will read person.json and return a response in JSON format.
// TODO: http://localhost:3001

require("dotenv").config({ path: "../.env" });
const { readFile } = require("fs").promises;
const http = require("http");
const chalk = require("chalk");

const port = process.env.PORT || 3001;

// const data = async () => {
//   const data = await readFile("person.json");
//   return data.toString();
// };

const person = require("./data/person");

http
  .createServer((req, res) => {
    if (req.url === "/" && req.method === "GET") {
      res.writeHead(200, { "Content-Type": "application/json" });
      res.write(JSON.stringify(person));
      res.end();
    } else {
      console.log(chalk.red(`Route not found.`));
      res.writeHead(404, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: `Route not found.` }));
    }
  })
  .listen(port, () => {
    console.log(chalk.green(`Server started on port: ${port}`));
  });
