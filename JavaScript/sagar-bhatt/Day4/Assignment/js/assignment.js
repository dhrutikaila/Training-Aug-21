// * University of Mumbai needs to set an online exam for their students. For that they need to set a timer for three hours. After 3 hours exams should be finished.
document.body.onload = () => {
  let btnStartTest = document.getElementById("btnStartTest");
  let btnSubmitTest = document.getElementById("btnSubmitTest");
  let timer = document.getElementById("timer");
  let examTimer;
  let questions = document.getElementById("questions");
  let alert = document.getElementById("alert");

  btnSubmitTest.style.display = "none";
  timer.style.display = "none";
  questions.style.display = "none";

  function fnDisplayQuestions(mcqQuestion, ...options) {
    let mcqQuestionElement = document.createElement("div");
    let countElements = questions.childNodes.length + 1;
    let mcqQuestionText = document.createTextNode(
      countElements + ". " + mcqQuestion
    );
    mcqQuestionElement.appendChild(mcqQuestionText);
    questions.appendChild(mcqQuestionElement);
    for (i of options) {
      let countOptElements = mcqQuestionElement.childNodes.length;
      let rbOption = document.createElement("input");
      let optionsElement = document.createElement("div");
      optionsElement.className = "ps-md-5";
      let optionsCountText = document.createTextNode(countOptElements + ") ");
      let optionsText = document.createTextNode(" " + i);
      rbOption.type = "radio";
      rbOption.name = "radio" + countElements;
      optionsElement.appendChild(optionsCountText);
      optionsElement.appendChild(rbOption);
      optionsElement.appendChild(optionsText);
      mcqQuestionElement.appendChild(optionsElement);
    }
    let brElement = document.createElement("br");
    mcqQuestionElement.appendChild(brElement);
  }
  fnDisplayQuestions(
    "JavaScript is a _____ language.",
    "Object-Oriented",
    "High-level",
    "Assembly-language",
    "Object-Based"
  );
  fnDisplayQuestions(
    "JavaScript is ideal to _____.",
    "make computations in HTML simpler",
    "minimize storage requirements on the web server",
    "increase the download time for the client",
    "increase the loading time of the website"
  );
  fnDisplayQuestions(
    "Which of the following is not considered as an error in JavaScript?",
    "Syntax error",
    "Missing of semicolons",
    "Division by zero",
    "Missing of Bracket"
  );
  fnDisplayQuestions(
    "JavaScript can be written _____.",
    "directly into JS file and included into HTML",
    "directly on the server page",
    "directly into HTML pages",
    "directly into the css file"
  );
  fnDisplayQuestions(
    "The expression of calling (or executing) a function or method in JavaScript is called _____.",
    "Primary expression",
    "Functional expression",
    "Invocation expression",
    "Property Access Expression"
  );

  function fnSubmitTest() {
    btnSubmitTest.style.display = "none";
    btnStartTest.style.display = "inline-block";
    timer.style.display = "none";
    questions.style.display = "none";
    let rbSelected = document.querySelectorAll("input[name*='radio']");
    for (i of rbSelected) {
      i.checked = false;
    }
    clearInterval(examTimer);
    alert.innerHTML = `<div class="alert alert-dismissible bg-warning bg-opacity-25">
    Thank you! You have finished your test.
    <button class="btn-close" data-bs-dismiss="alert"></button>
  </div>`;
  }

  timer.appendChild(document.createTextNode(``));
  btnStartTest.onclick = () => {
    btnStartTest.style.display = "none";
    btnSubmitTest.style.display = "inline-block";
    timer.style.display = "inline-block";
    questions.style.display = "block";

    let date = new Date();
    let countDownDate = date.setHours(date.getHours() + 3);
    countDownDate = date.setSeconds(date.getSeconds() + 1);
    timer.replaceChild(document.createTextNode(`3h 00m 00s`), timer.lastChild);
    examTimer = setInterval(() => {
      let now = new Date().getTime();
      let distance = countDownDate - now;
      let hours = Math.floor(
        (distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
      );
      let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      let seconds = Math.floor((distance % (1000 * 60)) / 1000);
      timer.replaceChild(
        document.createTextNode(` ${hours}h ${minutes}m ${seconds}s`),
        timer.lastChild
      );
      if (distance < 0) {
        // clearInterval(examTimer);
        // questions.innerHTML = "Thank You!";
        fnSubmitTest();
      }
    }, 1000);
  };

  btnSubmitTest.onclick = () => {
    fnSubmitTest();
  };
};
