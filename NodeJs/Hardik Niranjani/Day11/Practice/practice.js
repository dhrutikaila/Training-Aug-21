const mongoose = require("mongoose");

mongoose
  .connect("mongodb://localhost/day11")
  .then(() => console.log("Connected to Mongodb"));

const movieSchema = new mongoose.Schema({
  category: [String],
  name: { type: String, required: true },
  releseDate: { type: Date, required: true },
  Ticket_Price: { type: Number, required: true, maxValue:3000, minValue:400 },
});

const movie = mongoose.model("movie", movieSchema);

movie.insertMany([
  {
    name: "movie_1",
    date: "2018-01-24",
    category: ["comedy", "drama"],
    Ticket_Price: 650,
  },
  {
    name: "movie_2",
    date: "2019-01-24",
    category: ["comedy", "action"],
    Ticket_Price: 1500,
  },
  {
    name: "movie_3",
    date: "2020-01-24",
    category: ["romentic", "drama"],
    Ticket_Price: 2500,
  },
  {
    name: "movie_4",
    date: "2021-01-24",
    category: ["comedy", "drama"],
    Ticket_Price: 1100,
  },
]);



// ------------------------------------------------------------------------------------------------

// find movie which is comedy and ticketPrice is less then 1500

 function findComedy(){
    const C_movie = movie.find({
        Ticket_Price:{ $lt:1500},
        category:{$in: ["comedy"]}
    })

    console.log(C_movie);
}

findComedy();


