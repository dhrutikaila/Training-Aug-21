// * 3. Write a Nodejs server that serves as a RESTFUL API that accepts a string as an input name and returns the first vowel character from the string.
// http://localhost:3001/vowelfind?input=rita

const http = require("http");
const url = require("url");


const server = http.createServer((req, res) => {
    // res.writeHead(200, { "Content-Type": "text/html" });
    const objUrl = url.parse(req.url, true);
    if (
        objUrl.pathname == "/vowelfind" &&
        Object.keys(objUrl.query)[0] === "input"
    ) {
        const data = objUrl.query.input;
        const vowel = data.match(/[aeiou]/i) || 0;
        if (vowel) {
            console.log(chalk.blue(`First vowel from ${data}: ${vowel[0]}`));
            res.end(
                `<h1 style="color:blue;">First vowel from ${data}: ${vowel[0]}</h1>`
            );
        } else {
            console.log(chalk.red(`There is no vowel in ${data}.`));
            res.end(`<h1 style="color:red;">There is no vowel in ${data}.</h1>`);
        }
    } else {
        console.log(chalk.red(`Please Enter proper query.`));
        res.end(`<h1 style="color:red;">Please Enter proper route or query.</h1>`);
    }
});

server.listen(port, () => {
    console.log(chalk.green(`Server started on port: ${port}`));
});
