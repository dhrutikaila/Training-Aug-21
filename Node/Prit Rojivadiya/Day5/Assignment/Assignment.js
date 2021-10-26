/*
University of Mumbai needs to set an online exam for their students. 
For that they need to set a timer for three hours. After 3 hours exams should be finished.
Note: Use promises and callbacks
Once Exam is started start event should be invoke and When we end the exam end event should be call.
*/
const EventEmitter = require("events");

const readline = require("readline").createInterface({
  input: process.stdin,
  output: process.stdout,
});

const emitter = new EventEmitter();

emitter.on("start", () => {
  console.log("Exam started");
});

emitter.on("end", () => {
  console.log("Exam finished");
});

function startExam() {
  return new Promise((resolve, reject) => {
    
    readline.on('line', (input) => {
        if (input == "submit") {
          resolve();
          readline.close();
        }
      });

    emitter.emit("start");
    let s = 0;
    let m = 0;
    let h = 0;
    myTime = setInterval(() => {
      if (s >= 60) {
        s = 0;
        m = m + 1;
      }
      if (m >= 60) {
        h = h + 1;
        m = 0;
        s = 0;
      }
      if (s == 10) {
        resolve();
      }
      console.log(`${h}:${m}:${s}`);
      s = s + 1;
    }, 1000);
  });
}

readline.question(`Do you want to start exam? yes or no: `,(input)=>{
    if(input == 'yes'){
        startExam().then(() => {
            clearInterval(myTime);
            emitter.emit("end");
            readline.close();
          });
    }else{
        readline.setPrompt('When you will type "yes" your exam will start: ');
        readline.prompt();
        readline.on('line',(input)=>{
            if(input == 'yes'){
                startExam().then(() => {
                    clearInterval(myTime);
                    emitter.emit("end");
                    readline.close();
                  });
            }else{
                readline.prompt();
            }
        })
    }
})
