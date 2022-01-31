const express = require("express");
const app = express();
app.use(express.json());

//(1) Create a Restful API, which will return Customer list in JSON format.
// http://localhost:3000/customers

var customer = [
  {
    id: 1,
    Name: "John",
    Email: "john@gmail.com",
    Phone: 9898398908,
  },
  {
    id: 2,
    Name: "Wick",
    Email: "wick@gmail.com",
    Phone: 7772298334,
  },
  {
    id: 3,
    Name: "Virat",
    Email: "virat@gmail.com",
    Phone: 7448835440,
  },
];

app.get("/customers_Details", function (req, res) {
  res.status(200).send(customer);
});

// (2) Create a Restful API which will search a particular record from the customer list.
// http://localhost:3000/customers/1

app.get("/customers_Details/:id", function (req, res) {
  var id = req.params.id;
  var data = customer.find(function (c) {
    if (c.id == id) {
      return c;
    }
  });

  res.status(200).send(data);
});

// (3) Create a Restful API which will insert a new customer object in the customer list.
// http://localhost:3000/customer

app.post("/customers_Details", function (req, res) {
  var data = req.body;
  var newdata = customer.push(data);
  res.send(newdata);
});

// (4) Create a Restful API which update a name of existing customer whose customer ID is 1
// http://locahost:3000/customer

app.put("/customers_Details/:id", function (req, res) {
  var id = req.params.id;
  var Updated_name = req.body.Name;
  var index = customer.findIndex(function (c) {
    if (c.id == id) {
      return c;
    }
  });
  customer[index].Name = Updated_name;
  res.status(200).send(customer[index]);
});

// (4) Create a Restful API which will delete a record from the customer list.
// http://locahost:3000/customer

app.delete("/customers_Details/:id", function (req, res) {
  var id = req.params.id;
  var index = customer.findIndex(function (c) {
    if (c.id == id) {
      return c;
    }
  });

  res.send(customer.splice(index, 1));
});

app.listen(3001, function () {
  console.log("listening on 3001");
});
