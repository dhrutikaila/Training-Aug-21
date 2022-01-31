const express = require('express');
const app = express();
app.use(express.json());

var Students = [
  {
    ID: 1,
    Name: "Reena",
    Address: "Ahmedabad",
    Fees: { Amount: 10000, PaymentDate: "12/12/2020", Status: "true" },
    Result: { Hindi: 80, Eng: 70, Math: 60, Total: 210, Grade: "A" },
  },
  {
    ID: 2,
    Name: "Rita",
    Address: "Surat",
    Fees: { Amount: 12000, PaymentDate: "12/12/2020", Status: "false" },
    Result: { Hindi: 80, Eng: 80, Math: 100, Total: 260, Grade: "A" },
  },
];


// (1)  Create a RESTFUL API which will return a Studentlist.
// http://localhost:3000/students

app.get("/studentlist", function (req, res) {
    res.status(200).send(Students)
})


// (2) Create RESTFUL API which will return a Particular Student Record
// http://localhost:3000/students/1

app.get("/studentlist/:id", function (req, res) {
    var id = req.params.id;

    var index = Students.findIndex(function(s){
        if(s.ID == id){
            return s;
        }
    })

    res.status(200).send(Students[index])
})

// (3)  Create a RESTFUL API which return a particular student FEES Record. 
// Fees field are http://localhost:3000/students/1/fees

app.get("/students/:id/fees", function (req, res) {
        var id = req.params.id;
        console.log(id);
        var index = Students.findIndex(function(s){
            if(s.ID == id){
                return s;
            }
        })
            var fees_data = Students[index].Fees;
            console.log(fees_data);
            res.send(fees_data);
})


// (4)  Create a RESTFUL API which will return a particular student Exam Result. 
// Result Fields are http://localhost:/3000/students/1/result

app.get("/students/:id/result", function (req, res) {
    var id = req.params.id;
    console.log(id);
    var index = Students.findIndex(function(s){
        if(s.ID == id){
            return s;
        }
    })
        var fees_data = Students[index].Result;
        console.log(fees_data);
        res.send(fees_data);
})


// (5)  Create a RESTFUL API which will update a result of result of student id 1. 
// Update the marks for English Subject.

app.put("/students/:id/result", function (req, res) {
    var id = req.params.id;
    var english_mark = req.body.Eng;
    console.log(id);
    var index = Students.findIndex(function(s){
        if(s.ID == id){
            return s;
        }
    })
        Students[index].Result.Eng =english_mark ;
        
        res.send(Students[index].Result);
})
app.listen(3001);