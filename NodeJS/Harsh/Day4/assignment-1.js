// * 1.Write a Nodejs server that listen on port 3001 and which will read person.json and return a response in JSON format.



const http = require("http");
const person = require("./data/person");

http.createServer((req, res) => {
    if (req.url === "/" && req.method === "GET") {
        res.writeHead(200, { "Content-Type": "application/json" });
        res.write(JSON.stringify(person));
        res.end();
    } else {
        console.log(`Route not found.`);
        res.writeHead(404, { "Content-Type": "application/json" });
        res.end(JSON.stringify({ message: `Route not found.` }));
    }
}).listen(3001, () => {
    console.log(`Server started on port:3001 `);
});
