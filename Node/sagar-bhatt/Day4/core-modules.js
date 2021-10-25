// * http
const http = require("http");
// * url
const url = require("url");
// * path
const path = require("path");
// * util
const util = require("util");

require("dotenv").config({ path: "../.env" });
const port = process.env.PORT || 3001;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader("Content-Type", "text/html");
  console.log(req.url);
  const objUrl = url.parse(req.url, true);
  res.end(`<h3>Hello, World! <br \>
  =====url===== <br />
  ${req.url} <br \>
  ${JSON.stringify(objUrl)} <br />
  =====path===== <br />
  ${path.delimiter} ${path.sep} <br />
  ${path.dirname("./Assignment/data/person.json")} <br />
  ${path.basename("./Assignment/data/person")} <br />
  ${path.basename("./Assignment/data/person.json")} <br />
  ${path.basename("./Assignment/data/person.json", ".json")} <br />
  ${path.extname("./Assignment/data/person.json")} <br />
  ${path.format({ dir: "./Assignment/data", base: "person.json" })} <br />
  </h3>`);
});
server.listen(port, () => {
  console.log(`Server running at port ${port}`);
});

console.log(path.parse("./Assignment/data/person.json"));
console.log(path.join("/", "users", "name", "notes.txt"));

const str = "Learning %s";
const result = util.format(str, "NodeJS Util Module.");

console.log(result);
