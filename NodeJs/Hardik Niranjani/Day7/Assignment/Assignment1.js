// Create a Restful API to create an employee,get all employees, get an employees,get an employee,update and employee
// http://localhost:3000/emps

const express = require("express");
const app = express();
const data = require("./data.json");
app.use(express.json());
const router = express.Router();

app.use(function (req, res, next) {
  console.log("url: ", req.url, "method: ", req.method);
  next();
});

// get all employees detail
router.get("/", function (req, res, next) {
  res.json(data);
  next();
});

// get perticular employee from data

router.get("/employees/:id", function (req, res) {
  var id = req.params.id;

  var index_data = data.find(function (s) {
    if (id == s.CitizenshipId) {
      return s;
    }
  });
  res.send(index_data);
});

// updte faxnumber on specific id
router.put("/employees/:id/fax", function (req, res) {
  var id = req.params.id;
  var newfaxno = req.body.fax;
  console.log(newfaxno);
  console.log(id);

  var index = data.findIndex(function (s) {
    if (id == s.CitizenshipId) {
      return s;
    }
  });
  console.log(index);
  data[index].HomeFaxNumber = newfaxno;
  res.send(data[index]);
});

// updte faxnumber on specific id
router.put("/employees/:id", function (req, res) {
  var id = req.params.id;
  var new_data = req.body;
  console.log(id);

  var index = data.findIndex(function (s) {
    if (id == s.CitizenshipId) {
      return s;
    }
  });
  console.log(index);
  data.splice(index, 1, new_data);
  res.send(data);
});

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
const router1  = express.router();
// routing for assignment
router1.use((req, res, next) => {
  console.log("Url: ", req.url, "Method Name: ", req.method);
  next();
});



// get all assignments
router1.get("/assignments/:empid", (req, res) => {
  const id = req.params.empid;
  const emp_data = data.find((d) => {
    return id == d.CitizenshipId
  });
  if (!emp_data) {
    res.send("not a valid employee id");
  }
  res.send(emp_data.assignments);
});



// get specific assignment
router1.get('/assignments/:empid/:assignId',(req,res)=>{
    const emp_id = req.params.empid;
    const assignment_id = req.params.assignId;
    const data1 = data.find((d)=>{
        return d.CitizenshipId == emp_id
    })
    if(!data1){
        res.send('not a valid employee id');
    }
    const assignment = data1.assignments.find((i)=>{
        return i.AssignmentId == assignment_id;
    })
    if(!assignment){
        res.send('not a valid assignment id');
    }
    res.send(assignment)
})

// update specific assignment from specific employee
router1.put('/assignments/:empid/:assignId',(req,res)=>{
    const emp_id = req.params.empid;
    const assignment_id = req.params.assignId;
    const updated_assignment = req.body;
    const data1 = data.find((d)=>{
        return d.CitizenshipId == emp_id;
    })
    if(!data1){
        res.send('not a valid employee id');
        return;
    }
    const assignment = data1.assignments.find((i)=>{
        return i.AssignmentId == assignment_id;
    })
    if(!assignment){
        res.send('not a valid assignment id');
        return;
    }

    const index = data1.assignments.indexOf(assignment);
    data1.assignments.splice(index,1,updated_assignment);
    res.send(data1);

})

app.use("/employees/:empid/child/",router1);

app.listen(3000);
