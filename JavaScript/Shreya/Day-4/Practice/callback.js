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
        setTimeout(function () {
            students.push(student)
            console.log("student has been enrolled");
        }, 4000);
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
enrollStudent(newStu);
getStudent()