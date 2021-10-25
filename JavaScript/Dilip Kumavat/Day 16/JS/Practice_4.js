var arr = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
const para = document.getElementById("para");
const date = new Date();
para.classList+="display-5 fw-bold text-primary"
para.innerHTML += "<span class=\"text-dark\">DATE =</span> "+(("0"+date.getDate())).slice(-2)+"-"+(("0"+date.getMonth())).slice(-2)+"-"+((date.getFullYear()))
para.innerHTML += "<br><span class=\"text-dark\">DAY     &nbsp;&nbsp;= </span> "+arr[date.getDay()]
para.innerHTML += "<br><span class=\"text-dark\">TIME  =</span> "+(("0"+date.getHours())).slice(-2)+" : "+(("0"+date.getMinutes())).slice(-2)+" : "+(("0"+date.getSeconds())).slice(-2)