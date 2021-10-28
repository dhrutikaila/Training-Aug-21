// load()
$(document).ready(function(){
    $(".button1").click(function(){
      $("#div1").load("http://127.0.0.1:5500/Vraj%20Marvania/Day2/Practice/ajax/files/demo_ajax.json",function(status){
 console.log(status);
      });
    });
  });

  // get()
  $(document).ready(function(){
    $(".button2").click(function(){
      $.get("http://127.0.0.1:5500/Vraj%20Marvania/Day2/Practice/ajax/files/demo_test.txt", function(data, status){
        console.log("Data: " + data + "\nStatus: " + status);
      });
    });
  });

  // getJSON()
  $(document).ready(function(){
    $(".button3").click(function(){
        $.getJSON("http://127.0.0.1:5500/Vraj%20Marvania/Day2/Practice/ajax/files/demo_ajax.json",function(data,status){
            $.each(data.employees,function(i, field){
                $("#jsonans").append(field.firstName+"<br>") ;
            })
           
        })
    });
  });

  // getScript()
  $(document).ready(function(){
    $(".button4").click(function(){
        $.getScript("http://127.0.0.1:5500/Vraj%20Marvania/Day2/Practice/ajax/files/demo.js");
    });
  });

 