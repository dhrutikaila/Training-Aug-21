$(document).ready(function(){
    
    //load
    $("button").click(function(){
      $("#div1").load("txt.txt", function(responseTxt, statusTxt, xhr){
        if(statusTxt == "success")
          alert("External content loaded successfully!");
        if(statusTxt == "error")
          alert("Error: " + xhr.status + ": " + xhr.statusText);
      });
      });
});