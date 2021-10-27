const students = [
    {
        name: "Shreya",
        Subject: "Javascript "
    },
    {
        name: "Diya",
        Subject: "SQL"
    }
]

function enrollStudent(student) {
    return new Promise(function (resolve, reject) {
        setTimeout(function () {
            students.push(student)
            console.log("student has been enrolled");
            const error = false;
            if (!error) {
                resolve();
            }
            else {
                reject();
            }
        }, 1000);
    })
}

function getStudent() {
    setTimeout(function () {
        let str = ""
        students.forEach(function (student) {
            str = student.name;
            console.log(str)
        });
        console.log("Student has been fetched")

    }, 2000)
}

let newStu = { name: "Riya", Subject: "Python" }
enrollStudent(newStu).then(function () {
    getStudent();
}).catch(function () {
    console.log("some error");
})
