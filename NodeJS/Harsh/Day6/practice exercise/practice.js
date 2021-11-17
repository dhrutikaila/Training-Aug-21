// Create a Restful API, which will return Customer list in JSON format.

var express = require("express");
var app = express();
var customers = [
    {
        id: 1,
        name: "manav"
    },
    {
        id: 2,
        name: "raj"
    },
]

app.get("/customers", (req, res) => {
    if (!customers) { res.status(404).send("Ooops... Cant find what you are looking for"); }
    res.send(customers);
});

var server = app.listen(5000, function () {
    console.log("node server is running");
});

// Create a Restful API which will search a particular record from the customer list.

app.get("/customers/:id", (req, res) => {
    var customer = customers.find(c => c.id === parseInt(req.params.id));
    if (!customer) { res.status(404).send("Ooops... Cant find what you are looking for"); }
    res.send(customer);
});

//  Create a Restful API which will insert a new customer object in the customer list.


app.post('/customers', (req, res) => {
    const customer = {
        id: customers.length + 1,
        name: "rahul"
    };
    customers.push(customer);
    res.send(customer);
});

// Create a Restful API which update a name of existing customer whose customer ID is 1

app.put("/customers/:id", (req, res) => {
    var customer = customers.find(c => c.id === parseInt(req.params.id));
    if (!customer) { res.status(404).send("Not Found!!"); }
    customer.name = "raj";
    res.send(customer);
})

// Create a Restful API which will delete a record from the customer list.

app.delete("/customers/:id", (req, res) => {

    var customer = customers.find(c => c.id === parseInt(req.params.id))
    if (!customer) res.status(404).send('Not Found!!');

    var index = customers.indexOf(customer);
    customers.splice(index, 1);
    res.send(customer);
})

