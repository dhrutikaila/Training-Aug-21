// creating a web server with express

var express = require("express");
var bodyparser = require("body-parser");
var app = express();
app.use(bodyparser.urlencoded({ extended: false }));
var books = [
    {
        title: "node",
        id: 1
    },
    {
        title: "mvc",
        id: 2
    },
    {
        title: ".net",
        id: 3
    },
]

// get method

app.get("/", (req, res) => {
    res.send("hello")
})

app.get("/about", (req, res) => {
    res.send("hi")
})

app.get("/html", (req, res) => {
    res.send("<h1>Html</h1>")
})

app.get("/html", (req, res) => {
    res.send("<h1>Html</h1>")
})

app.get("/table", (req, res) => {
    res.send("<table border='1'><tr><th>id</th></tr><tr><td>1</td></tr></table>")
})

app.get("/json", (req, res) => {
    res.send([{ id: 1, name: "Manav" }, { id: 1, name: "Manav" }, { id: 1, name: "Manav" }])
})

app.get("/books/:id", (req, res) => {
    var book = books.find(c => c.id === parseInt(req.params.id));
    if (!book) { res.status(404).send("Ooops... Cant find what you are looking for"); }
    res.send(book);
});

app.get("/books/:title", (req, res) => {
    var book = books.find(c => c.title === (req.params.title));
    if (!book) { res.status(404).send("Ooops... Cant find what you are looking for"); }
    res.send(book);
});

// post method

app.post('/books', (req, res) => {
    const book = {
        id: books.length + 1,
        title: "sql"
    };
    books.push(book);
    res.send(book);
});



var server = app.listen(5000, function () {
    console.log("node server is running");
});

// put method

app.put("/books/:id", (req, res) => {
    var book = books.find(c => c.id === parseInt(req.params.id));
    if (!book) { res.status(404).send("Not Found!!"); }
    book.title = "javascript";
    res.send(book);
})

app.get("/books", (req, res) => {
    res.send(books);
})


// delete method

app.delete("/books/:id", (req, res) => {

    var book = books.find(c => c.id === parseInt(req.params.id))
    if (!book) res.status(404).send('Not Found!!');

    var index = books.indexOf(book);
    books.splice(index, 1);
    res.send(book);
})

app.delete("/customers/:id", (req, res) => {

    var customer = customers.find(c => c.id === parseInt(req.params.id))
    if (!book) res.status(404).send('Not Found!!');

    var index = books.indexOf(book);
    books.splice(index, 1);
    res.send(book);
})

