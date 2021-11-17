const chalk = require("chalk");
const http = require("http");
const fs = require("fs");
const path = require("path");
const EventEmitter = require("events");
const eventEmitter = new EventEmitter();

const startExam = () => {
    console.log(chalk.magenta(`Exam started on ${new Date()}.`));
};
const endExam = () => {
    console.log(chalk.magenta(`Exam ended on ${new Date()}.`));
};

eventEmitter.on("eventExamStart", startExam);
eventEmitter.on("eventExamEnd", endExam);


function send404(response) {
    response.writeHead(404, { "Content-Type": "application/json" });
    response.write(
        JSON.stringify({
            status: 404,
            message: "Resource not found.",
        })
    );
    response.end();
}

const mimeLookup = {
    ".js": "application/javascript",
    ".html": "text/html",
    ".css": "text/css",
};

const server = http.createServer((req, res) => {
    if (req.method == "GET") {
        let fileurl;
        if (req.url == "/") {
            eventEmitter.emit("eventExamStart");
            fileurl = "assignment.html";
            setTimeout(() => {
                eventEmitter.emit("eventExamEnd");
            }, 3 * 60 * 60 * 1000);
        } else {
            fileurl = req.url;
        }
        let filepath = path.resolve("./" + fileurl);

        let fileExt = path.extname(filepath);
        let mimeType = mimeLookup[fileExt];

        if (!mimeType) {
            send404(res);
            return;
        }
        fs.exists(filepath, (exists) => {
            if (!exists) {
                send404(res);
                return;
            }
            res.writeHead(200, { "Content-Type": mimeType });
            fs.createReadStream(filepath).pipe(res);
        });
    }
});

server.listen(3000, () => {
    console.log(chalk.blue(`Server started on port: 3000`));
});
