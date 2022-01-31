var express = require("express");
var app = express();
var employees = require("./data/employee.json");
app.use(express.json());
var router = express.Router();
app.use("/", router);

function logdate(req, res, next) {
    var date = new Date();
    console.log(date);
    next();
}

// get all employees
router.get("/emp", logdate, function (req, res, next) {
    res.send(employees);
    next();
})


// get an employee

router.get("/emp/:id", logdate, function (req, res, next) {
    var employee = employees.find(c => c.EmployeeId === parseInt(req.params.id))

    if (!employee) {
        console.error(
            JSON.stringify({
                status: 404,
                message: "Employee Not Found",
            })

        );
        res.status(404).send({
            status: 404,
            message: "Employee Not Found",
        });
    } else {
        res.send(employee);
    }
    next();
});

// update an employee

router.put("/emp/:id", logdate, (req, res, next) => {
    var employee = employees.find(c => c.EmployeeId === parseInt(req.params.id));
    if (!employee) {
        console.error(
            JSON.stringify({
                status: 404,
                message: "Employee Not Found",
            })

        );
        res.status(404).send({
            status: 404,
            message: "Employee Not Found",
        });
    }
    else {
        employee.AddressLine1 = req.body.AddressLine1;
        res.send(employee);
    }
    next();
})

app.listen(3000);


// create an employee

router.post('/emp', logdate, (req, res, next) => {
    const employee = {
        EmployeeId: employees.length + 1,
        AddressLine1: "sql"
    };
    employees.push(employee);
    res.send(employee);
    next();
});


// delete an employee

app.delete("/emp/:id", logdate, (req, res, next) => {

    var employee = employees.find(c => c.EmployeeId === parseInt(req.params.id))
    if (!employee) res.status(404).send('Not Found!!');

    var index = employees.indexOf(employee);
    employees.splice(index, 1);
    res.send(employee);
    next();
})

// create an assignments api
// get all assignments

router.get("/emp/:id/child/assignments", logdate, function (req, res, next) {
    var employee = employees.find(c => c.EmployeeId === parseInt(req.params.id))

    if (!employee) {
        console.error(
            JSON.stringify({
                status: 404,
                message: "Employee Not Found",
            })

        );
        res.status(404).send({
            status: 404,
            message: "Employee Not Found",
        });
    } else {
        res.send(employee.assignments);
    }
    next();
});

// get an assignment

router.get("/emp/:id/child/assignments/:AssignmentID", logdate, (req, res, next) => {
    const employee = employees.find(
        c => c.EmployeeId === parseInt(req.params.id)
    );
    const assignment = employees.find(
        c =>
            c.assignments[0].AssignmentId === parseInt(req.params.AssignmentID)
    );

    if (!employee) {
        console.error(

            JSON.stringify({
                status: 404,
                message: "Employee Not Found",
            })
        );
        res.status(404).send({
            status: 404,
            message: "Employee Not Found",
        });
    } else if (!assignment) {
        console.error(
            JSON.stringify({
                status: 404,
                message: "Assignment Not Found",
            })
        );
        res.status(404).send({
            status: 404,
            message: "Assignment Not Found",
        });
    } else {
        res.send(employee.assignments);
    }
    next();
});

// update an assignment

router.put("/emp/:id/child/assignments/:AssignmentID", logdate, (req, res, next) => {
    const employee = employees.find(
        c => c.EmployeeId === parseInt(req.params.id)
    );
    const assignment = employees.find(
        c =>
            c.assignments[0].AssignmentId === parseInt(req.params.AssignmentID)
    );

    if (!employee) {
        console.error(

            JSON.stringify({
                status: 404,
                message: "Employee Not Found",
            })
        );
        res.status(404).send({
            status: 404,
            message: "Employee Not Found",
        });
    } else if (!assignment) {
        console.error(
            JSON.stringify({
                status: 404,
                message: "Assignment Not Found",
            })
        );
        res.status(404).send({
            status: 404,
            message: "Assignment Not Found",
        });
    } else {
        employee.assignments[0].AssignmentName = req.body.AssignmentName;
        res.send(employee.assignments);
    }
    next();
});







