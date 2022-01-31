const startExambtn = document.getElementById("startExam");



startExambtn.addEventListener("click", () => {
    startExambtn.style.display = "none";

    //open new window with exam content
    myWindow = window.open("http://127.0.0.1:5500/Assignment/exam/exam.html", "width=300", "height=300");
    myWindow.resizeBy(1200, 720);
    console.log("exam is started");

    const examSt = document.getElementById("st");
    //update status to Exam is started
    examSt.innerHTML = "started";

    //after 1 hour status change to Exam is over
    setTimeout(() => {
        console.log("exam is over");
        examSt.innerHTML = "over";
    }, 60 * 60 * 1000);
})
