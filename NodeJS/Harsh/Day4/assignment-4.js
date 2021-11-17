// * 4. Write a Nodejs server that serve as a RESTFUL API that accepts a file content and writes them to the disk.
// http://localhost:3001/upload

require("dotenv").config({ path: "../.env" });
const http = require("http");
const querystring = require("querystring");
const chalk = require("chalk");
const person = require("./data/person");
const { writeFile } = require("fs").promises;
const port = process.env.PORT || 3001;

const writePerson = async (file, data) => {
  await writeFile(file, data);
};

const server = http.createServer((req, res) => {
  if (req.url === "/") {
    res.writeHead(200, { "Content-Type": "text/html" });
    res.end(`
      <form action="/upload" method="POST">
        Person ID: <input type="number" name="personId" required /><br />
        Person Name: <input type="text" name="personName" required /><br />
        Person Address: <input type="text" name="personAddress" required /><br />
        <input type="submit" value="submit" />
      </form>
    `);
  } else if (req.url === "/upload" && req.method === "POST") {
    let body = "";
    req.on("data", (chunk) => {
      body += chunk;
    });
    req.on("end", () => {
      const data = querystring.parse(body);
      const jsonString = JSON.stringify(data);
      const jsonObj = JSON.parse(jsonString);
      person.push(jsonObj);
      console.log(person);
      writePerson("./data/person.json", JSON.stringify(person));

      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify(person));
    });
  } else {
    console.log(chalk.red(`Route not found.`));
    res.writeHead(404, { "Content-Type": "application/json" });
    res.end(JSON.stringify({ message: `Route not found.` }));
  }
});

server.listen(port, () => {
  console.log(chalk.green(`Server started on port: ${port}`));
});
