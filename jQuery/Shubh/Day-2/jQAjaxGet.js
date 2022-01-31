$(document).ready(function(){
    
    //get
    $("button").click(function(){
      $.get("txt.txt", function(data, status){
        alert("Data: " + data + "\nStatus: " + status);
      });
    });
    
});