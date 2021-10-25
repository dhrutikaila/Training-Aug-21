//Callback
var student = [
    { Name: "Deep", Course: "JavaScript", Age: 21 },
    { Name: "Dhruvesh", Course: "Node JS", Age: 21 }
]

var student_add = { Name: "Smite", Course: "React JS", Age: 21 }

const student_enroll = (student_add, callback) => {
    setTimeout(function() {
        student.push(student_add);
        console.log("Student has been enrolled");
        callback();
    }, 3000)
}

const stu_disp = () => {
    setTimeout(function() {
        var str = "";
        for (var i = 0; i < student.length; i++) {
            str += "<li>" + student[i].Name + "</li>";
        }
        document.getElementById("stu_detail").innerHTML = str;
        console.log("Student Display Successfully");
    }, 2000)
}

student_enroll(student_add, stu_disp);

//promises

// var student = [
//     { Name: "Deep", Course: "JavaScript", Age: 21 },
//     { Name: "Dhruvesh", Course: "Node JS", Age: 21 }
// ]

// var student_add = { Name: "Smite", Course: "React JS", Age: 21 }

// var student_enroll = (student_add) => {
//     return new Promise(function(resolve, reject) {
//         setTimeout(function() {
//             student.push(student_add);
//             console.log("Student has been enrolled");
//             var error = false;
//             if (!error) {
//                 resolve();
//             } else {
//                 reject();
//             }
//         }, 3000)
//     });

// }

// const stu_disp = () => {
//     setTimeout(function() {
//         var str = "";
//         for (var i = 0; i < student.length; i++) {
//             str += "<li>" + student[i].Name + "</li>";
//         }
//         document.getElementById("stu_detail").innerHTML = str;
//         console.log("Student Display Successfully");
//     }, 2000)
// }

// student_enroll(student_add)
//     .then(stu_disp)
//     .catch(() => { console.log("Some Error occure") });


//Async/Await

// async function fun() {

//     var promise = new Promise((resolve, reject) => {
//         setTimeout(() => resolve("done!"), 1000)
//     });

//     var result = await promise; // wait until the promise resolves (*)

//     alert(result); // "done!"
// }

// fun().then(() => console.log("Complete Practice file.. "));