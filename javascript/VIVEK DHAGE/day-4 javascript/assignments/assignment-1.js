const startbtn = document.getElementById("start-btn");


startbtn.addEventListener("click",()=>{
  startbtn.style.display = "none";

  console.log("exam is started");

  const examst = document.getElementById("status");
  examst.innerHTML = "started";



  setTimeout(()=>{
    console.log("stopped");
    examst.innerHTML = "over";
  }, 5000);// for 5 seconds just to check
})
