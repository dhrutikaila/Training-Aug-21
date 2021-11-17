// *  2. Write a Nodejs server that serves as a RESTFUL API that takes two parameters in a GET call and produces their sum.
// http://localhost:3001/product?param1=5&param2=10


const http = require("http");
const url = require("url");




http.createServer(async (req, res) => {
    const obj = url.parse(req.url, true);
    if (
        obj.pathname == "/product" &&
        Object.keys(obj.query)[0] === "param1" &&
        Object.keys(obj.query)[1] === "param2"
    ) {
        param1 = parseInt(obj.query.param1);
        param2 = parseInt(obj.query.param2);
        const sum = `Sum of ${param1} and ${param2}: ${param1 + param2}`;
        console.log(sum);
        res.end(`${sum} `);
    } else {
        console.log(`Please Enter proper query.`);
        res.end(
            ` Please Enter proper route or query.`
        );
    }
}).listen(3001, () => { console.log("server startes on port:3001") })

