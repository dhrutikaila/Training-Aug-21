const mongoose = require("mongoose");

mongoose
  .connect("mongodb://localhost/day10")
  .then(() => console.log("Connected to Mongodb"));

const bookSchema = new mongoose.Schema({
  name: { type: String, required: true },
  author: { type: String, required: true },
  price: { type: Number, required: true, minValue: 100, maxValue: 1500 },
});

const book = mongoose.model("Book", bookSchema);

book
  .insertMany([
    { name: "book1", author: "author_1", price: 250 },
    { name: "book2", author: "author_2", price: 1250 },
    { name: "book3", author: "author_3", price: 650 },
  ])
  .then(() => {
    console.log("successfully inserted");
  });

// ----------------------------------------------------------------

const ResultSchema = new mongoose.Schema({
  id: Number,
  Marks: [Number],
});

const result = mongoose.model("result", ResultSchema);

result
  .insertMany([
    { id: 1, Marks: [70, 80, 80, 95, 56] },
    { id: 2, Marks: [66, 90, 92, 64, 54] },
    { id: 3, Marks: [85, 100, 90, 56] },
  ])
  .then(() => {
    console.log("successfully inserted");
  });

//  ********************
// Array oprator

// update data
result.updateOne(
  { id: 1, result: 80 },
  { $set: { "result.$": 93 } },
  (err, doc) => {
    if (err) {
      return console.log("Data not found");
    }
    console.log(doc);
  }
);

// insert data
result.updateOne(
  { id: 3 },
  {
    $addToSet: { Marks: 100 },
  },
  (err, doc) => {
    if (err) {
      return console.log("Data not found");
    }
    console.log("added successfully");
    console.log(doc);
  }
);

//  ********************

// less then oprator
book.find(
  {
    price: {
      $lt: 500,
    },
  },
  (err, doc) => {
    if (err) {
      return console.log("Data not found");
    }
    console.log("Data found!");
    console.log(doc);
  }
);

// greater then oprator
book.find(
  {
    price: {
      $gt: 1000,
    },
  },
  (err, doc) => {
    if (err) {
      return console.log("Data not found");
    }
    console.log("Data found!");
    console.log(doc);
  }
);
