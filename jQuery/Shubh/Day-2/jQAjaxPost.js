$(document).ready(function(){
  $("button").click(function(){
    $.post("post.txt",
    {
      name: "Donald Duck",
      city: "Duckburg"
    },
    function(data,status){
      alert("Data: " + data + "\nStatus: " + status);
    });
  });
});